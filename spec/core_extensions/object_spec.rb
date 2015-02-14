require 'core_extensions/object'

describe "CoreExtensions::Object" do
  class MixedIn
    include Enumeradical::CoreExtensions::Object
    def multiple_by_two(number)
      number*2
    end
  end

  describe "#map_over" do
    let(:object) { MixedIn.new }
    let(:list) { [1,2,3] }
    it "maps the method over each element of the given list" do
      expect(object.map_over(list, :multiple_by_two)).to eq([2,4,6])
    end

    it "supports passing a string as the name of the method" do
      expect(object.map_over(list, "multiple_by_two")).to eq([2,4,6])
    end

    context "invalid usage" do
      it "requires a list that can be iterated over" do
        expect {
        expect(object.map_over(Object.new, :multiple_by_two)).to eq([2,4,6])
        }.to raise_error(ArgumentError, "given list must support map")
      end

      it "returns an empty list if list is nil" do
        expect(object.map_over(nil, :multiple_by_two)).to be_empty
      end
    end
  end
end
