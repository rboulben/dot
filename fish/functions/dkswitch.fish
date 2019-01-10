# Defined in /tmp/user/1000/fish.2rLNjq/dkswitch.fish @ line 2
function dkswitch
	if readlink docker-compose.override.yml | grep dev > /dev/null
		rm docker-compose.override.yml ; and ln -s docker-compose-prod.yml docker-compose.override.yml
	else
		rm docker-compose.override.yml ; and ln -s docker-compose-dev.yml docker-compose.override.yml
	end
end
