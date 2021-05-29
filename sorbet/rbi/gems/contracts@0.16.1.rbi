# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `contracts` gem.
# Please instead update this file by running `bin/tapioca sync`.

# typed: true

class Contract < ::Contracts::Decorator
  include ::Contracts::CallWith
  extend ::Contracts::Validators

  def initialize(klass, method, *contracts); end

  def [](*args, &blk); end
  def args_contracts; end
  def call(*args, &blk); end
  def failure_exception; end
  def klass; end
  def maybe_append_block!(args, blk); end
  def maybe_append_options!(args, blk); end
  def method; end
  def pattern_match!; end
  def pattern_match?; end
  def pretty_contract(c); end
  def ret_contract; end
  def to_s; end

  class << self
    def failure_callback(data, use_pattern_matching = T.unsafe(nil)); end
    def failure_msg(data); end
    def fetch_failure_callback; end
    def override_failure_callback(&blk); end
    def restore_failure_callback; end
    def valid?(arg, contract); end
  end
end

Contract::DEFAULT_FAILURE_CALLBACK = T.let(T.unsafe(nil), Proc)

class ContractBaseError < ::ArgumentError
  def initialize(message, data); end

  def data; end
  def to_contract_error; end
end

class ContractError < ::ContractBaseError; end

module Contracts
  include ::Contracts::Attrs
  include ::Contracts::Builtin
  include ::Contracts::Core

  class << self
    def extended(base); end
    def included(base); end
  end
end

module Contracts::Attrs
  def attr_accessor_with_contract(*names, contract); end
  def attr_reader_with_contract(*names, contract); end
  def attr_writer_with_contract(*names, contract); end
end

module Contracts::Builtin; end

class Contracts::Builtin::And < ::Contracts::Builtin::CallableClass
  def initialize(*vals); end

  def to_s; end
  def valid?(val); end
end

class Contracts::Builtin::Any
  class << self
    def valid?(val); end
  end
end

class Contracts::Builtin::Args < ::Contracts::Builtin::CallableClass
  def initialize(contract); end

  def contract; end
  def to_s; end
end

Contracts::Builtin::ArrayOf = T.let(T.unsafe(nil), Contracts::Builtin::CollectionOf::Factory)

class Contracts::Builtin::Bool
  class << self
    def valid?(val); end
  end
end

class Contracts::Builtin::CallableClass
  include ::Contracts::Formatters

  class << self
    def [](*vals); end
  end
end

class Contracts::Builtin::CollectionOf < ::Contracts::Builtin::CallableClass
  def initialize(collection_class, contract); end

  def to_s; end
  def valid?(vals); end
end

class Contracts::Builtin::CollectionOf::Factory
  def initialize(collection_class, &before_new); end

  def [](contract); end
  def new(contract); end
end

class Contracts::Builtin::DescendantOf < ::Contracts::Builtin::CallableClass
  def initialize(parent_class); end

  def inspect; end
  def to_s; end
  def valid?(given_class); end

  private

  def parent_class; end
end

class Contracts::Builtin::Enum < ::Contracts::Builtin::CallableClass
  def initialize(*vals); end

  def valid?(val); end
end

class Contracts::Builtin::Eq < ::Contracts::Builtin::CallableClass
  def initialize(value); end

  def to_s; end
  def valid?(val); end
end

class Contracts::Builtin::Exactly < ::Contracts::Builtin::CallableClass
  def initialize(cls); end

  def to_s; end
  def valid?(val); end
end

class Contracts::Builtin::Func < ::Contracts::Builtin::CallableClass
  def initialize(*contracts); end

  def contracts; end
end

class Contracts::Builtin::HashOf < ::Contracts::Builtin::CallableClass
  def initialize(key, value = T.unsafe(nil)); end

  def to_s; end
  def valid?(hash); end

  private

  def validate_hash(hash); end
end

Contracts::Builtin::HashOf::INVALID_KEY_VALUE_PAIR = T.let(T.unsafe(nil), String)

class Contracts::Builtin::Int
  class << self
    def valid?(val); end
  end
end

class Contracts::Builtin::KeywordArgs < ::Contracts::Builtin::CallableClass
  def initialize(options); end

  def inspect; end
  def to_s; end
  def valid?(hash); end

  private

  def options; end
end

