# Defined in /tmp/fish.c2EMts/de.fish @ line 2
function de
	getopts $argv | while read -i key value
        switch $key
            case _
                if test -n "$name"
                  set command $value
                else
				  set name $value
                end
            case u user
                set user $value
        end
      end
      set match (string match -e $name (docker ps --format "{{.Names}}") )
	  if test (count $match) -eq 0
		echo "No matching container found"
		return
	  end
	  if test (count $match) -gt 1
		echo "Found more than one matching container"
		return
	  end
      if test -n "$match"
            if test -n "$command"
              if test -n "$user"
                docker exec -it $match sudo -u $user command
              else
                docker exec $match $command
              end
            else
              if test -n "$user"
                set shell (docker exec $match getent passwd $user | cut -d: -f7)
                docker exec -it $match sudo -u $user $shell
              else
                set shell (docker exec $match getent passwd root | cut -d: -f7)
                docker exec -it $match $shell
              end
            end
	end
end
