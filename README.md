# Subvisual Blog
[![Build Status](https://semaphoreci.com/api/v1/projects/d4cb3462-8468-4dca-888f-9e311039ce8d/430739/shields_badge.svg)](https://semaphoreci.com/gb/blog-subvisual-co)
[![Code Climate](https://codeclimate.com/github/subvisual/blog.subvisual.co/badges/gpa.svg)](https://codeclimate.com/github/subvisual/blog.subvisual.co)
[![Test Coverage](https://codeclimate.com/github/subvisual/blog.subvisual.co/badges/coverage.svg)](https://codeclimate.com/github/subvisual/blog.subvisual.co/coverage)

Our blog. Live @ [https://subvisual.co/blog](https://subvisual.co/blog)

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
