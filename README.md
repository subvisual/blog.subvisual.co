# GB Blog

[![BuildStatus](https://semaphoreapp.com/api/v1/projects/245a3016-039e-4141-b343-f7940cb7e3ff/302931/badge.png)](https://semaphoreapp.com/groupbuddies/gb-blog)

Our blog. Live @ [blog.groupbuddies.com](blog.groupbuddies.com)

# Development Guide

## Setting up

    git clone git@github.com/groupbuddies/gb-blog
    cd gb-blog
    bin/setup

## Development server

    bin/server

## Test suite (rubocop + RSpec)

    bundle exec rake

## Deployment

    bundle exec cap production deploy
