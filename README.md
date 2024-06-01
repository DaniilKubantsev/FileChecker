# FileChecker

## Installation

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install FileChecker

## Usage
Create an instance of file checker class

    @file_checker = FileChecker::FileChecker.new

to use the gem you need to call the `is_<file_type>?` methods

    result = @file_checker.is_json?('example.json') #true
    result = @file_checker.is_json?('invalid.json') #false

## Supported file types

    json
    png
    pdf
    xml
    txt
    html
    jpg
    bin
    doxc


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/FileChecker.
