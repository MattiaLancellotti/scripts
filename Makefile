# Needed programs
STOW = stow
TAR  = bsdtar
GZIP = gzip
RM   = rm --recursive --force

# Common prefixes and paths
prefix = $(HOME)/.local

# Important directories:
#   - The stow directory is the location of the all the packages;
#   - The target directory is the path in which programs appears to be
#     installed;
#   - The directory to which files will be copied;
#   - The local directory of the package;
STOWDIR = $(datarootdir)/stow
sbindir = $(prefix)/bin
datarootdir = $(prefix)/share
TOOLDIR = tools/

# Important files and names
#   - All the files contained in the root of the project;
PROJDIR := $(wildcard ./*)
TARNAME = mattia\'s-shitty-scripts.tar
ZIPNAME = $(TARNAME).gzip

COMMON_FLAGS = --verbose=1 --target=$(sbindir) --dir=$(STOWDIR)
TFLAGS = --create --verbose --file $(TARNAME)
GFLAGS = --synchronous --keep --recursive

INSTALL_PROGRAM = $(STOW) $(COMMON_FLAGS)

# Preparing the directory and copying the files
$(TOOLDIR)($(TOOLDIR)*): $(STOWDIR)/$(TOOLDIR)
	@echo "Preparing the package."
	cp --recursive --verbose $% $(STOWDIR)/$(TOOLDIR)

$(STOWDIR)/$(TOOLDIR):
	@echo "Creating the stow directory ($(STOWDIR))."
	mkdir -p $(STOWDIR) $(sbindir) $(STOWDIR)/$(TOOLDIR)

.PHONY: install uninstall dist
install:
	@echo "Installing your package."
	$(INSTALL_PROGRAM) --stow $(TOOLDIR)
	@echo "Installation finished."

# Removing links (or unstowing) the files in $(TARGDIR)
uninstall:
	@echo "Uninstalling your package."
	$(INSTALL_PROGRAM) --delete $(TOOLDIR)
	@echo "Done."

# Creating a .tar.gz package
dist:
	@echo "Packaging everything nicely."
	$(TAR) $(TFLAGS) $(PROJDIR)
	$(GZIP) $(GFLAGS) $(TARNAME)
	$(RM) $(TARNAME)
	@echo "Done."
