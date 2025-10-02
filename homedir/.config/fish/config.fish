fish_vi_key_bindings
fish_add_path -m ~/.local/bin

bind y fish_clipboard_copy
bind p fish_clipboard_paste
bind -M default n 'down-or-search'
bind -M default e 'up-or-search'

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
set fish_greeting

set SUDO_EDITOR 'flatpak --command=nvim run dev.neovide.neovide'
set EDITOR      'flatpak --command=nvim run dev.neovide.neovide'

set XDG_CONFIG_HOME $HOME/.config
set XDG_CACHE_HOME  $HOME/.cache
set XDG_STATE_HOME  $HOME/.local/state
set XDG_DATA_HOME   $HOME/.local/share

set RUFF_CACHE_DIR           $XDG_CACHE_HOME/ruff
set GIT_CONFIG_GLOBAL        $XDG_CONFIG_HOME/git/config
set ANSIBLE_HOME             $XDG_CONFIG_HOME/ansible
set ANSIBLE_CONFIG           $XDG_CONFIG_HOME/ansible.cfg
set ANSIBLE_GALAXY_CACHE_DIR $XDG_CACHE_HOME/ansible/galaxy_cache
set PYTHONPYCACHEPREFIX      $XDG_CACHE_HOME/python
set PYTHON_HISTORY           $XDG_STATE_HOME/python/history
set PYTHONUSERBASE           $XDG_DATA_HOME/python
set HISTFILE                 $XDG_STATE_HOME/bash/history
