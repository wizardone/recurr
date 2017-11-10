# Recurr
Recurr allows you to manage recurring events in a Rails application
(ouch!)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recurr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install recurr

## Usage
1. First run the generator to copy the necessary migration.

2. Run the migration with `rake db:migrate`.

3. Let's say you have an `Event` model and you want it to be recurring.

```ruby
class NoticeEvent < ApplicationRecord
  include Recurr::Event
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/wizardonee/recurr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

