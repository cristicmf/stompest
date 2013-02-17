PYTHON=`which python`
NAME=`python setup.py --name`

dist:
	$(PYTHON) setup.py sdist

upload:
	$(PYTHON) setup.py sdist upload

readme:
	$(PYTHON) setup.py --long-description | rst2html > readme.html

test:
	$(PYTHON) setup.py test

check:
	find . -name \*.py | grep -v "^test_" | xargs pylint --errors-only --reports=n
	# pep8
	# pyntch
	# pyflakes
	# pychecker
	# pymetrics

clean:
	$(PYTHON) setup.py clean
	rm -rf dist/ readme.html
	find . -name '*.pyc' -delete
