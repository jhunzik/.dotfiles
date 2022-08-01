# .dotfiles
My personal dotfiles and development plugins. This repo uses Ansible to automate the setup.

## Prereqs
- Ansible
- `.../host_vars/localhost/vars.yml` with your username:
    ``` yaml
    username = "username"
    ```

## Usage
Set up is done by running the `.../bin/dotfiles` script in the root of the directory. Sections are
separated by Ansible tags and can be passed in a script argument to fine-tune setup. For example
`.../bin/dotfiles tmux`.
