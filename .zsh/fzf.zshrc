# use `fzb` to fuzzy load into nvim with bat preview
alias fzb='nvim $($FDER | fzf --preview "bat --color=always --theme=ansi --style=plain --line-range=:150 {}")'

# use 'zgb' to fuzzy switch git branches
alias zgb="git branch --format='%(refname:short)' | fzf --preview 'git log -20 --color=always {}'"
