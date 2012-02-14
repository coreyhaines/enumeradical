require 'core_extensions/object'

module Enumerable
  def map_into(into = nil)
    do_map into, :[]
  end

  def map_to(to = nil)
    do_map to, :new
  end

private
  def do_map(obj, method)
    return self unless obj
    raise ArgumentError, "argument must respond to #{method}" unless obj.respond_to?(method)
    obj.map_over(self, method)
  end
end

