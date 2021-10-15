# dotfiles

Personal system configuration files for MacOS and Linux.

## Installation

I use [RCM](https://github.com/thoughtbot/rcm) to automatically setup the dotfiles repository on my machines. Please
checkout the [installation section](https://github.com/thoughtbot/rcm#installation) on how to install it on your
system.

```sh
# recursively clone repository into local ~/.dotfiles directory
git clone --recursive https://github.com/TheCodingLab/dotfiles.git ~/.dotfiles

# change directory into cloned repository
cd ~/.dotfiles

# link files from this repository to the current user home directory using RCM
make up
```
