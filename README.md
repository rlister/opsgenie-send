# Opsgenie::Send

Simplest possible ruby library to send alerts and heartbeats to
[Opsgenie](https://www.opsgenie.com/).

That's all it does: ~~one~~ two things well.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'opsgenie-send'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install opsgenie-send
```

## Usage

Set environment variable to your Opsgenie API key:

```
export OPSGENIE_KEY=xxx
```

Run from the command-line:

```
opsgenie-alert Test alert
opsgenie-heartbeat Test heartbeat
```

Run from your code:

```ruby
require 'opsgenie/send'
Opsgenie::Send.heartbeat('Test heartbeat')
Opsgenie::Send.alert('Test alert')
```

The methods return the JSON string response from Opsgenie.

You may pass optional parameters to alerts (see the list at
https://www.opsgenie.com/docs/web-api/alert-api#createAlertRequest):

```ruby
Opsgenie::Send.alert('Test alert', tags: %w[foo bar])
```

## Development

After checking out the repo, run `bin/setup` to install
dependencies. You can also run `bin/console` for an interactive prompt
that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake
install`. To release a new version, update the version number in
`version.rb`, and then run `bundle exec rake release`, which will
create a git tag for the version, push git commits and tags, and push
the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/[USERNAME]/opsgenie-send. This project is intended
to be a safe, welcoming space for collaboration, and contributors are
expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of
conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).