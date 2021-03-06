import os
import sys

from setuptools import setup
from setuptools import find_packages
from setuptools.command.test import test as TestCommand


here = lambda path: os.path.join(os.path.abspath(os.path.dirname(__file__)), path)

with open(here('README.rst')) as f:
    README = f.read()

with open(here('requirements.txt')) as f:
    rows = f.read().strip().split('\n')
    requires = []
    for row in rows:
        row = row.strip()
        if row and not (row.startswith('#') or row.startswith('http')):
            requires.append(row)


# Additional Hooks
# ----------------------------
# Integrate py.test with setup.py:
# http://pytest.org/latest/goodpractises.html#integration-with-setuptools-test-commands



class PyTest(TestCommand):

    def finalize_options(self):
        TestCommand.finalize_options(self)
        self.test_args = []
        self.test_suite = True

    def run_tests(self):
        # import here, cause outside the eggs aren't loaded
        import pytest
        errno = pytest.main(self.test_args)
        sys.exit(errno)


# Setup
# ----------------------------

setup(name='reef',
      version='0.1',
      description='Reference application for Pacific',
      long_description=README,
      classifiers=[
          'Development Status :: 1 - Planning',
          'Environment :: Web Environment',
          'Framework :: Pyramid',
          'Intended Audience :: Developers',
          'License :: OSI Approved',
          'License :: OSI Approved :: MIT License',
          'Programming Language :: Python',
          'Programming Language :: Python :: 3',
          'Operating System :: POSIX',
          'Topic :: Internet :: WWW/HTTP',
          'Topic :: Internet :: WWW/HTTP :: WSGI :: Application',
      ],
      author='Maxim Avanov',
      author_email='maxim.avanov@gmail.com',
      url='https://github.com/avanov/Reef',
      keywords='web wsgi pylons pyramid',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      test_suite='tests',
      tests_require=['pytest', 'coverage'],
      install_requires=requires,
      cmdclass={
          'test': PyTest,
      },
      entry_points={
          'babel.extractors': [
              'plim = plim.adapters.babelplugin:extract'
          ]
      }
    )
