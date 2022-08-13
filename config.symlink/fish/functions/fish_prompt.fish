function fish_prompt --description 'Write out the prompt'
  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  if not set -q __fish_prompt_cwd
    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
  end

  set -g __fish_prompt_name (set_color 'bb28c7')
  set -g __fish_prompt_vcs (set_color yellow)

  echo -n -s "[$__fish_prompt_name" "$USER" ' ' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_vcs" (vcs_status) "$__fish_prompt_normal" ']$ '
end
