# Needed programs
SHELL = /bin/sh
STOW = stow
TAR  = bsdtar
GZIP = gzip
RM   = rm --recursive --force

# Common prefixes and paths
prefix = $(HOME)/.local

# Important directories:
#   - The target directory is the path in which programs appears to be
#     installed;
#   - The stow directory is the location of the all the packages;
sbindir = $(prefix)/bin
STOWDIR = ./

# Important files and names
#   - All the files contained in the root of the project;
PROJDIR := $(wildcard ./*)
TARNAME = mattia\'s-shitty-scripts.tar
ZIPNAME = $(TARNAME).gzip

COMMON_FLAGS = --verbose=1 --target=$(sbindir) --dir=$(STOWDIR)
TFLAGS = --create --verbose --file $(TARNAME)
GFLAGS = --synchronous --keep --recursive

INSTALL_PROGRAM = $(STOW) $(COMMON_FLAGS)

.PHONY: install uninstall dist
install:
	@echo "Installing your package."
	$(INSTALL_PROGRAM) --stow tools
	@echo "Installation finished."

# Removing links (or unstowing) the files in $(TARGDIR)
uninstall:
	@echo "Uninstalling your package."
	$(INSTALL_PROGRAM) --delete tools
	@echo "Done."

# Creating a .tar.gz package
dist:
	@echo "Packaging everything nicely."
	$(TAR) $(TFLAGS) $(PROJDIR)
	$(GZIP) $(GFLAGS) $(TARNAME)
	$(RM) $(TARNAME)
	@echo "Done."

.DEFAULT = install
