SHELL := /bin/bash

init:
	pip3 install --upgrade build
	python3 -m build
	python3 -m virtualenv venv
	. venv/bin/activate; pip3 install -r requirements.txt; pre-commit install

run:
	sanic blog.server.app

test:
	pytest tests

clean:
	rm -rf venv
	find -iname "*.pyc" -delete

.PHONY: init test clean
