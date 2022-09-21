set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $HOME/.home/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt /usr/local/sbin $HOME/.cargo/bin $PATH
set -Ux EDITOR vim
source ~/.iterm2_shell_integration.fish

abbr --add am 'git amend'
abbr --add o 'open'
abbr --add g 'git'
abbr --add gbr 'git br'
abbr --add gco 'git co'
abbr --add gd 'git diff -w'
abbr --add gds 'git diff -w --staged'
abbr --add glogf 'git logf'
abbr --add glogo 'git logo'
abbr --add gp 'git push origin'
abbr --add gpu 'git push upstream'
abbr --add gs 'git status'
abbr --add gb 'git br cnakazawa/'
abbr --add l 'ls -alh'
abbr --add c 'code .'
abbr --add map 'xargs -n1'
abbr --add nsize 'du -sh ./node_modules/* | sort -nr | grep "\dM.*"'
abbr --add p 'pnpm'

set fish_color_cwd '3d87f5'
set fish_color_search_match --background='C2E8FF'
set fish_color_escape 4271ae
set fish_color_operator 4271ae
set fish_color_user green
set fish_greeting ""

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true
