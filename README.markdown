[![Build Status](https://secure.travis-ci.org/coreyhaines/enumeradical.png)](http://travis-ci.org/coreyhaines/enumeradical) works on ALL THE RUBIES!

# Enumeradical
## A most amazing collection of useful functions filling common tasks when iterating over collections

## What is this?
I love enumerable. I really do. I use the functions it provides with the utmost alacrity. Nothing makes me sadder than seeing a #each used to populate an array. Once you start using them a lot in production systems, you notice a bunch of common patterns.

## How do I use it?
It is a gem, so just do

    gem install enumeradical

then rock the house by requiring it. It sets itself up!

    require 'enumeradical'

## Why would I use it?

###I have an array of objects, and I need to convert them to another type.

    class MyNumberPresenter
      def initialize(number)
        @number = number
      end
    end

    [1,2,3].map { |number| MyNumberPresenter.new(number) }
    # => [#<MyNumberPresenter:0x0000010086b9c8 @number=1>, #<MyNumberPresenter:0x0000010086b630 @number=2>,
          #<MyNumberPresenter:0x0000010086b540 @number=3>]

**NO MORE!** Use Enumerable#map_to(type)

    class MyNumberPresenter
      def initialize(number)
        @number = number
      end
    end

    [1,2,3].map_to MyNumberPresenter
    # => [#<MyNumberPresenter:0x0000010086b9c8 @number=1>, #<MyNumberPresenter:0x0000010086b630 @number=2>,
          #<MyNumberPresenter:0x0000010086b540 @number=3>]

###I have an array of objects, and I want to map them to the value they give from indexing into another object.

    require 'date'
    [1,2,3].map { |index| Date::ABBR_DAYNAMES[index] } # => ["Mon", "Tue", "Wed"]

**NO MORE!** Use Enumerable#map_into

    require 'date'
    [1,2,3].map_into Date::ABBR_DAYNAMES # => ["Mon", "Tue", "Wed"]


###I have an array of objects, and I'd like to convert them using a given object's method.

    class Converter
      def hellos(times)
        "hello"*times
      end
    end

    converter = Converter.new

    [1,2,3].map { |times| converter.hellos(times) }
    # => ["hello", "hellohello", "hellohellohello"]

**NO MORE!** Use Object#map_over

    class Converter
      def hellos(times)
        "hello"*times
      end
    end

    converter = Converter.new

    converter.map_over [1,2,3], :hellos
    # => ["hello", "hellohello", "hellohellohello"]

## Is this useful?
YES!!!!! Use it.

## Who built this
[Corey Haines](http://github.com/coreyhaines) and [Ryan Briones](http://github.com/ryanbriones)

## License

MIT. See [LICENSE](https://github.com/coreyhaines/enumeradical/blob/master/License.txt)

