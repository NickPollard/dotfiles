# Prompt

# Different colors for different hostnames
function host_color {
    case $(prompt_hostname) in
      boxleitner) echo cyan ;;
      nickpollard1) echo yellow ;;
      clu1) echo red ;;
      nickpollard) echo green ;;
      *) echo blue ;;
    esac
}

function prompt_hostname {
  hostname | cut -f1 -d.
}

PROMPT='${ret_status} %{$bg_bold[$(host_color)]%}%{$fg_bold[black]%}$(prompt_hostname)%{$reset_color%} %{$fg_bold[cyan]%}%c%{$reset_color%} %{$reset_color%}$ '


