set -Ux ANDROID_HOME $HOME/Library/Android/sdk
set -Ux JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-21.jdk/Contents/Home
set -Ux PNPM_HOME $HOME/Library/pnpm
set -gx PATH $HOME/.cargo/bin /opt/homebrew/bin /opt/homebrew/sbin $PNPM_HOME /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt /usr/local/sbin $ANDROID_HOME/emulator $ANDROID_HOME/platform-tools $HOME/.bun/bin $PATH
set -Ux EDITOR nvim
set -Ux VISUAL nvim

alias vi nvim
alias vim nvim
alias vimdiff 'nvim -d'

if status is-interactive
    if set -q SSH_CONNECTION; and not set -q TMUX
        if command -sq tmux
            tmux new-session -A -s main
        end
    end
end

abbr --add am 'git amend'
abbr --add o 'open .'
abbr --add g 'git'
abbr --add gbr 'git br'
abbr --add gco 'git co'
abbr --add gd 'git diff -w'
abbr --add gds 'git diff -w --staged'
abbr --add grs 'git restore --staged'
abbr --add glogf 'git logf'
abbr --add glogo 'git logo'
abbr --add gp 'git push origin'
abbr --add gpu 'git push upstream'
abbr --add gs 'git status'
abbr --add l 'ls -alh'
abbr --add c 'code .'
abbr --add map 'xargs -n1'
abbr --add nsize 'du -sh ./node_modules/* | sort -nr | grep "\dM.*"'
abbr --add p 'pnpm'
abbr --add ghpr 'gh pr checkout'
abbr --add qgit 'git'
abbr --add qpnpm 'pnpm'
abbr --add vpr 'vp run'

set fish_color_cwd '3d87f5'
set fish_color_search_match --background='C2E8FF'
set fish_color_escape 4271ae
set fish_color_operator 4271ae
set fish_color_user green
set fish_greeting ""

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
