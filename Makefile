.PHONY: dev shell models

dev:
	@pipenv install

shell: dev
	@pipenv shell

deps:
	@pipenv run dbt deps

models:
	@pipenv run dbt run