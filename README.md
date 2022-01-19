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

### Installation
To easily install these utilities and scripts I created a Makefile that tries to
follow GNU's standards target naming. The default target that gets always
executed is a piece of code that generates the right directory structure in
*${HOME}/.local/bin*. Since I'm too lazy to write ebuilds in my case and other
installation scripts/methods/archives (whatever..) for other distros, most of
the repos you find in this account will use `stow` as *package manager*.
The available commands are listed below:
  - To install these utilities just run `make install`;
  - To uninstall them run `make uninstall` (this will not remove the *package*
  from *${HOME}/.local/bin*);
  - To package everything into a single compressed archive run `make dist`.
