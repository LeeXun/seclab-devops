.PHONY: init apply

all: help

## Initialize terraform environment
init:
	export $$(cat .env | xargs) && \
		terraform init

## Apply to GCP
apply: fmt validate
	export $$(cat .env | xargs) && \
		terraform apply

## Destroy all resources
destroy: fmt validate
	export $$(cat .env | xargs) && \
		terraform destroy
		
validate:
	export $$(cat .env | xargs) && \
		terraform validate

fmt:
	terraform fmt

# List GCP instances
list:
	gcloud compute instances list

###########################################################
# Help
# COLORS
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
WHITE  := $(shell tput -Txterm setaf 7)
RESET  := $(shell tput -Txterm sgr0)

TARGET_MAX_CHAR_NUM=20
## Show help
help:
	@echo ''
	@echo 'Usage:'
	@echo '  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}'
	@echo ''
	@echo 'Targets:'
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-$(TARGET_MAX_CHAR_NUM)s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
