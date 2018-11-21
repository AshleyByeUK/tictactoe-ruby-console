[![Build Status](https://travis-ci.org/AshleyByeUK/tictactoe-ruby.svg?branch=master)](https://travis-ci.org/AshleyByeUK/tictactoe-ruby-console)
[![codecov](https://codecov.io/gh/AshleyByeUK/tictactoe-ruby/branch/master/graph/badge.svg)](https://codecov.io/gh/AshleyByeUK/tictactoe-ruby-console)

# tictactoe-ruby-console

A console game of [TicTacToe](https://github.com/AshleyByeUK/tictactoe-ruby-core). Play against each other
or the computer on a 3x3 or 4x4 board. See if you can win!

## Requirements

The game depends on Ruby version 2.5.2 or greater. It has not been tested against earlier versions. Testing
has only been carried out on macOS.

## Downloading

To download the source, clone the repository:

```
git@github.com:AshleyByeUK/tictactoe-ruby-console.git
cd tictactoe-ruby-console
bundle install
```

All of the following commands assume the current working directory is `tictactoe-ruby-console`.

## Playing

Run the game (executable from anywhere - add the `bin` directory to your `PATH` if you want):

```
bin/tictactoe
```

## Testing

Running the tests:

```
bundle exec rspec
```

Or:

```
bundle exec rspec --format doc
```

Once `rspec` has run, you can view the code coverage report in your web browser:

```
open ./coverage/index.html
```
