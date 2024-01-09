.DEFAULT_GOAL := run
.PHONY: run

PPATH := ./example/

ENTRYPOINT := cc_installer_lib_example.dart

all: lint format 

help: ## This help dialog.
	@grep -F "##" $(MAKEFILE_LIST) | grep -F -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
	
format: ## Format the code
	@echo "╠ Formatting the code"
	@dart format ${PPATH}

lint: ## Lint the code
	@echo "╠ Verifying code..."
	@dart analyze ${PPATH} || (echo "▓▓ Lint error ▓▓"; exit 1)

upgrade: clean ## Upgrade project dependecies.
	@echo "╠ Upgrading dependencies..."
	@dart pub upgrade

run: ## Run the project
	@echo "╠ Running project"
	@dart run ${PPATH}${ENTRYPOINT}

test: ## Run all tests in ./test
	@echo "╠ Running the tests"
	@dart test ./test/

build: ## Compile the project.
	@echo "nothing"

install: ## Installs the project.
	@echo "nothing"

clean: ## Clean the project
	@echo "╠ Cleaning the project..."
	@rm -rf pubspec.lock
	@dart clean

# Git
.PHONY: fetch-main
fetch-main:
	$(shell git fetch origin main)

.PHONY: fetch-dev
fetch-main:
	$(shell git fetch origin development)

.PHONY: rebase-main
rebase-main:
	$(shell git pull --rebase origin main)

.PHONY: rebase-dev
rebase-main:
	$(shell git pull --rebase origin development)

.PHONY: push-all
push-all:
	$(shell git add *)
	$(shell git commit -m "fast push")
	$(shell git push -u origin development)
