# Place this makefile in the root of the psarc (i.e. next to the folders called built, packed, and levels)

#------------------------------------------------------------------
#	LUAC: Path to luac.exe
#	LEVEL: The name of the level in the files, for example, The Great Clock Sector 1 from ACiT is called great_clock_a in the files
#------------------------------------------------------------------

LUAC	=	
LEVEL	=	

#------------------------------------------------------------------

LUA_INT_SIZE			=	32
LUA_LUA_NUMBER_SIZE		=	32
LUA_ENDIANESS			=	big

SOURCE	=	./levels/$(LEVEL)/scripts 


# Done to put each command on a new line cos i'm dumb
define NEWLINE


endef

# Get all lua files
export SOURCES	:=	$(foreach file,$(SOURCE),$(wildcard $(file)/*.lua))
SOURCES	+=	$(foreach file,$(SOURCE),$(wildcard $(file)/*/*.lua))			#I need a better way to do this

# Make a list of commands to compile eacj lua script
export TARGETS	=	$(foreach file,$(SOURCES),$(LUAC) -s -cci $(LUA_INT_SIZE) -ccn float $(LUA_LUA_NUMBER_SIZE) -cce $(LUA_ENDIANESS) -o built/$(basename $(file)).lc $(file)$(NEWLINE))


all:
	$(TARGETS)