# Subvisual Blog [![Build Status](https://semaphoreci.com/api/v1/projects/d4cb3462-8468-4dca-888f-9e311039ce8d/430739/shields_badge.svg)](https://semaphoreci.com/gb/blog-subvisual-co)

Our blog. Live @ [blog.subvisual.co](blog.subvisual.co)

# Development Setup

## Dependencies

  The app currently depends on elasticsearch being running. Errors may occur during development/test if it isn't

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
