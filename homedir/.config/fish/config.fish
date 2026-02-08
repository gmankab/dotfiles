fish_add_path -m ~/.local/bin

alias nvim='flatpak --command=nvim run dev.neovide.neovide'
alias gitui='flatpak run io.github.gitui_org.gitui'
alias gh='flatpak run com.github.cli'

bind y fish_clipboard_copy
bind p fish_clipboard_paste
bind -M default n 'down-or-search'
bind -M default e 'up-or-search'

set --global fish_key_bindings fish_vi_key_bindings
set --erase --universal fish_key_bindings

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
set fish_greeting

set SUDO_EDITOR 'flatpak --command=nvim run dev.neovide.neovide'
set EDITOR      'flatpak --command=nvim run dev.neovide.neovide'

set -x XDG_CONFIG_HOME $HOME/.config
set -x XDG_CACHE_HOME  $HOME/.cache
set -x XDG_STATE_HOME  $HOME/.local/state
set -x XDG_DATA_HOME   $HOME/.local/share

set -x CARGO_HOME               $XDG_DATA_HOME/cargo
set -x RUFF_CACHE_DIR           $XDG_CACHE_HOME/ruff
set -x GIT_CONFIG_GLOBAL        $XDG_CONFIG_HOME/git/config
set -x ANSIBLE_HOME             $XDG_CONFIG_HOME/ansible
set -x ANSIBLE_CONFIG           $XDG_CONFIG_HOME/ansible.cfg
set -x ANSIBLE_GALAXY_CACHE_DIR $XDG_CACHE_HOME/ansible/galaxy_cache
set -x PYTHONPYCACHEPREFIX      $XDG_CACHE_HOME/python
set -x PYTHON_HISTORY           $XDG_STATE_HOME/python/history
set -x PYTHONUSERBASE           $XDG_DATA_HOME/python
set -x HISTFILE                 $XDG_STATE_HOME/bash/history
