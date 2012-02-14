require_relative "enumeradical/version"
require_relative "enumeradical/core_extensions/object"
require_relative "enumeradical/core_extensions/enumerable"

module Enumeradical
end
Object.send :include, Enumeradical::CoreExtensions::Object
