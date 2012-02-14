module CoreExtensions
  module Object
    def map_over(this_list, with_this_method)
      return [] unless this_list
      raise ArgumentError.new("given list must support map") unless this_list.respond_to?(:map)
      this_list.map &method(with_this_method)
    end
  end
end

