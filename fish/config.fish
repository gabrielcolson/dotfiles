# Get the aliases
source $HOME/.config/fish/aliases.fish

# Get the functions
source $HOME/.config/fish/functions.fish

# Disable greeting
set fish_greeting

# Setup starship prompt
/usr/local/bin/starship init fish | source

# Setup direnv
eval (/usr/local/bin/direnv hook fish)

# Vi mode
fish_vi_key_bindings

# Disable valid path underline
set fish_color_valid_path

# Bindings !
function fish_user_key_bindings
  # Still enable ctrl+f in Vim mode
  for mode in insert default visual
    bind -M $mode \cf forward-char
  end

  # Get the default FZF functions and bindings
  fzf_key_bindings

  # Set the custom bindings
  bind -e \cr
  bind \ch fzf-history-widget
  bind -e \ct
  bind \cj fzf-file-widget
  bind -e \ec
  bind \ck fzf-cd-widget

  # Vim mode compatibility
  if bind -M insert > /dev/null 2>&1
    bind -M insert -e \cr
    bind -M insert \ch fzf-history-widget
    bind -M insert -e \ct
    bind -M insert \cj fzf-file-widget
    bind -M insert -e \ec
    bind -M insert \ck fzf-cd-widget
  end
end
set -gx PATH "/usr/local/bin" $PATH

# FZF configuration
set -gx FZF_ALT_C_COMMAND "fd -t d -E Library -E Applications"
set -gx FZF_CTRL_T_COMMAND "fd -t f -E Library -E Applications"
# This does not work
# set -gx FZF_TMUX 1

# Default editor is NeoVim
set -gx EDITOR nvim

# Colored man
set -gx LESS_TERMCAP_mb (printf "\033[01;31m")
set -gx LESS_TERMCAP_md (printf "\033[01;31m")
set -gx LESS_TERMCAP_me (printf "\033[0m")
set -gx LESS_TERMCAP_se (printf "\033[0m")
set -gx LESS_TERMCAP_so (printf "\033[01;31;33m")
set -gx LESS_TERMCAP_ue (printf "\033[0m")
set -gx LESS_TERMCAP_us (printf "\033[01;32m")

# Language
set -gx LC_ALL en_US.UTF-8
set -gx LC_CTYPE en_US.UTF-8

# Go main workspace
set -gx GOPATH $HOME/Documents/go
set -gx PATH "$GOPATH/bin" $PATH

# Bat
set -gx BAT_THEME "TwoDark"

# Non-Apple Ruby
set -gx PATH "/usr/local/opt/ruby/bin" $PATH

# Rust
set -gx PATH "$HOME/.cargo/bin" $PATH

# gcloud
set -gx PATH "$HOME/google-cloud-sdk/bin" $PATH
