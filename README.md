# Calc

Calc is safe, simple, pure Ruby mathematical expressions evaluator (calculator) library.

Although based on Ruby 'eval', it takes special care to sanitize the expression.

Calc supports all basic mathematical operations +, -, \*, / and the power function (through ** operator).
Calc also supports parenthesis and nesting.
Calc does NOT support advanced mathematical functions like trigonometry, logarithm, etc.

Calc plays well with Rails ActiveModel::Validations.
If the supplied expression is invalid (nil, blank, or syntax error),
it returns the expression itself verbatim,
thus allowing to handle errors via Rails validations.

## Usage

    require 'calc'

    Calc.evaluate( "2 + 2" )  # => 4

    Calc.evaluate( "2 * (1 + 9)" )  # => 20

    Calc.evaluate( "2 ** (1.0 / 2)" )  # => 1.4142135623730951  (the square of two)

    Calc.evaluate( "( ( 2 - 3 ) / 13 * ( 50 + 325.843 ) ) ** 3" )  # => -53090815.704202116

## Installation

    gem install calc

## Using Bundler?

Add the following to your Gemfile:

    gem 'calc'

Then run as usual:

    bundle

## Calc is safe

Calc defines a white list of characters allowed in the expression to prevent code injection attacks.
All letters are outlawed as well as majority of other characters. Calc comes with tests.

## License

Copyright (C) 2010 Piotr 'Qertoip' Włodarek. Distributed under the MIT License.