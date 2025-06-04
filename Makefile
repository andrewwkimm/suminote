help:
	cat Makefile

################################################################################

build:
	bundle install
	make formatter
	make lint
	make test

db-setup:
	bundle exec rails db:create db:migrate db:seed

formatter:
	bundle exec rubocop --autocorrect

setup:
	bundle install
	yarn install
	overcommit --install
	overcommit --sign
	make db-setup

test:
	bundle exec rspec --format progress

test-coverage:
	COVERAGE=true bundle exec rspec --format progress

.PHONY: \
	build \
	db-setup \
	formatter \
	setup \
	test \
	test-coverage