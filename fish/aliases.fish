## VIM
alias e "nvim"

## LS/TREE/EXA
alias ls "exa"
alias l "exa -l"
alias la "exa -la"
alias tree "exa --tree"
alias t "exa --tree"

## CD
function c
  cd $argv[1] ; and l
end

## GIT
alias g "git"
alias gd "git diff"
alias gl "git pull"
alias gst "git status"
alias ga "git add"
alias gaa "git add --all"
alias gc "git commit"
alias gcam "git commit -am"
alias gp "git push"
alias gb "git branch"
alias gm "git branch --merged"

## RM
alias rrm "rm -Rf"

## CP
alias cp "cp -v"
alias ccp "cp -R"

## MV
alias mv "mv -v"

## TMUX
alias tmux "tmux -2"
alias tm "tmux -2"
alias at "tmux attach -t"
alias tmls "tmux list-sessions"

## MAKE
alias m "make"
alias mr "make re"

## CHMOD
alias cx "chmod +x"

## GDB
alias gdb "gdb -q"

## VALGRIND
alias va "valgrind"
alias valeak "valgrind --leak-check=full --show-leak-kinds=all"

## DOCKER
alias d "docker"
alias drm "docker rm"
alias dt "docker start"
alias da "docker attach"
alias ds "docker stop"
alias di "docker images"
alias dps "docker ps"
alias dpsa "docker ps -a"
alias dlog "docker logs -f"

## DOCKER-COMPOSE
alias dc "docker-compose"
alias dcu "docker-compose up"
alias dcd "docker-compose down"
alias dcps "docker-compose ps"
alias dcpsa "docker-compose ps -a"

## BAT
alias cat "bat --style=numbers,changes"

## CARGO
alias cb "cargo build"
alias cr "cargo run"

## NPM
alias ni "npm install"
alias nr "npm run -s"
