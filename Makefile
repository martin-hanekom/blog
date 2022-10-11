SHELL := /bin/bash

init:
	python -m virtualenv venv
	. venv/bin/activate; pip install -r requirements.txt

test:
	pytest tests

clean:
	rm -rf venv
	find -iname "*.pyc" -delete

.PHONY: init test clean
