# Defined in /tmp/fish.AFNBAp/fm.fish @ line 2
function fm
	if count $argv > /dev/null
		xdg-open $argv[1] &
	else
		xdg-open $PWD &
	end
end
