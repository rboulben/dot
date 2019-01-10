# Defined in /tmp/fish.2oGLB6/dot.fish @ line 2
function dot
	switch $argv[1]
	  case bash
	     vim ~/.bashrc
	 case fish
	     vim ~/.config/fish/config.fish
	case tmux
	     vim ~/.tmux.conf
	case profile
	     vim ~/.profile
	case ssh
	     sudo vim ~/.ssh/config
        case git
             vim ~/.gitconfig
	case i3
	     vim ~/.config/i3/config
	case vim
	     vim ~/.vimrc
	end
end
