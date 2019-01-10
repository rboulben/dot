# Defined in /tmp/user/1000/fish.QevScZ/lsn.fish @ line 2
function lsn
	if count $argv > /dev/null
		ls -ltr $argv[1]
	else
		ls -ltr
	end
end