class Contracts::Builtin::Maybe < ::Contracts::Builtin::Or
  def initialize(*vals); end

  def include_proc?; end
end

class Contracts::Builtin::Nat
  class << self
    def valid?(val); end
  end
end

class Contracts::Builtin::NatPos
  class << self
    def valid?(val); end
  end
end

class Contracts::Builtin::Neg
  class << self
    def valid?(val); end
  end
end

class Contracts::Builtin::None
  class << self
    def valid?(val); end
  end
end

class Contracts::Builtin::Not < ::Contracts::Builtin::CallableClass
  def initialize(*vals); end

  def to_s; end
  def valid?(val); end
end

class Contracts::Builtin::Num
  class << self
    def valid?(val); end
  end
end

class Contracts::Builtin::Optional < ::Contracts::Builtin::CallableClass
  def initialize(contract); end

  def inspect; end
  def to_s; end
  def valid?(value); end
  def within_opt_hash!; end

  private

  def contract; end
  def ensure_within_opt_hash; end
  def formatted_contract; end
  def within_opt_hash; end

  class << self
    def _valid?(hash, key, contract); end
  end
end

Contracts::Builtin::Optional::UNABLE_TO_USE_OUTSIDE_OF_OPT_HASH = T.let(T.unsafe(nil), String)

class Contracts::Builtin::Or < ::Contracts::Builtin::CallableClass
  def initialize(*vals); end

  def to_s; end
  def valid?(val); end
end

class Contracts::Builtin::Pos
  class << self
    def valid?(val); end
  end
end

class Contracts::Builtin::RangeOf < ::Contracts::Builtin::CallableClass
  def initialize(contract); end

  def to_s; end
  def valid?(val); end
end

class Contracts::Builtin::RespondTo < ::Contracts::Builtin::CallableClass
  def initialize(*meths); end

  def to_s; end
  def valid?(val); end
end

class Contracts::Builtin::Send < ::Contracts::Builtin::CallableClass
  def initialize(*meths); end

  def to_s; end
  def valid?(val); end
end

Contracts::Builtin::SetOf = T.let(T.unsafe(nil), Contracts::Builtin::CollectionOf::Factory)

class Contracts::Builtin::StrictHash < ::Contracts::Builtin::CallableClass
  def initialize(contract_hash); end

  def contract_hash; end
  def valid?(arg); end
end

class Contracts::Builtin::Xor < ::Contracts::Builtin::CallableClass
  def initialize(*vals); end

  def to_s; end
  def valid?(val); end
end

module Contracts::CallWith
  def call_with(this, *args, &blk); end
  def call_with_inner(returns, this, *args, &blk); end
end

class Contracts::ContractsNotIncluded < ::TypeError
  def initialize(message = T.unsafe(nil)); end

  def message; end
  def to_s; end
end

Contracts::ContractsNotIncluded::DEFAULT_MESSAGE = T.let(T.unsafe(nil), String)

module Contracts::Core
  mixes_in_class_methods ::Contracts

  class << self
    def common(base); end
    def extended(base); end
    def included(base); end
  end
end

class Contracts::Decorator
  def initialize(klass, method); end

  class << self
    def decorators; end
    def decorators=(_arg0); end
    def inherited(klass); end
  end
end

module Contracts::Engine
  class << self
    def applied?(*args, &block); end
    def apply(*args, &block); end
    def fetch_from(*args, &block); end

    private

    def base_engine; end
  end
end

class Contracts::Engine::Base
  def initialize(klass); end

  def add_method_decorator(type, name, decorator); end
  def all_decorators; end
  def decorate(decorator_class, *args); end
  def decorated_methods?; end
  def decorated_methods_for(type, name); end
  def nearest_decorated_ancestor; end
  def set_eigenclass_owner; end

  private

  def clear_decorators; end
  def decorated_methods; end
  def decorators; end
  def eigenclass; end
  def eigenclass_engine; end
  def klass; end
  def pop_decorators; end
  def validate!; end

  class << self
    def applied?(klass); end
    def apply(klass); end
    def fetch_from(klass); end
  end
end

class Contracts::Engine::Eigenclass < ::Contracts::Engine::Base
  def all_decorators; end
  def owner_class; end
  def owner_class=(_arg0); end
  def set_eigenclass_owner; end

  private

  def owner?; end
  def validate!; end

  class << self
    def lift(eigenclass, owner); end
  end
