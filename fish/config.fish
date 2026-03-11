###################################################
#vim motions

if status is-interactive
    fish_vi_key_bindings
    set -g fish_vi_force_cursor 1
    set -g fish_cursor_default block
    set -g fish_cursor_visual block
    set -g fish_cursor_insert line
    set -g fish_cursor_replace_one underscore
    # Yank to system clipboard
    bind -M visual y 'fish_clipboard_copy; commandline -f end-selection repaint-mode'
    bind -M normal yy 'commandline | fish_clipboard_copy'
    bind -M normal Y 'commandline | fish_clipboard_copy'
    bind -M normal p 'commandline -i (fish_clipboard_paste)'

    atuin init fish | source
    set -x HOMEBREW_NO_ENV_HINTS 1
end

###################################################
# minimal looking shell interface , "future me agar super user add krna hai toh krliyo"

###################################################
#
#
#
function fish_prompt
    echo -n "ariz ~> "
end
#eza

set -l eza_params --all --classify '--icons=always' --group-directories-first '--color=always' --color-scale '--color-scale-mode=gradient' --hyperlink
alias ls "eza $eza_params"
alias lt "eza --tree --level=2 $eza_params"
alias ll "eza -lbhHigUmuSa@ $eza_params | ov -H1"
abbr --position anywhere --add nv nvim
abbr --position anywhere --add v vim

###################################################

###################################################
#yazi 

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end
abbr --position anywhere --add nv nvim
abbr --position anywhere --add v vim

###################################################

###################################################
#changed the path to as suggestes by brew doctor 

fish_add_path -m /opt/homebrew/bin
fish_add_path -m /opt/homebrew/sbin
