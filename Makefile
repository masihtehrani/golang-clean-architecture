ROOT = $(shell pwd)
GO ?= go
OS = $(shell uname -s | tr A-Z a-z)
export GOBIN = ${ROOT}/bin

LINT = ${GOBIN}/golangci-lint
LINT_DOWNLOAD = curl --progress-bar -SfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s latest
GOPLANTUML = ${GOBIN}/goplantuml
GOPLANTUML_DOWNLOAD = $(GO) get github.com/jfeliu007/goplantuml/cmd/goplantuml
VERSION_TAG = $(shell git describe --tags --abbrev=0 --always)
VERSION_COMMIT = $(shell git rev-parse --short HEAD)
VERSION_DATE = $(shell git show -s --format=%cI HEAD)
VERSION = -X main.versionTag=$(VERSION_TAG) -X main.versionCommit=$(VERSION_COMMIT)  -X main.versionDate=$(VERSION_DATE) -X main.serviceName=$(SERVICE_NAME)
TPARSE = $(GOBIN)/tparse
TPARSE_DOWNLOAD = $(GO) get github.com/mfridman/tparse
COMPILEDEAMON = $(GOBIN)/CompileDaemon
COMPILEDEAMON_DOWNLOAD = $(GO) get github.com/githubnemo/CompileDaemon
PATH := $(PATH):$(GOBIN)

SERVICE_NAME = $(shell basename "$(PWD)")

.PHONY: help
help: ## Display this help message
	@ cat $(MAKEFILE_LIST) | grep -e "^[a-zA-Z_\-]*: *.*## *" | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build
build: ## Build development binary file
	@ $(GO) build -ldflags '$(VERSION)' -o ./bin/${SERVICE_NAME} ./cmd/...

.PHONY: run
run: ## run as development reload if code changes referrer_ip=referrer_ip referrer_port=referrer_port
	@ test -e $(COMPILEDEAMON) || $(COMPILEDEAMON_DOWNLOAD)
	@ $(COMPILEDEAMON) --build="make build" --command="$(GOBIN)/$(SERVICE_NAME)"

.PHONY: mod
mod: ## Get dependency packages
	@ $(GO) mod tidy

.PHONY: test
test: ## Run data race detector
	@ test -e $(TPARSE) || $(TPARSE_DOWNLOAD)
	@ $(GO) test -timeout 1000s -short -race ./... -json -cover | $(TPARSE) -all -smallscreen

.PHONY: coverage
coverage: ## check coverage test code of sample https://penkovski.com/post/gitlab-golang-test-coverage/
	@ $(GO) test -timeout 1000s ./... -coverprofile=coverage.out
	@ $(GO) tool cover -func=coverage.out
	@ $(GO) tool cover -html=coverage.out -o coverage.html;

.PHONY: lint
lint: ## Lint the files
	@ test -e $(LINT) || $(LINT_DOWNLOAD)
	@ $(LINT) version
	@ $(LINT) --timeout 10m run

.PHONY: uml
uml: ## Create UML diagram in diagram.puml file
	@ test -e $(GOPLANTUML) || $(GOPLANTUML_DOWNLOAD)
	@ $(GOPLANTUML) -recursive . > diagram.puml