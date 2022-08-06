# Place this makefile in the root of the psarc (i.e. next to the folders called built, packed, and levels)

#------------------------------------------------------------------
#	LUAC: Path to edited luac-5.0.3.exe
#	LEVEL: The name of the level in the files, for example, The Metropolis from ToD is called metropolis in the files, put speech marks around it if it has spaces
#------------------------------------------------------------------

LUAC	=	
LEVEL	=	

#------------------------------------------------------------------

SOURCE	=	./levels/$(LEVEL)/scripts 


# Done to put each command on a new line cos i'm dumb
define NEWLINE


endef

# Get all lua files
export SOURCES	:=	$(foreach file,$(SOURCE),$(wildcard $(file)/*.lua))
SOURCES	+=	$(foreach file,$(SOURCE),$(wildcard $(file)/*/*.lua))			#I need a better way to do this

# Make a list of commands to compile eacj lua script
export TARGETS	=	$(foreach file,$(SOURCES),$(LUAC) -s -o built/$(basename $(file)).lc $(file)$(NEWLINE))


all:
	$(TARGETS)