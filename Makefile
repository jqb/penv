.PHONY: default


default:
	@echo "No default target"


development_environment:
	pip install --upgrade pip
	pip install -r requirements.dev


cleanup:
	rm -rf ./build/ ./dist/ ./*.egg-info/
	find . -name "__pycache__" -or -name "*.pyc" | grep -v '.tox' | grep -v '.penv' | xargs rm -rf


publish: cleanup
	python setup.py build sdist bdist_wheel
	twine upload -r fury dist/*
