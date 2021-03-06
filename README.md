# 🌈 web_service_uri

[![CircleCI](https://circleci.com/gh/tanakaworld/web_service_uri/tree/master.svg?style=svg)](https://circleci.com/gh/tanakaworld/web_service_uri/tree/master)
[![Gem Version](https://badge.fury.io/rb/web_service_uri.svg)](https://badge.fury.io/rb/web_service_uri)

URI parser for web services in the world.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'web_service_uri'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install web_service_uri

## Usage

```ruby
# expected URI
ws_uri = WebServiceUri::WebServiceUri.new "https://github.com/tanakaworld"
ws_uri.github?
# => true
ws_uri.twitter?
# => false 
ws_uri.valid?
# => true
ws_uri.account_id
# => "tanakaworld"

# unexpected URI
invalid_ws_uri = WebServiceUri::WebServiceUri.new "https://example.com/example"
invalid_ws_uri.valid?
# => false
invalid_ws_uri.account_id
# => nil
```

## Support services

- [GitHub](https://github.com/)
- [Twitter](https://twitter.com/)
- [Facebook](https://www.facebook.com/)
- [LinkedIn](https://www.linkedin.com/)
- [Instagram](https://www.instagram.com/)

```
WebServiceUri::WebServiceUri.available_services
# => [:github, :twitter, :facebook, :linkedin, :instagram]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tanakaworld/web_service_uri. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WebServiceUri project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/tanakaworld/web_service_uri/blob/master/CODE_OF_CONDUCT.md).
