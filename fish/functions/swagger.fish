# Defined in /tmp/user/1000/fish.duQjpT/swagger.fish @ line 2
function swagger
	docker run -p 8081:8080 -e API_URL=$argv[1] swaggerapi/swagger-ui
end
