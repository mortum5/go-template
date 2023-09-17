create_posgres:
	docker run --name postgres -p 5432:5432 -e POSTGRES_USER=rest -e POSTGRES_PASSWORD=1234 -d postgres

create_mysql:
	docker run --name mysql -v "$(PWD)/data:/var/lib/mysql" --user 1000:1000 -e MYSQL_ROOT_PASSWORD=1234 -d mysql:latest

run:
	go build -o app cmd/hello-world/hello-world.go && ./app

lint:
	golangci-lint run
	
test:
	go test -v -race -timeout 30s ./...
	
clean:
	docker rm -f --volumes db

.DEFAULT_GOAL := test