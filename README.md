# .dotfiles
My personal dotfiles and development plugins. This repo uses Ansible to automate the setup.

## Prereqs
- Ansible
- `.../host_vars/localhost/vars.yml` with your username:
    ``` yaml
    username = "username"
    ```

## Usage
Initial set up is done by running the `.../roles/system/files/bin/dotfiles` script in the root of the directory.
After the first run, the script is stored under `~/bin/` and can be run from anywhere by just calling
`dotfiles <optional_tag>`

Sections are separated by Ansible tags and can be passed in a script argument to fine-tune setup. For example
`.../bin/dotfiles tmux`.
