# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `builder` gem.
# Please instead update this file by running `bin/tapioca sync`.

# typed: true

class Integer < ::Numeric
  include ::JSON::Ext::Generator::GeneratorMethods::Integer
end

Integer::GMP_VERSION = T.let(T.unsafe(nil), String)

class Symbol
  include ::Comparable
end
