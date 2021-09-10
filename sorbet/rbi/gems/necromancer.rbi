# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/necromancer/all/necromancer.rbi
#
# necromancer-0.3.0

module Necromancer
  def new(&block); end
  def self.new(&block); end
end
class Necromancer::Conversions
  def [](source, target); end
  def add_config(converter, config); end
  def converter_map; end
  def fail_no_type_conversion_available(key); end
  def generate_key(converter); end
  def initialize(configuration = nil); end
  def load; end
  def register(converter = nil, &block); end
  def to_hash; end
end
class Necromancer::Configuration
  def copy(value = nil); end
  def copy=(arg0); end
  def initialize; end
  def strict(value = nil); end
  def strict=(arg0); end
end
class Necromancer::Context
  def can?(source, target); end
  def configuration; end
  def configure; end
  def conversions; end
  def convert(object = nil, &block); end
  def initialize(&block); end
  def register(*args, &block); end
  extend Forwardable
end
class Necromancer::Converter
  def call(*arg0); end
  def config; end
  def convert; end
  def convert=(arg0); end
  def fail_conversion_type(value); end
  def initialize(source = nil, target = nil); end
  def self.create(&block); end
  def source; end
  def source=(arg0); end
  def target; end
  def target=(arg0); end
end
class Necromancer::NullConverter < Necromancer::Converter
  def call(value, options = nil); end
end
module Necromancer::ArrayConverters
  def self.load(conversions); end
end
class Necromancer::ArrayConverters::StringToArrayConverter < Necromancer::Converter
  def call(value, options = nil); end
end
class Necromancer::ArrayConverters::ArrayToNumericConverter < Necromancer::Converter
  def call(value, options = nil); end
end
class Necromancer::ArrayConverters::ArrayToBooleanConverter < Necromancer::Converter
  def call(value, options = nil); end
end
class Necromancer::ArrayConverters::ObjectToArrayConverter < Necromancer::Converter
  def call(value, options = nil); end
end
class Necromancer::ArrayConverters::ArrayToSetConverter < Necromancer::Converter
  def call(value, options = nil); end
end
module Necromancer::BooleanConverters
  def self.load(conversions); end
end
class Necromancer::BooleanConverters::StringToBooleanConverter < Necromancer::Converter
  def call(value, options = nil); end
end
class Necromancer::BooleanConverters::IntegerToBooleanConverter < Necromancer::Converter
  def call(value, options = nil); end
end
class Necromancer::BooleanConverters::BooleanToIntegerConverter < Necromancer::Converter
  def call(value, options = nil); end
end
module Necromancer::DateTimeConverters
  def self.load(conversions); end
end
class Necromancer::DateTimeConverters::StringToDateConverter < Necromancer::Converter
  def call(value, options = nil); end
end
class Necromancer::DateTimeConverters::StringToDateTimeConverter < Necromancer::Converter
  def call(value, options = nil); end
end
module Necromancer::NumericConverters
  def self.load(conversions); end
end
class Necromancer::NumericConverters::StringToIntegerConverter < Necromancer::Converter
  def call(value, options = nil); end
end
class Necromancer::NumericConverters::IntegerToStringConverter < Necromancer::Converter
  def call(value, _); end
end
class Necromancer::NumericConverters::StringToFloatConverter < Necromancer::Converter
  def call(value, options = nil); end
end
class Necromancer::NumericConverters::StringToNumericConverter < Necromancer::Converter
  def call(value, options = nil); end
end
module Necromancer::RangeConverters
  def self.load(conversions); end
end
class Necromancer::RangeConverters::StringToRangeConverter < Necromancer::Converter
  def call(value, options = nil); end
end
class Necromancer::ConversionTarget
  def conversions; end
  def detect(object); end
  def from(source); end
  def initialize(conversions, object); end
  def object; end
  def self.for(context, value, block); end
  def source; end
  def to(target, options = nil); end
end
module Necromancer::ConversionTarget::UndefinedValue
end
class Necromancer::ConversionTypeError < StandardError
end
class Necromancer::NoTypeConversionAvailableError < StandardError
end
