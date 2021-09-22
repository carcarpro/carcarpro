# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))

import sphinx_rtd_theme
import sys
import os
from datetime import date
year_ = date.today().year

html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]
html_show_sphinx = False
html_show_sourcelink = False
theme_display_version = False

sys.path.insert(0, os.path.abspath('.'))

html_theme = "sphinx_rtd_theme"

# -- Project information -----------------------------------------------------

project = 'carcarpro'
if '2021' == str(year_):
    copyright = '2021, The CarCarPro Maintainers'
else:
    copyright = '2021-' + str(year_) + ', The CarCarPro Maintainers'
author = 'The CarCarPro Maintainers'

# The full version, including alpha/beta/rc tags
release = '0.1.0'


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx_rtd_theme',
    'sphinx.ext.todo', 
    'sphinx.ext.mathjax',
    '3rdparty.ext.hidden_code_block',
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store', 'venv', '.git', 'src']


# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']