#https://opensource.com/article/18/8/what-how-makefile
#https://stackoverflow.com/questions/17834582/run-make-in-each-subdirectory
#

# Usage:
# make        # compile all binary
# make clean  # remove ALL binaries and objects

.PHONY = all clean

CC = gcc                        # compiler to use

LINKERFLAG = -lm

SRCS := $(wildcard *.c)
BINS := $(SRCS:%.c=%)

all: ${BINS}

%: %.o
        @echo "Checking.."
        ${CC} ${LINKERFLAG} $< -o $@

%.o: %.c
        @echo "Creating object.."
        ${CC} -c $<

clean:
        @echo "Cleaning up..."
        rm -rvf *.o ${BINS}


# include othermakefile.mk
# evn variables: ${ENV_VAR} or $(ENV_VAR)

# recurse in directories:
# TOPTARGETS := all clean

# SUBDIRS := $(wildcard */.)

# $(TOPTARGETS): $(SUBDIRS)
# $(SUBDIRS):
#         $(MAKE) -C $@ $(MAKECMDGOALS)

# .PHONY: $(TOPTARGETS) $(SUBDIRS)
# MAECMDGOALS are the command line goals
# .DEFAULT_GOAL sets the default goal if
# empty the first goal is the default
# multiline comments: add '\' at end of line
