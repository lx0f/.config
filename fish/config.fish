abbr -a vim 'nvim'
abbr -a vi 'nvim'

abbr -a l 'exa'
abbr -a ls 'exa'
abbr -a ll 'exa -l'
abbr -a lll 'exa -la'

abbr -a cat 'bat'

abbr -a python3 'python3.10'
abbr -a python 'python3.10'
abbr -a py 'python3.10'
abbr -a p 'python3.10'

setenv EDITOR nvim
setenv NAME "Luth Andyka"
setenv EMAIL luthandyka.business@gmail.com

# fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

#fish prompt
function fish_prompt
    set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color grey
	echo -n (whoami)
	set_color normal
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

set PATH $PATH /opt/homebrew/opt/python@3.10/bin
set PATH $PATH $HOME/.cargo/bin/
