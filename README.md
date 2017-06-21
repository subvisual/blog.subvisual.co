# Subvisual Blog (Deprecated)

**Notice: This blog has since been reimplemented as a static page. Visit the new
repo [here](https://github.com/subvisual/blog)**. Bye bye Rails, it's been
a good run...

# Development Setup

## Dependencies

  * **PG unaccent**: This extension is used to allow case-insensitive searches
  * **memcached (optional)**: Should not be necessary during development, unless you're interesting in testing the cache system

## Setup

    git clone git@github.com/subvisual/blog.subvisual.co
    cd blog.subvisual.co
    bin/setup

    # running the server
    bin/server

    # running the test suite
    bundle exec rake

    # deploy
    bundle exec cap production deploy
