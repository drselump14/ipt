# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/equatable/all/equatable.rbi
#
# equatable-0.5.0

module Equatable
  def attr_reader(*args); end
  def comparison_attrs; end
  def define_compare; end
  def define_comparison_attrs; end
  def define_hash; end
  def define_inspect; end
  def define_methods; end
  def inherited(subclass); end
  def self.included(base); end
end
module Equatable::Methods
  def ==(other); end
  def eql?(other); end
end