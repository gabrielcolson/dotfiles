function fish_default_mode_prompt
  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    or test "$fish_key_bindings" = "fish_hybrid_key_bindings"
    set -l normal (set_color normal)
    set -l blue (set_color blue)
    set -l yellow (set_color yellow)
    set -l red (set_color red)

    switch $fish_bind_mode
      case default
        echo -sn $blue"N$normal "
      case insert
        echo -sn ""
      case visual
        echo -sn $yellow"V$normal "
      case replace_one
        echo -sn $red"R$normal "
    end
  end
end
