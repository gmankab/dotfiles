fish_vi_key_bindings
fish_add_path -m ~/.local/bin
fish_add_path -m ~/.cargo/bin

bind y fish_clipboard_copy
bind p fish_clipboard_paste
bind -M default n 'down-or-search'
bind -M default e 'up-or-search'

alias pc='pacman --noconfirm'
alias ya='yay --noconfirm'

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
set fish_greeting
set -Ux EDITOR nvim

# xdg
set XDG_CONFIG_HOME $HOME/.config
set XDG_CACHE_HOME $HOME/.cache
set XDG_STATE_HOME $HOME/.local/state
set XDG_DATA_HOME $HOME/.local/share
set XDG_DATA_DIRS /usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share
set XDG_CONFIG_DIRS /etc/xdg
set PYTHONPYCACHEPREFIX $XDG_CACHE_HOME/python
set PYTHONUSERBASE $XDG_DATA_HOME/python
set PYTHON_HISTORY $XDG_STATE_HOME/python/history
set RUFF_CACHE_DIR $XDG_CACHE_HOME/ruff
set CARGO_HOME $XDG_DATA_HOME/cargo
set WINEPREFIX $XDG_DATA_HOME/wineprefixes/default


if type -q zoxide
    zoxide init fish | source
end

