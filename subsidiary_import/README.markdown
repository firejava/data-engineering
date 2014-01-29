# Submission for Senior Software Engineer Challenge

This application is a submission for the Senior Software Engineer Challenge. It is a Rails 4 application using the RSpec testing framework and SQLite database engine.

## Quick Start

To install dependencies, [re]build the development/test databases, run specs, and start the server

    bin/bootstrap

_Note: The script will stop upon an non-zero exit code of any commands. This includes a failing spec suite._

If for some reason this fails, you can try manually running

    bin/bundle install
    bin/rake db:setup
    bin/rails server

From here on out, run

    bin/bundle exec rspec

to run the spec suite and

    bin/rails server

to start the server.

    bin/rake db:reset

can be used to rebuild the development database.

## Gem Dependencies

Aside from the default set of Gem dependencies for a Rails application + RSpec, the following dependencies are used:

- [CarrierWave](https://github.com/carrierwaveuploader/carrierwave) - for file uploads
