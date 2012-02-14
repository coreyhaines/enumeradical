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
end

