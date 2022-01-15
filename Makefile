# Needed programs
STOW = stow
TAR  = bsdtar
GZIP = gzip
RM   = rm

# Common prefixes and paths
prefix = $(HOME)/.local
sbindir = $(prefix)/bin
datarootdir = $(prefix)/share

# Important directories:
#   - The stow directory is the location of the all the packages;
#   - The target directory is the path in which programs appears to be
#     installed;
#   - The local directory of the package;
STOWDIR = $(datarootdir)/stow
TARGDIR = $(sbindir)
TOOLDIR = tools/

# Important files and names
#   - All the files contained in the root of the project;
PROJDIR := $(wildcard ./*)
TARNAME = utilities-1.0.0.tar
ZIPNAME = $(TARNAME).gzip

COMMON_FLAGS = --verbose=1 --target=$(TARGDIR) --dir=$(STOWDIR)
TFLAGS = --create --verbose --file $(TARNAME)
GFLAGS = --synchronous --keep --recursive
RFLAGS = --recursive --force

INSTALL_PROGRAM = $(STOW) $(COMMON_FLAGS)

# Preparing the directory and copying the files
$(STOWDIR)/$(TOOLDIR):
	@echo "Creating the stow directory ($(STOWDIR))."
	mkdir -p $(STOWDIR) $(TARGDIR)
	@echo "Preparing the package."
	cp -rv $(TOOLDIR) $(STOWDIR)

.PHONY: install uninstall dist
install:
	@echo "Installing your package."
	$(INSTALL_PROGRAM) --stow $(TOOLDIR)
	@echo "Installation finished."

# Removing links (or unstowing) the files in $(TARGDIR)
uninstall:
	@echo "Unstowing your package."
	$(INSTALL_PROGRAM) --delete $(TOOLDIR)
	@echo "Unstowed."

# Creating a .tar.gz package
dist:
	@echo "Packaging everything nicely."
	$(TAR) $(TFLAGS) $(PROJDIR)
	$(GZIP) $(GFLAGS) $(TARNAME)
	$(RM) $(RFLAGS) $(TARNAME)
	@echo "Done."
