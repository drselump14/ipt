# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/contracts/all/contracts.rbi
#
# contracts-0.16.1

module Contracts
  def self.extended(base); end
  def self.included(base); end
  include Contracts::Attrs
  include Contracts::Builtin
end
module Contracts::Attrs
  def attr_accessor_with_contract(*names, contract); end
  def attr_reader_with_contract(*names, contract); end
  def attr_writer_with_contract(*names, contract); end
end
module Contracts::Formatters
end
class Contracts::Formatters::Expected
  def array_contract(array); end
  def contract(contract = nil); end
  def hash_contract(hash); end
  def initialize(contract, full = nil); end
end
module Contracts::Formatters::InspectWrapper
  def delim(value); end
  def empty_to_s?; end
  def empty_val?; end
  def full?; end
  def initialize(value, full); end
  def inspect; end
  def plain?; end
  def self.create(value, full = nil); end
  def strip_prefix(val); end
  def to_s; end
  def useful_to_s?; end
end
class Contracts::Formatters::ClassInspectWrapper
  def custom_to_s?; end
  def useful_inspect; end
  include Contracts::Formatters::InspectWrapper
end
class Contracts::Formatters::ObjectInspectWrapper
  def custom_to_s?; end
  def useful_inspect; end
  include Contracts::Formatters::InspectWrapper
end
module Contracts::Builtin
end
class Contracts::Builtin::Num
  def self.valid?(val); end
end
class Contracts::Builtin::Pos
  def self.valid?(val); end
end
class Contracts::Builtin::Neg
  def self.valid?(val); end
end
class Contracts::Builtin::Int
  def self.valid?(val); end
end
class Contracts::Builtin::Nat
  def self.valid?(val); end
end
class Contracts::Builtin::NatPos
  def self.valid?(val); end
end
class Contracts::Builtin::Any
  def self.valid?(val); end
end
class Contracts::Builtin::None
  def self.valid?(val); end
end
class Contracts::Builtin::CallableClass
  def self.[](*vals); end
  include Contracts::Formatters
end
class Contracts::Builtin::Or < Contracts::Builtin::CallableClass
  def initialize(*vals); end
  def to_s; end
  def valid?(val); end
end
class Contracts::Builtin::Xor < Contracts::Builtin::CallableClass
  def initialize(*vals); end
  def to_s; end
  def valid?(val); end
end
class Contracts::Builtin::And < Contracts::Builtin::CallableClass
  def initialize(*vals); end
  def to_s; end
  def valid?(val); end
end
class Contracts::Builtin::RespondTo < Contracts::Builtin::CallableClass
  def initialize(*meths); end
  def to_s; end
  def valid?(val); end
end
class Contracts::Builtin::Send < Contracts::Builtin::CallableClass
  def initialize(*meths); end
  def to_s; end
  def valid?(val); end
end
class Contracts::Builtin::Exactly < Contracts::Builtin::CallableClass
  def initialize(cls); end
  def to_s; end
  def valid?(val); end
end
class Contracts::Builtin::Enum < Contracts::Builtin::CallableClass
  def initialize(*vals); end
  def valid?(val); end
end
class Contracts::Builtin::Eq < Contracts::Builtin::CallableClass
  def initialize(value); end
  def to_s; end
  def valid?(val); end
end
class Contracts::Builtin::Not < Contracts::Builtin::CallableClass
  def initialize(*vals); end
  def to_s; end
  def valid?(val); end
end
class Contracts::Builtin::CollectionOf < Contracts::Builtin::CallableClass
  def initialize(collection_class, contract); end
  def to_s; end
  def valid?(vals); end
end
class Contracts::Builtin::CollectionOf::Factory
  def [](contract); end
  def initialize(collection_class, &before_new); end
  def new(contract); end
end
class Contracts::Builtin::Args < Contracts::Builtin::CallableClass
  def contract; end
  def initialize(contract); end
  def to_s; end
end
class Contracts::Builtin::Bool
  def self.valid?(val); end
end
class Contracts::Builtin::RangeOf < Contracts::Builtin::CallableClass
  def initialize(contract); end
  def to_s; end
  def valid?(val); end
end
class Contracts::Builtin::HashOf < Contracts::Builtin::CallableClass
  def initialize(key, value = nil); end
  def to_s; end
  def valid?(hash); end
  def validate_hash(hash); end
end
class Contracts::Builtin::StrictHash < Contracts::Builtin::CallableClass
  def contract_hash; end
  def initialize(contract_hash); end
  def valid?(arg); end
end
class Contracts::Builtin::KeywordArgs < Contracts::Builtin::CallableClass
  def initialize(options); end
  def inspect; end
  def options; end
  def to_s; end
  def valid?(hash); end
end
class Contracts::Builtin::DescendantOf < Contracts::Builtin::CallableClass
  def initialize(parent_class); end
  def inspect; end
  def parent_class; end
  def to_s; end
  def valid?(given_class); end
end
class Contracts::Builtin::Optional < Contracts::Builtin::CallableClass
  def contract; end
  def ensure_within_opt_hash; end
  def formatted_contract; end
  def initialize(contract); end
  def inspect; end
  def self._valid?(hash, key, contract); end
  def to_s; end
  def valid?(value); end
  def within_opt_hash!; end
  def within_opt_hash; end
end
class Contracts::Builtin::Maybe < Contracts::Builtin::Or
  def include_proc?; end
  def initialize(*vals); end
end
class Contracts::Builtin::Func < Contracts::Builtin::CallableClass
  def contracts; end
  def initialize(*contracts); end
