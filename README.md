# ClinicSearcher

`ClinicSearcher` is a Ruby gem that provides an easy way to search for nearby clinics from FDA's  based on a given zipcode and distance. The gem interacts with a Rails API endpoint, which should be protected by an authentication token.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'clinic_searcher', git: "https://github.com/alexjabf/clinic_searcher.git"
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install clinic_searcher, --source https://github.com/alexjabf/clinic_searcher.git
```

## Configuration

Before using the gem, ensure you have the following environment variables set up:

- `API_ENDPOINT`: The Rails API endpoint where the gem will send requests.
- `AUTH_TOKEN`: The authentication token used in the `X-Auth-Token` header for the request.
- `RATIO_DISTANCE` (optional): The default search radius in miles. Defaults to 20 if not set.

## Usage

To search for clinics near a zipcode, simply call the `search` method on the `ClinicSearcher` module:

```ruby
clinics = ClinicSearcher.search(zipcode)
```

You can also provide an optional distance parameter to override the default search radius:

```ruby
clinics = ClinicSearcher.search(zipcode, distance)
```

The `search` method will return a parsed JSON object containing the list of clinics found within the specified distance of the given zipcode.

## Testing

The gem includes RSpec tests. To run the tests, execute:

```
$ bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/alexjabf/clinic_searcher.

## License

The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Author

Alejandro Ballesteros - alexjabf@hotmail.com