end

class Contracts::Engine::Target
  def initialize(target); end

  def applied?; end
  def apply(engine_class = T.unsafe(nil)); end
  def engine; end

  private

  def apply_to_eigenclass; end
  def eigenclass; end
  def meaningless_eigenclass?; end
  def target; end
end

module Contracts::Formatters; end

class Contracts::Formatters::ClassInspectWrapper
  include ::Contracts::Formatters::InspectWrapper

  def custom_to_s?; end
  def useful_inspect; end
end

class Contracts::Formatters::Expected
  def initialize(contract, full = T.unsafe(nil)); end

  def array_contract(array); end
  def contract(contract = T.unsafe(nil)); end
  def hash_contract(hash); end
end

module Contracts::Formatters::InspectWrapper
  def initialize(value, full); end

  def delim(value); end
  def inspect; end
  def to_s; end

  private

  def empty_to_s?; end
  def empty_val?; end
  def full?; end
  def plain?; end
  def strip_prefix(val); end
  def useful_to_s?; end

  class << self
    def create(value, full = T.unsafe(nil)); end
  end
end

class Contracts::Formatters::ObjectInspectWrapper
  include ::Contracts::Formatters::InspectWrapper

  def custom_to_s?; end
  def useful_inspect; end
end

module Contracts::Invariants
  mixes_in_class_methods ::Contracts::Invariants::InvariantExtension

  def verify_invariants!(method); end

  class << self
    def common(base); end
    def extended(base); end
    def included(base); end
  end
end

class Contracts::Invariants::Invariant
  def initialize(klass, name, &condition); end

  def check_on(target, method); end
  def expected; end

  class << self
    def failure_callback(data); end
    def failure_msg(data); end
  end
end

module Contracts::Invariants::InvariantExtension
  def invariant(name, &condition); end
  def invariants; end
end

module Contracts::MethodDecorators
  def Contract(*args, &blk); end
  def inherited(subclass); end
  def method_added(name); end
  def singleton_method_added(name); end

  class << self
    def extended(klass); end
  end
end

class Contracts::MethodHandler
  def initialize(method_name, is_class_method, target); end

  def handle; end

  private

  def _method_type; end
  def decorated_methods; end
  def decorator; end
  def decorator_args; end
  def decorator_class; end
  def decorators; end
  def engine; end
  def engine?; end
  def ignore_decorators?; end
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

Contracts::MethodHandler::METHOD_REFERENCE_FACTORY = T.let(T.unsafe(nil), Hash)
Contracts::MethodHandler::RAW_METHOD_STRATEGY = T.let(T.unsafe(nil), Hash)

class Contracts::MethodReference
  def initialize(name, method); end

  def make_alias(this); end
  def make_definition(this, &blk); end
  def method_position; end
  def name; end
  def send_to(this, *args, &blk); end

  private

  def alias_target(this); end
  def aliased_name; end
  def construct_unique_name; end
  def make_private(this); end
  def make_protected(this); end
  def private?(this); end
  def protected?(this); end
end

class Contracts::SingletonMethodReference < ::Contracts::MethodReference
  private

  def alias_target(this); end
  def private?(this); end
  def protected?(this); end
end

module Contracts::Support
  class << self
    def contract_id(contract); end
    def eigenclass?(target); end
    def eigenclass_hierarchy_supported?; end
    def eigenclass_of(target); end
    def indent_string(string, amount); end
    def method_name(method); end
    def method_position(method); end
    def unique_id; end

    private

    def module_eigenclass?(target); end
  end
end

module Contracts::Validators
  def clean_memoized_validators; end
  def make_validator(contract); end
  def make_validator!(contract); end
  def memoized_validators; end
  def override_validator(name, &block); end
  def reset_validators; end
  def restore_validators; end
  def validator_strategies; end
end

Contracts::Validators::DEFAULT_VALIDATOR_STRATEGIES = T.let(T.unsafe(nil), Hash)

class InvariantError < ::StandardError
  def to_contract_error; end
end

class ParamContractError < ::ContractError; end

class PatternMatchingError < ::ContractBaseError
  def to_contract_error; end
end

class ReturnContractError < ::ContractError; end