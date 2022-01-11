# Needed programs
STOW = stow
TAR  = bsdtar
GZIP = gzip
RM   = rm

# Important directories:
#   - The stow directory is the location of the all the packages;
#   - The target directory is the path in which programs appears to be
#     installed;
#   - The local directory of the package;
STOWDIR = /usr/local/stow
TARGDIR = /usr/local
TOOLDIR = tools/

# Important files and names
#   - All the files contained in the root of the project;
PROJDIR := $(wildcard ./*)
TARNAME = utilities-1.0.0.tar
ZIPNAME = $(TARNAME).gzip

IFLAGS = --verbose=1 --target=$(TARGDIR) --dir=$(STOWDIR) --stow
UFLAGS = --verbose=1 --target=$(TARGDIR) --dir=$(STOWDIR) --delete
TFLAGS = --create --verbose --file $(TARNAME)
GFLAGS = --synchronous --keep --recursive
RFLAGS = --recursive --force

# Preparing the directory and copying the files
$(STOWDIR)/$(TOOLDIR):
	@echo "Creating the stow directory ($(STOWDIR))."
	mkdir -p $(STOWDIR)
	@echo "Preparing the package."
	cp -rv $(TOOLDIR) $(STOWDIR)

.PHONY: install uninstall dist
install:
	@echo "Installing your package."
	$(STOW) $(IFLAGS) $(TOOLDIR)
	@echo "Installation finished."

# Removing links (or unstowing) the files in $(TARGDIR)
uninstall:
	@echo "Unstowing your package."
	$(STOW) $(UFLAGS) $(TOOLDIR)
	@echo "Unstowed."

# Creating a .tar.gz package
dist:
	@echo "Packaging everything nicely."
	$(TAR) $(TFLAGS) $(PROJDIR)
	$(GZIP) $(GFLAGS) $(TARNAME)
	$(RM) $(RFLAGS) $(TARNAME)
	@echo "Done."
