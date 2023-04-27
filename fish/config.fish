if status is-interactive
    and not set -q TMUX
    if tmux has-session -t inbox
        exec tmux attach-session -t inbox
    else
        tmux new-session -s inbox
    end
end

set -U fish_greeting

set -gx DENO_INSTALL $HOME/.deno
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc
set -gx GEM_HOME $HOME/gems
set -gx PNPM_HOME $HOME/.local/share/pnpm

set -gx EDITOR nvim

set -gx VISUAL $EDITOR
set -gx MANPAGER $EDITOR +Man!

set -gx PATH $DENO_INSTALL/bin $PNPM_HOME $HOME/.npm/bin $HOME/.cargo/bin $HOME/go/bin /usr/local/go/bin $HOME/.local/bin $HOME/bin $HOME/dotfiles/bin $HOME/.local/share/gem/ruby/3.0.0/bin $HOME/gems/bin $(yarn global bin) $PATH

function fish_user_key_bindings
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
end

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

alias bat="bat --theme=GitHub"
alias tree="exa --tree --icons"
alias x="chmod +x"
alias q="exit"
alias fzf_down="fzf --reverse --preview-window=top"
alias m="fzf_music"
alias o="fzf_open"
alias tl="fzf_tldr"
alias test_keyboard_input_code="sudo showkey"
alias lazydocker="sudo $HOME/go/bin/lazydocker"
alias docker="sudo docker"
alias docker-compose="sudo docker-compose"
alias edir="edir --recurse --trash --all"
alias copy_editor_config_file="change_directory_to_git_root ; cp ~/dotfiles/template/skeleton.editorconfig .editorconfig"
alias google_art_download="dezoomify-rs (wl-paste)"
alias kitty_list_font="kitty +list-fonts --psnames"
alias reload_mouseless="systemctl --user restart mouseless.service"

alias php_interactive_shell="php -a"

alias r="rm -rf"
alias rr="sudo rm -rf"
alias t="trash"

alias c="fzf_change_directory"
alias cc="cd $HOME; fzf_change_directory"

alias vi="fzf_edit_file"
alias vim="fzf_edit_file"
alias e="fzf_edit_file"
alias e.="nvim ."
alias ee="cd $HOME; fzf_edit_file"
alias ej="fzf_emoji"
alias E="fzf_sudo_edit"

alias a="git add -A; git commit"
alias aa="git add -A; git commit -m 'auto commit'"
alias am="git add -A; git commit --amend --no-edit"
alias cdr="change_directory_to_git_root"
alias l="git pull"
alias ll="git pull -f"
alias p="git push"
alias pp="git push -f"
alias s="git status -sb"
alias w="fzf_git_worktree_change_dir"
alias ww="fzf_git_worktree_remove"
alias amp="am;p"
alias ampp="am;pp"
alias aap="aa;p"

alias ...="cd .. ; cd .. ; ls"
alias ..="cd .. ; ls"
alias doc="cd ~/Documents ; ls"
alias dow="cd ~/Downloads ; ls"
alias la="exa --all --icons"
alias ls="exa --long --all --icons"
alias tmp="cd /tmp"
