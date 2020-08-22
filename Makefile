#
# basic makefile:
#	run "make" to build it
#	run "make install" to install it for a user
#	run "make sysinstall" to install it for everyone
#
# only the program is installed, not the videos
#

slowcat: slowcat.c

signature: signature.c
	@echo Lots of warnings are expected for this program
	gcc -std=c89 -o signature signature.c -lm

# XDG directory spec has the user's local bin directory in $HOME/.local/bin/
# Traditional location is $HOME/bin/
# Try both, but only if on the user's $PATH
install: slowcat
	case "$$PATH:" in */.local/bin:*) mkdir -p $$HOME/.local/bin/; cp slowcat $$HOME/.local/bin/ ;; esac
	case ":$$PATH:" in *:$$HOME/bin:*) mkdir -p $$HOME/bin/; cp slowcat $$HOME/bin/ ;; esac

sysinstall: slowcat
	cp slowcat /usr/bin/

.PHONEY: install sysinstall
