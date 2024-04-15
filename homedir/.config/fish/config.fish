fish_vi_key_bindings
set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block
set fish_greeting
set -Ux EDITOR nvim
set -g fish_sequence_key_delay_ms 100
bind -M insert -m default jk cancel repaint-mode
bind y fish_clipboard_copy
bind p fish_clipboard_paste
alias pc='pacman --noconfirm'
alias ya='yay --noconfirm'
fish_add_path -m ~/.local/bin
if test -d ~/.pyenv
  fish_add_path -m ~/.pyenv/versions/*/bin
end

