GO ?= go
PACKAGES ?= $(shell $(GO) list ./...)


build:
	docker build -t hub.azoyagroup.com/drone-plugins/dingtalk-message:latest .

push:
	docker push hub.azoyagroup.com/drone-plugins/dingtalk-message:latest

vet:
	$(GO) vet $(PACKAGES)

test:
	@$(GO) test -v -cover -coverprofile coverage.txt $(PACKAGES) && echo "\n==>\033[32m Ok\033[m\n" || exit 1

coverage:
	sed -i '/main.go/d' coverage.txt