end
module Contracts::MethodDecorators
  def Contract(*args, &blk); end
  def inherited(subclass); end
  def method_added(name); end
  def self.extended(klass); end
  def singleton_method_added(name); end
end
class Contracts::Decorator
  def initialize(klass, method); end
  def self.decorators; end
  def self.decorators=(arg0); end
  def self.inherited(klass); end
end
class ContractBaseError < ArgumentError
  def data; end
  def initialize(message, data); end
  def to_contract_error; end
end
class ContractError < ContractBaseError
end
class ParamContractError < ContractError
end
class ReturnContractError < ContractError
end
class PatternMatchingError < ContractBaseError
  def to_contract_error; end
end
class InvariantError < StandardError
  def to_contract_error; end
end
class Contracts::ContractsNotIncluded < TypeError
  def initialize(message = nil); end
  def message; end
  def to_s; end
end
module Contracts::Invariants
  def self.common(base); end
  def self.extended(base); end
  def self.included(base); end
  def verify_invariants!(method); end
end
module Contracts::Invariants::InvariantExtension
  def invariant(name, &condition); end
  def invariants; end
end
class Contracts::Invariants::Invariant
  def check_on(target, method); end
  def expected; end
  def initialize(klass, name, &condition); end
  def self.failure_callback(data); end
  def self.failure_msg(data); end
end
class Contracts::MethodReference
  def alias_target(this); end
  def aliased_name; end
  def construct_unique_name; end
  def initialize(name, method); end
  def make_alias(this); end
  def make_definition(this, &blk); end
  def make_private(this); end
  def make_protected(this); end
  def method_position; end
  def name; end
  def private?(this); end
  def protected?(this); end
  def send_to(this, *args, &blk); end
end
class Contracts::SingletonMethodReference < Contracts::MethodReference
  def alias_target(this); end
  def private?(this); end
  def protected?(this); end
end
module Contracts::Support
  def self.contract_id(contract); end
  def self.eigenclass?(target); end
  def self.eigenclass_hierarchy_supported?; end
  def self.eigenclass_of(target); end
  def self.indent_string(string, amount); end
  def self.method_name(method); end
  def self.method_position(method); end
  def self.module_eigenclass?(target); end
  def self.unique_id; end
end
module Contracts::Engine
  def self.applied?(*args, &block); end
  def self.apply(*args, &block); end
  def self.base_engine; end
  def self.fetch_from(*args, &block); end
end
class Contracts::Engine::Base
  def add_method_decorator(type, name, decorator); end
  def all_decorators; end
  def clear_decorators; end
  def decorate(decorator_class, *args); end
  def decorated_methods; end
  def decorated_methods?; end
  def decorated_methods_for(type, name); end
  def decorators; end
  def eigenclass; end
  def eigenclass_engine; end
  def initialize(klass); end
  def klass; end
  def nearest_decorated_ancestor; end
  def pop_decorators; end
  def self.applied?(klass); end
  def self.apply(klass); end
  def self.fetch_from(klass); end
  def set_eigenclass_owner; end
  def validate!; end
end
class Contracts::Engine::Target
  def applied?; end
  def apply(engine_class = nil); end
  def apply_to_eigenclass; end
  def eigenclass; end
  def engine; end
  def initialize(target); end
  def meaningless_eigenclass?; end
  def target; end
end
class Contracts::Engine::Eigenclass < Contracts::Engine::Base
  def all_decorators; end
  def owner?; end
  def owner_class; end
  def owner_class=(arg0); end
  def self.lift(eigenclass, owner); end
  def set_eigenclass_owner; end
  def validate!; end
end
class Contracts::MethodHandler
  def _method_type; end
  def decorated_methods; end
  def decorator; end
  def decorator_args; end
  def decorator_class; end
  def decorators; end
  def engine; end
  def engine?; end
  def handle; end
  def ignore_decorators?; end
  def initialize(method_name, is_class_method, target); end
  def is_class_method; end
  def mark_pattern_matching_decorators; end
  def method_name; end
  def method_reference; end
  def method_type; end
  def pattern_matching?; end
  def raw_method; end
  def redefine_method; end
  def target; end
  def validate_decorators!; end
  def validate_pattern_matching!; end
end
module Contracts::Validators
  def clean_memoized_validators; end
  def make_validator!(contract); end
  def make_validator(contract); end
  def memoized_validators; end
  def override_validator(name, &block); end
  def reset_validators; end
  def restore_validators; end
  def validator_strategies; end
end
module Contracts::CallWith
  def call_with(this, *args, &blk); end
  def call_with_inner(returns, this, *args, &blk); end
end
module Contracts::Core
  def self.common(base); end
  def self.extended(base); end
  def self.included(base); end
end
class Contract < Contracts::Decorator
  def [](*args, &blk); end
  def args_contracts; end
  def call(*args, &blk); end
  def failure_exception; end
  def initialize(klass, method, *contracts); end
  def klass; end
  def maybe_append_block!(args, blk); end
  def maybe_append_options!(args, blk); end
  def method; end
  def pattern_match!; end
  def pattern_match?; end
  def pretty_contract(c); end
  def ret_contract; end
  def self.failure_callback(data, use_pattern_matching = nil); end
  def self.failure_msg(data); end
  def self.fetch_failure_callback; end
  def self.override_failure_callback(&blk); end
  def self.restore_failure_callback; end
  def self.valid?(arg, contract); end
  def to_s; end
  extend Contracts::Validators
  include Contracts::CallWith
end
