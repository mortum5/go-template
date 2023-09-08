run:
	go build -o app cmd/hello-world/hello-world.go && ./app
	
lint:
	golangci-lint run
	