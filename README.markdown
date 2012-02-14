# Enumeradical
## A most amazing collection of useful functions filling common tasks when iterating over collections

## What is this?
I love enumerable. I really do. I use the functions it provides with the utmost alacrity. Nothing makes me sadder than seeing a #each used to populate an array. Once you start using them a lot in production systems, you notice a bunch of common patterns.

* I have an array of objects, and I need to convert them to another type.
    class MyNumberPresenter
      def initialize(number)
        @number = number
        end
      end
    end

    [1,2,3].map { |number| MyNumberPresenter.new(number) }

NO MORE! Use Enumerable#map_to(type)

    class MyNumberPresenter
      def initialize(number)
        @number = number
        end
      end
    end

    [1,2,3].map_to MyNumberPresenter # => [#<MyNumberPresenter:0x0000010086b9c8 @number=1>, #<MyNumberPresenter:0x0000010086b630 @number=2>, #<MyNumberPresenter:0x0000010086b540 @number=3>]

* I have an array of objects, and I want to map them to the value they give from indexing into another object
```ruby
require 'date'
[1,2,3].map { |index| Date::ABBR_DAYNAMES[index] }
```
NO MORE! Use Enumerable#map_into
```ruby
require 'date'
[1,2,3].map_into Date::ABBR_DAYNAMES # => ["Mon", "Tue", "Wed"]
```




## Who built this
Originally, [Corey Haines](http://github.com/coreyhaines) and [Ryan Briones](http://github.com/ryanbriones)
