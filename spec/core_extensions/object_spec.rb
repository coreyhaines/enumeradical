require 'core_extensions/object'

describe "CoreExtensions::Object" do
  class MixedIn
    include CoreExtensions::Object
    def multiple_by_two(number)
      number*2
    end
  end

  describe "#map_over" do
    let(:object) { MixedIn.new }
    let(:list) { [1,2,3] }
    it "maps the method over each element of the given list" do
      object.map_over(list, :multiple_by_two).should == [2,4,6]
    end

    it "supports passing a string as the name of the method" do
      object.map_over(list, "multiple_by_two").should == [2,4,6]
    end

    context "invalid usage" do
      it "requires a list that can be iterated over" do
        lambda {
        object.map_over(Object.new, :multiple_by_two).should == [2,4,6]
        }.should raise_error(ArgumentError, "given list must support map")
      end

      it "returns an empty list if list is nil" do
        object.map_over(nil, :multiple_by_two).should be_empty
      end
    end
  end
end
