# Patterns Project Scaffold

This scaffolding helps you to set up your own project using jekyll to generate html and sass and 

### Installing dependencies

To 

Prerequisites:

- node.js >0.10 install from nodejs.org

You can check node is present via:

    nodejs -v

- Ruby > 2.0.0

    sudo apt-get install ruby2
    sudo gem install bundler



## Integration with the Patterns repo

The website includes demos and documentation from the [Patterns repo](https://github.com/Patternslib/Patterns.git)
which means that we need to have a git checkout of it in Patterns-site.

To automatically have this repo checked out and updated, simply run:

    make all

Patterns will then be checked out into ./patternslib and the files for the
individual patterns (index.html, scss, documentation.md etc.) are located in ./patternslib/src/pat/${pattern name}/

Jekyll will pick up modifications to these files and because this is a git
checkout, you can also commit and push your changes to Patterns.

### Generating the site

Running ``make all`` will generate and serve the site.

Otherwise you can also run:

    bundle exec jekyll serve 

### How to include the demos and docs for the individual patterns

The files required for demoing and documenting the individual patterns are in
the [Patterns](https://github.com/Patternslib/Patterns.git) repository in the
the [/src/pat](https://github.com/Patternslib/Patterns/tree/master/src/pat)
folder.

Each pattern has its own subfolder in which you'll find the following files:

- ``index.html`` which contains the HTML markup to demo the pattern which is injected (via
  ``pat-inject``) into the ``_layout/demo.html`` layout.
- ``documentation.md`` which contains the markdown which is also injected into
  ``_layout/demo.html``.
- ``${pattern name}.scss`` which is a Sass file containing CSS specific to this pattern.

The scss file is included in [Patterns/_sass/_patterns.scss](https://github.com/Patternslib/Patterns/blob/master/_sass/_patterns.scss)
and this file is in turn included in style/screen.scss inside this repository.

That's how the CSS of the individual patterns get included in the website.

### How to include developer and designer documentation from Patterns

All documentation for designers and developers should reside in the
[docs folder of Patterns](https://github.com/Patternslib/Patterns/tree/master/docs).

We however want to include these docs in the website. We do this similarly to
how how the files for the demos are included.

The docs are then injected via ''pat-injected'' into the `_layout/documentation.html`` layout.

For each doc we must have a post file in _posts/Documentation and the YAML for that doc
must have two arguments:

- ``sub`` which has a value of either ``developer`` or ``designer``
- ``file`` which must have the file name of the file that must be injected from ``Patterns/docs/${sub}``

