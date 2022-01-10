# Needed programs
STOW = stow

# Important directories:
#   - The stow directory is the location of the all the packages;
#   - The target directory is the path in which programs appears to be
#     installed;
#   - The local directory of the package;
STOWDIR = /usr/local/stow
TARGDIR = /usr/local
TOOLDIR = tools/

IFLAGS = --verbose=1 --target=$(TARGDIR) --dir=$(STOWDIR) --stow
UFLAGS = --verbose=1 --target=$(TARGDIR) --dir=$(STOWDIR) --delete

# Preparing the directory and copying the files
$(STOWDIR)/$(TOOLDIR):
	@echo "Creating the stow directory ($(STOWDIR))."
	@mkdir -p $(STOWDIR)
	@echo "Preparing the package."
	@cp -rv $(TOOLDIR) $(STOWDIR)

.PHONY: config uninstall
config:
	@echo "Installing your package."
	@$(STOW) $(IFLAGS) $(TOOLDIR)
	@echo "Installation finished."

# Removing links (or unstowing) the files in $(TARGDIR)
uninstall:
	@echo "Unstowing your package."
	@$(STOW) $(UFLAGS) $(TOOLDIR)
	@echo "Unstowed."
