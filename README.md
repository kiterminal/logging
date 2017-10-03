# logging

[![Build Status](https://travis-ci.org/kiterminal/logging.svg?branch=master)](https://travis-ci.org/kiterminal/logging)

Logging is a logger for Crystal language

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  logging:
    github: kiterminal/logging
```

## Usage

```crystal
require "logging"

logger = Logging::Logger.new

logger.debug("Debug message doesn't show in log file")
logger.info("Info message will be in log file")

```

## Contributing

1. Fork it ( https://github.com/kiterminal/logging/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [kiterminal](https://github.com/kiterminal) Chainarin Thanichaiyawat - creator, maintainer
