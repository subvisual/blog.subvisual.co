# GB Blog [![Build Status](https://semaphoreapp.com/api/v1/projects/245a3016-039e-4141-b343-f7940cb7e3ff/302931/shields_badge.svg)](https://semaphoreapp.com/groupbuddies/gb-blog)

Our blog. Live @ [blog.groupbuddies.com](blog.groupbuddies.com)

# Development Setup

## Dependencies

  The app currently depends on elasticsearch being running. Errors may occur during development/test if it isn't

## Setup

    git clone git@github.com/groupbuddies/gb-blog
    cd gb-blog
    bin/setup

    # running the server
    bin/server

    # running the test suite
    bundle exec rake

    # deploy
    bundle exec cap production deploy
