# Rack::Cgi

Rack::Cgi is a Rack app that execute a cgi script

## Installation

Add this line to your application's Gemfile:

    gem 'rack-cgi'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-cgi

## Usage

    run Rack::Cgi.new("cgi-script", {"env" => "variables"})

## Notes

Normally if you want to use a cgi the best option is to use it directly from
the server.

CGI allocates a proces for each request, operation that is too expension and
probably mainly reason because they are no longer in use.

This server load the body in memory so huge post will kill your machine.

This software probably have some kind of security issues, and should be
checking if your installation could be compromise.

You are the responsable of your deploys.

## Example

    run Rack::CGI.new(%w(git http-backend), {"GIT_PROJECT_ROOT" => "my git repo"})

This will mount a http git backend

You probably want to use some kind of middle wares for the auth.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
