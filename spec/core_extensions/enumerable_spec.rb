require "core_extensions/enumerable"
Object.send :include, Enumeradical::CoreExtensions::Object

describe "CoreExtensions::Enumerable" do
  describe "#map_into" do
    example "empty array maps into empty array" do
      [].map_into.should be_empty
    end

    example "not passing an object is considered identity map" do
      [1].map_into.should == [1]
    end

    it "looks up the value from given object" do
      [1].map_into({1 => "foo"}).should == ["foo"]
    end

    context "invalid situations" do
      context "mapping into a non-indexable object" do
        it "raises ArgumentError" do
          lambda {
            [1].map_into(Object.new)
          }.should raise_error(ArgumentError, "argument must respond to []")
        end
      end
    end
  end

  describe "#map_to" do
    class ObjectWithOnConstructorArgument
      attr_accessor :arg
      def initialize(arg)
        @arg = arg
      end
    end

    example "empty array maps into empty array" do
      [].map_to.should be_empty
    end

    example "not passing an object is considered identity map" do
      [1].map_to.should == [1]
    end

    it "instantiates the given object with item from array" do
      created_object = [2].map_to(ObjectWithOnConstructorArgument).first
      created_object.arg.should == 2
    end

    context "invalid situations" do
      context "mapping into a object without .new" do
        it "raises ArgumentError" do
          lambda {
            [1].map_to(Object.new)
          }.should raise_error(ArgumentError, "argument must respond to new")
        end
      end
    end
  end

  describe "#sort_like" do

    class Sortable
      def initialize(arg)
        self.arg = arg
      end
      attr_accessor :arg
    end

    before do
      @sample_array = [Sortable.new(14), Sortable.new(24), Sortable.new(34), Sortable.new(44)]
      @template_array = [24, 44, 14, 34]
    end

    example "sorts like the template using the given method name" do
      sorted = @sample_array.sort_like(@template_array, :arg)
      sorted.map(&:arg).should == @template_array
    end

    example "sorts like the template using the given block" do
      sorted = @sample_array.sort_like(@template_array) { |x| x.arg }
      sorted.map(&:arg).should == @template_array
    end

    example "sorts correctly even if template array includes extra items" do
      @template_array = ([54] + @template_array + [4])
      sorted = @sample_array.sort_like(@template_array, :arg)
      sorted.map(&:arg).should == (@template_array - [4, 54])
    end

    example "sorts correctly even if the template array includes fewer items" do
      @template_array = (@template_array - [14])
      sorted = @sample_array.sort_like(@template_array) { |x| x.arg }
      sorted.map(&:arg).should == [24, 44, 34, 14]
    end

    example "raises an error if the item doesn't respond to the given method" do
      lambda {
        @sample_array.sort_like(@template_array, :foo)
      }.should raise_error(NoMethodError)
    end
  end
end

