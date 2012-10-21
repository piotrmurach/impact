# Impact
[![Build Status](https://secure.travis-ci.org/peter-murach/impact.png?branch=master)][travis]

Ruby backend for Impact.js framework.

## Installation

Add this line to your application's Gemfile:

    gem 'impact'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install impact

## Usage

Change your game config paths to:

```javascript
  'api': {
    'save': 'lib/weltmeister/api/save',
    'browse': 'lib/weltmeister/api/browse',
    'glob': 'lib/weltmeister/api/glob'
  }
```

And start up the server by running in the project directory:

```shell
  impact
```

To see available server settings do:

```shell
  impact -h
```

Visit the `localhost:4567` to see the game and `localhost:4567/weltmeister` to see level editor.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
