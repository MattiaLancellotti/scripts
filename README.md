MY SCRIPTS
----------

### Introduction
This repository stores a collection of scripts that I created and actively use
to automate parts of my workflow or just having fun (I do enjoy writing shell
scripts). I also like to change my writing style so expect some changes often.

### Standard
All the scripts found here, mostly written in bash, have been created and
maintained while following a standard procedure. All of them are very well
documented, if you are willing to read the code or even modify it, I tried to
keep them as simple as possible, all of them have at least a help message
(accessbible with the --help|-h flag or none if it's the case) and they should
all have checkings and error/signals detections (if needed).

As of now there is nothing preventing a user from adding a platform specific
script, though it is a feature that I will try to implement in the future.

For bash scripts no guidelines on how to write the code were followed sometimes
because I don't like how the code gets structured and sometimes because I need
to use strcutures like arrays and lists that are not suggested general
guidelines (such as by Google's guideline).

### Dependencies
As I've already pointed out most of these scripts are specifically written in
**GNU Bash**, while some others can be executed by your */bin/sh* that in my
case is **Dash**. Instead of just moving files around and creating complicated
logic through scripts and makefiles I decided that a simple but powerful
approach was the way to go, that's why you also need **stow** that links files
around your file system.

### Installation
To easily install these scripts, I created a Makefile that tries to
follow GNU's standard's naming scheme (in case you want to read it). The default
target is `make install` and it searches for  *${HOME}/.local/bin*, `stow` will
do the rest. The important thing to remember is that you **must not** move this
folder once you've executed the installation recipe, or else the stow's links
will break.  
The available commands are listed below:
  - To install these utilities just run `make install`;
  - To uninstall them run `make uninstall`;
  - To package everything into a single compressed archive run `make dist`.

### Configuration
Some of these scripts need to be configured before use. *cottage* for example is
a specific script a wrote for maintaining and cleaning a gentoo system. The main
core is multiplatform since it just shows the package from a given list (either
a file or a command output), the only gentoo-specific code in the script are the
emerge commands used to uninstall programs. *zorg* is a back-up script that
needs the user to modify the paths to save in the archive.
