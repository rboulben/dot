# Defined in /tmp/user/1000/fish.7t0LHz/http.fish @ line 2
function http
	if test (count $argv) -eq 2
        python -m SimpleHTTPServer $argv[2]
	else
		python -m SimpleHTTPServer 8000	
	end
end
