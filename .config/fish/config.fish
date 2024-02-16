fish_vi_key_bindings
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
bind y fish_clipboard_copy
bind p fish_clipboard_paste
alias pc='pacman --noconfirm'
alias ya='yay --noconfirm'
alias hyfetch='python -m hyfetch'
alias sshuttle='python -m sshuttle'
alias dlp='distrobox enter arch -- python -m yt_dlp'
fish_add_path -m ~/.local/bin
fish_add_path -m ~/.pyenv/versions/3.12.1/bin

