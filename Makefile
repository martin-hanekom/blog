SHELL := /bin/bash

.PHONY: init run test clean

init:
	pip3 install --upgrade build
	python3 -m build
	python3 -m virtualenv venv
	. venv/bin/activate; pip3 install -r requirements.txt; pre-commit install

run:
	. venv/bin/activate; sanic blog.server.app

debug:
	. venv/bin/activate; sanic blog.server.app --debug

test:
	. venv/bin/activate; pytest tests

clean:
	rm -rf venv
	find -iname "*.pyc" -delete
