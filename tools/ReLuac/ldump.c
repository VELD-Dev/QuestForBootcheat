/*
** $Id: ldump.c,v 1.4 2003/02/11 23:52:12 lhf Exp $
** save bytecodes
** See Copyright Notice in lua.h
*/

#include <stddef.h>
#include <stdint.h>
#include <string.h>

#define ldump_c

#include "lua.h"

#include "lobject.h"
#include "lopcodes.h"
#include "lstate.h"
#include "lundump.h"

#define DumpVector(b,n,size,D)	DumpBlock(b,(n)*(size),D)
#define DumpLiteral(s,D)	DumpBlock("" s,(sizeof(s))-1,D)
#define DumpVar(x,D)	DumpBlock(&x, sizeof(x),D)

//Edit the following and recompile to change the output version, currently configured for resistance 1, ratchet and clank tools of destruction, ratchet and clank quest for booty
//LUACC_ENDIAN: 1 = little endian, 0 == big endian
#define LUACC_ENDIAN 1
#define LUACC_INTSIZE 4
#define LUACC_SIZETSIZE 4
#define LUACC_LUA_NUMBERSIZE 4
#define LUACC_LUA_NUMBERINTEGRAL 0

typedef struct {
 lua_State* L;
 lua_Chunkwriter write;
 void* data;
} DumpState;

static void MaybeByteSwap(char *number, size_t numbersize, DumpState *D)
{
 if (LUACC_ENDIAN != luaU_endianness())
 {
  int i;
  for (i=0; i<numbersize/2; i++)
  {
   char temp = number[i];
   number[i] = number[numbersize-1-i];
   number[numbersize-1-i] = temp;
  }
 }
}

static void DumpBlock(const void* b, size_t size, DumpState* D)
{
 lua_unlock(D->L);
 (*D->write)(D->L,b,size,D->data);
 lua_lock(D->L);
}

static void DumpByte(int y, DumpState* D)
{
 char x=(char)y;
 DumpBlock(&x,sizeof(x),D);
}

static void DumpIntWithSize(int x, int sizeof_int, DumpState* D)
{
	switch(sizeof_int)
	{
   case 1:{
    DumpByte(x, D);
   } break;
   case 2:{
    int16_t y = x;
    MaybeByteSwap((char*)&y, 2, D);
    DumpVar(y, D);
   } break;
   case 4:{
    int32_t y = x;
    MaybeByteSwap((char*)&y, 4, D);
    DumpVar(y, D);
   } break;
 }
}

static void DumpInt(int x, DumpState* D)
{
 DumpIntWithSize(x,LUACC_INTSIZE,D);
}

static void DumpSize(size_t x, DumpState* D)
{
	switch(LUACC_SIZETSIZE)
	{
   case 1:{
    DumpByte(x, D);
   } break;
   case 2:{
    uint16_t y = x;
    MaybeByteSwap((char*)&y, 2, D);
    DumpVar(y, D);
   } break;
   case 4:{
    uint32_t y = x;
    MaybeByteSwap((char*)&y, 4, D);
    DumpVar(y, D);
   } break;
 }
}

static void DumpNumber(lua_Number x, DumpState* D)
{
 if(LUACC_LUA_NUMBERINTEGRAL)
 {
  DumpIntWithSize(x, LUACC_LUA_NUMBERSIZE, D);
 }
 else
 {
   switch(LUACC_LUA_NUMBERSIZE)
   {
    case 4: {
     float y = x;
     MaybeByteSwap((char*)&y, 4, D);
     DumpVar(y, D);
    } break;
    case 8: {
     double y = x;
     MaybeByteSwap((char*)&y, 8, D);
     DumpVar(y, D);
    } break;
   }
 }
}

static void DumpString(TString* s, DumpState* D)
{
 if (s==NULL || getstr(s)==NULL)
  DumpSize(0,D);
 else
 {
  size_t size=s->tsv.len+1;		/* include trailing '\0' */
  DumpSize(size,D);
  DumpBlock(getstr(s),size,D);
 }
}

static void DumpCode(const Proto* f, DumpState* D)
{
 DumpInt(f->sizecode,D);
 char buf[10];
 int i;
 for (i=0; i<f->sizecode; i++)
 {
  memcpy(buf,&f->code[i],sizeof(Instruction));
  MaybeByteSwap(buf,sizeof(Instruction),D);
  DumpBlock(buf,sizeof(Instruction),D);
 }
}

static void DumpLocals(const Proto* f, DumpState* D)
{
 int i,n=f->sizelocvars;
 DumpInt(n,D);
 for (i=0; i<n; i++)
 {
  DumpString(f->locvars[i].varname,D);
  DumpInt(f->locvars[i].startpc,D);
  DumpInt(f->locvars[i].endpc,D);
 }
}

static void DumpLines(const Proto* f, DumpState* D)
{
 DumpInt(f->sizelineinfo,D);
 for(int i = 0; i < f->sizelineinfo; i++)
 {
  DumpIntWithSize(f->lineinfo[i], sizeof(*f->lineinfo), D);
 }
}

static void DumpUpvalues(const Proto* f, DumpState* D)
{
 int i,n=f->sizeupvalues;
 DumpInt(n,D);
 for (i=0; i<n; i++) DumpString(f->upvalues[i],D);
}

static void DumpFunction(const Proto* f, const TString* p, DumpState* D);

static void DumpConstants(const Proto* f, DumpState* D)
{
 int i,n;
 DumpInt(n=f->sizek,D);
 for (i=0; i<n; i++)
 {
  const TObject* o=&f->k[i];
  DumpByte(ttype(o),D);
  switch (ttype(o))
  {
   case LUA_TNUMBER:
	DumpNumber(nvalue(o),D);
	break;
   case LUA_TSTRING:
	DumpString(tsvalue(o),D);
	break;
   case LUA_TNIL:
	break;
   default:
	lua_assert(0);			/* cannot happen */
	break;
  }
 }
 DumpInt(n=f->sizep,D);
 for (i=0; i<n; i++) DumpFunction(f->p[i],f->source,D);
}

static void DumpFunction(const Proto* f, const TString* p, DumpState* D)
{
 DumpString((f->source==p) ? NULL : f->source,D);
 DumpInt(f->lineDefined,D);
 DumpByte(f->nups,D);
 DumpByte(f->numparams,D);
 DumpByte(f->is_vararg,D);
 DumpByte(f->maxstacksize,D);
 DumpLines(f,D);
 DumpLocals(f,D);
 DumpUpvalues(f,D);
 DumpConstants(f,D);
 DumpCode(f,D);
}

static void DumpHeader(DumpState* D)
{
 DumpLiteral(LUA_SIGNATURE,D);
 DumpByte(VERSION,D);
 DumpByte(LUACC_ENDIAN,D);
 DumpByte(LUACC_INTSIZE,D);
 DumpByte(LUACC_SIZETSIZE,D);
 DumpByte(sizeof(Instruction),D);
 DumpByte(SIZE_OP,D);
 DumpByte(SIZE_A,D);
 DumpByte(SIZE_B,D);
 DumpByte(SIZE_C,D);
 DumpByte(LUACC_LUA_NUMBERSIZE,D);
 DumpNumber(TEST_NUMBER,D);
}

/*
** dump function as precompiled chunk
*/
void luaU_dump (lua_State* L, const Proto* Main, lua_Chunkwriter w, void* data)
{
 DumpState D;
 D.L=L;
 D.write=w;
 D.data=data;
 DumpHeader(&D);
 DumpFunction(Main,NULL,&D);
}

