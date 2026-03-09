# .dotfiles
My personal dotfiles and development plugins. This repo uses Ansible to automate the setup.

## Prereqs
- Ansible

## Usage
Run the `dotfiles` script from the repo if using this for the first time.
```sh
./roles/system/files/bin/dotfiles
```
After the first run, the script is stored under `~/bin/` and can be run from anywhere by just calling
```sh
dotfiles <optional_tag>
```

Sections are separated by Ansible tags and can be passed in as a script argument to fine-tune setup. For example
```sh
dotfiles tmux
```
