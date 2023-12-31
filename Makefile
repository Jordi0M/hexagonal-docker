## —— Test API —————————————————————————————————————————————————————————————
help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'

install: ## Install vendors according to the current composer.lock file
	composer install

update: ## Update vendors according to the current composer.json file
	composer update

fix-perms: ## Fix permissions of all var files
	chmod -R 777 var/*

purge: ## Purge cache and logs
	rm -rf var/logs/*.log
	ls var | grep -v logs | xargs -I % sh -c 'rm -rf var/%'
