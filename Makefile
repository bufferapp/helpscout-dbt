.PHONY: dev shell models

dev:
	@pipenv install

shell: dev
	@pipenv shell

models:
	@pipenv run dbt run