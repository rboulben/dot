# Defined in /tmp/user/1000/fish.2Xjzyx/dinspect.fish @ line 2
function dinspect
	set name $argv[1]
	set match (string match -e $name (docker ps -a --format "{{.Names}}") )
	if test (count $match) -eq 0
		echo "No matching container found"
		return
	end
	if test (count $match) -gt 1
		echo "Found more than one matching container"
		return
	end
	if test -n "$match"
		if test (count $argv) -gt 1
			set fields $argv[2..-1]
		else
			set fields "image" "env" "binds" "cmd" "entry" "ip" "status"
		end
		for i in $fields
  			switch $i
				case env Env
					echo '[Env]'
					docker inspect -f '{{range $_, $e := .Config.Env}}{{println $e}}{{end}}' $match
				case image Image
					echo '[Image]'
					docker inspect -f '{{.Config.Image}}' $match
				case ip Ip IP
					echo '[Ip]'
					docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $match
				case mac MAC
					echo '[Mac]'
					docker inspect -f '{{range .NetworkSettings.Networks}}{{.MacAddress}}{{end}}' $match
				case bind binds volume volumes
					echo '[Binds]'
					docker inspect -f '{{range $_, $e := .HostConfig.Binds}}{{println $e}}{{end}}' $match
				case cmd Cmd
					echo '[Cmd]'
					docker inspect -f '{{.Config.Cmd}}' $match
				case entry entrypoint
					echo '[Entrypoint]'
					docker inspect -f '{{.Config.Entrypoint}}' $match
				case status
					echo '[Status]'
					docker inspect -f '{{range $k, $e := .State}}{{println $k "=" $e}}{{end}}' $match
			end
		end
	end
end
