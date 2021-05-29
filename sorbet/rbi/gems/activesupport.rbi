# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: ignore
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/activesupport/all/activesupport.rbi
#
# activesupport-6.1.3.2

class Hash
  def _deep_transform_keys_in_object!(object, &block); end
  def _deep_transform_keys_in_object(object, &block); end
  def as_json(options = nil); end
  def assert_valid_keys(*valid_keys); end
  def blank?; end
  def deep_merge!(other_hash, &block); end
  def deep_merge(other_hash, &block); end
  def deep_stringify_keys!; end
  def deep_stringify_keys; end
  def deep_symbolize_keys!; end
  def deep_symbolize_keys; end
  def deep_transform_keys!(&block); end
  def deep_transform_keys(&block); end
  def except!(*keys); end
  def except(*keys); end
  def extract!(*keys); end
  def extractable_options?; end
  def nested_under_indifferent_access; end
  def reverse_merge!(other_hash); end
  def reverse_merge(other_hash); end
  def reverse_update(other_hash); end
  def slice!(*keys); end
  def stringify_keys!; end
  def stringify_keys; end
  def symbolize_keys!; end
  def symbolize_keys; end
  def to_options!; end
  def to_options; end
  def with_defaults!(other_hash); end
  def with_defaults(other_hash); end
  def with_indifferent_access; end
end
module ActiveSupport
  def parse_json_times; end
  def parse_json_times=(val); end
  def self.escape_html_entities_in_json(**, &&); end
  def self.escape_html_entities_in_json=(arg); end
  def self.json_encoder(**, &&); end
  def self.json_encoder=(arg); end
  def self.parse_json_times; end
  def self.parse_json_times=(val); end
  def self.time_precision(**, &&); end
  def self.time_precision=(arg); end
  def self.use_standard_json_time_format(**, &&); end
  def self.use_standard_json_time_format=(arg); end
  extend ActiveSupport::LazyLoadHooks
end
class ActiveSupport::HashWithIndifferentAccess < Hash
  def [](key); end
  def []=(key, value); end
  def assoc(key); end
  def compact; end
  def convert_key(key); end
  def convert_value(value, conversion: nil); end
  def deep_stringify_keys!; end
  def deep_stringify_keys; end
  def deep_symbolize_keys; end
  def default(*args); end
  def delete(key); end
  def dig(*args); end
  def dup; end
  def except(*keys); end
  def extractable_options?; end
  def fetch(key, *extras); end
  def fetch_values(*indices, &block); end
  def has_key?(key); end
  def include?(key); end
  def initialize(constructor = nil); end
  def key?(key); end
  def member?(key); end
  def merge!(*other_hashes, &block); end
  def merge(*hashes, &block); end
  def nested_under_indifferent_access; end
  def regular_update(*arg0); end
  def regular_writer(arg0, arg1); end
  def reject(*args, &block); end
  def replace(other_hash); end
  def reverse_merge!(other_hash); end
  def reverse_merge(other_hash); end
  def select(*args, &block); end
  def self.[](*args); end
  def set_defaults(target); end
  def slice!(*keys); end
  def slice(*keys); end
  def store(key, value); end
  def stringify_keys!; end
  def stringify_keys; end
  def symbolize_keys; end
  def to_hash; end
  def to_options!; end
  def to_options; end
  def transform_keys!; end
  def transform_keys(*args, &block); end
  def transform_values(*args, &block); end
  def update(*other_hashes, &block); end
  def update_with_single_argument(other_hash, block); end
  def values_at(*keys); end
  def with_defaults!(other_hash); end
  def with_defaults(other_hash); end
  def with_indifferent_access; end
  def without(*keys); end
end
class Object < BasicObject
  def as_json(options = nil); end
  def blank?; end
  def instance_values; end
  def instance_variable_names; end
  def presence; end
  def present?; end
  include ActiveSupport::Tryable
end
class NilClass
  def as_json(options = nil); end
  def blank?; end
  def try!(_method_name = nil, *arg1); end
  def try(_method_name = nil, *arg1); end
end
class FalseClass
  def as_json(options = nil); end
  def blank?; end
end
class TrueClass
  def as_json(options = nil); end
  def blank?; end
end
class Array
  def as_json(options = nil); end
  def blank?; end
  def extract_options!; end
end
class String
  def as_json(options = nil); end
  def blank?; end
  def camelcase(first_letter = nil); end
  def camelize(first_letter = nil); end
  def classify; end
  def constantize; end
  def dasherize; end
  def deconstantize; end
  def demodulize; end
  def foreign_key(separate_class_name_and_id_with_underscore = nil); end
  def humanize(capitalize: nil, keep_id_suffix: nil); end
  def is_utf8?; end
  def mb_chars; end
  def parameterize(separator: nil, preserve_case: nil, locale: nil); end
  def pluralize(count = nil, locale = nil); end
  def safe_constantize; end
  def singularize(locale = nil); end
  def tableize; end
  def titlecase(keep_id_suffix: nil); end
  def titleize(keep_id_suffix: nil); end
  def underscore; end
  def upcase_first; end
end
class Numeric
  def as_json(options = nil); end
  def blank?; end
end
class Time
  def as_json(options = nil); end
  def blank?; end
  def formatted_offset(colon = nil, alternate_utc_string = nil); end
  def rfc3339(fraction_digits = nil); end
  def to_default_s; end
  def to_formatted_s(format = nil); end
end
module ActiveSupport::Tryable
  def try!(method_name = nil, *args, &b); end
  def try(method_name = nil, *args, &b); end
end
class Delegator < BasicObject
  include ActiveSupport::Tryable
end
module ActiveSupport::LazyLoadHooks
  def execute_hook(name, base, options, block); end
  def on_load(name, options = nil, &block); end
  def run_load_hooks(name, base = nil); end
  def self.extended(base); end
  def with_execution_control(name, block, once); end
end
module ActiveSupport::Inflector
  def apply_inflections(word, rules, locale = nil); end
  def camelize(term, uppercase_first_letter = nil); end
  def classify(table_name); end
  def const_regexp(camel_cased_word); end
  def constantize(camel_cased_word); end
  def dasherize(underscored_word); end
  def deconstantize(path); end
  def demodulize(path); end
  def foreign_key(class_name, separate_class_name_and_id_with_underscore = nil); end
  def humanize(lower_case_and_underscored_word, capitalize: nil, keep_id_suffix: nil); end
  def inflections(locale = nil); end
  def ordinal(number); end
  def ordinalize(number); end
  def parameterize(string, separator: nil, preserve_case: nil, locale: nil); end
  def pluralize(word, locale = nil); end
  def safe_constantize(camel_cased_word); end
  def singularize(word, locale = nil); end
  def tableize(class_name); end
  def titleize(word, keep_id_suffix: nil); end
  def transliterate(string, replacement = nil, locale: nil); end
  def underscore(camel_cased_word); end
  def upcase_first(string); end
  extend ActiveSupport::Inflector
  extend ActiveSupport::Inflector
end
class ActiveSupport::Inflector::Inflections
  def acronym(word); end
  def acronyms; end
  def acronyms_camelize_regex; end
  def acronyms_underscore_regex; end
  def clear(scope = nil); end
  def define_acronym_regex_patterns; end
  def human(rule, replacement); end
  def humans; end
  def initialize; end
  def initialize_dup(orig); end
  def irregular(singular, plural); end
  def plural(rule, replacement); end
  def plurals; end
  def self.instance(locale = nil); end
  def singular(rule, replacement); end
  def singulars; end
  def uncountable(*words); end
  def uncountables; end
end
class ActiveSupport::Inflector::Inflections::Uncountables < Array
  def <<(*word); end
  def add(words); end
  def delete(entry); end
  def initialize; end
  def to_regex(string); end
  def uncountable?(str); end
end
module ActiveSupport::Multibyte
  def self.proxy_class; end
  def self.proxy_class=(klass); end
end
class Module
  def cattr_accessor(*syms, instance_reader: nil, instance_writer: nil, instance_accessor: nil, default: nil, &blk); end
  def cattr_reader(*syms, instance_reader: nil, instance_accessor: nil, default: nil, location: nil); end
  def cattr_writer(*syms, instance_writer: nil, instance_accessor: nil, default: nil, location: nil); end
  def delegate(*methods, to: nil, prefix: nil, allow_nil: nil, private: nil); end
  def delegate_missing_to(target, allow_nil: nil); end
  def deprecate(*method_names); end
  def mattr_accessor(*syms, instance_reader: nil, instance_writer: nil, instance_accessor: nil, default: nil, &blk); end
  def mattr_reader(*syms, instance_reader: nil, instance_accessor: nil, default: nil, location: nil); end
  def mattr_writer(*syms, instance_writer: nil, instance_accessor: nil, default: nil, location: nil); end
  def method_visibility(method); end
  def redefine_method(method, &block); end
  def redefine_singleton_method(method, &block); end
  def silence_redefinition_of_method(method); end
end
class Module::DelegationError < NoMethodError
end
module ActiveSupport::JSON
  def self.convert_dates_from(data); end
  def self.decode(json); end
  def self.encode(value, options = nil); end
  def self.parse_error; end
end
module ActiveSupport::BigDecimalWithDefaultFormat
  def to_s(format = nil); end
end
class ActiveSupport::TimeZone
  def <=>(zone); end
  def =~(re); end
  def at(*args); end
  def encode_with(coder); end
  def formatted_offset(colon = nil, alternate_utc_string = nil); end
  def init_with(coder); end
  def initialize(name, utc_offset = nil, tzinfo = nil); end
  def iso8601(str); end
  def local(*args); end
  def local_to_utc(time, dst = nil); end
  def match?(re); end
  def name; end
  def now; end
  def parse(str, now = nil); end
  def parts_to_time(parts, now); end
  def period_for_local(time, dst = nil); end
  def period_for_utc(time); end
  def periods_for_local(time); end
  def rfc3339(str); end
  def self.[](arg); end
  def self.all; end
  def self.clear; end
  def self.country_zones(country_code); end
  def self.create(*arg0); end
  def self.find_tzinfo(name); end
  def self.load_country_zones(code); end
  def self.new(name); end
  def self.seconds_to_utc_offset(seconds, colon = nil); end
  def self.us_zones; end
  def self.zones_map; end
  def strptime(str, format, now = nil); end
  def time_now; end
  def to_s; end
  def today; end
  def tomorrow; end
  def tzinfo; end
  def utc_offset; end
  def utc_to_local(time); end
  def yesterday; end
  include Comparable
end
class DateTime < Date
  def <=>(other); end
  def advance(options); end
  def ago(seconds); end
  def as_json(options = nil); end
  def at_beginning_of_day; end
  def at_beginning_of_hour; end
  def at_beginning_of_minute; end
  def at_end_of_day; end
  def at_end_of_hour; end
  def at_end_of_minute; end
  def at_midday; end
  def at_middle_of_day; end
  def at_midnight; end
  def at_noon; end
  def beginning_of_day; end
  def beginning_of_hour; end
  def beginning_of_minute; end
  def change(options); end
  def default_inspect; end
  def end_of_day; end
  def end_of_hour; end
  def end_of_minute; end
  def formatted_offset(colon = nil, alternate_utc_string = nil); end
  def getgm; end
  def getlocal(utc_offset = nil); end
  def getutc; end
  def gmtime; end
  def in(seconds); end
  def inspect; end
  def localtime(utc_offset = nil); end
  def midday; end
  def middle_of_day; end
  def midnight; end
  def noon; end
  def nsec; end
  def offset_in_seconds; end
  def readable_inspect; end
  def seconds_since_midnight; end
  def seconds_since_unix_epoch; end
  def seconds_until_end_of_day; end
  def self.civil_from_format(utc_or_local, year, month = nil, day = nil, hour = nil, min = nil, sec = nil); end
  def self.current; end
  def since(seconds); end
  def subsec; end
  def to_default_s; end
  def to_f; end
  def to_formatted_s(format = nil); end
  def to_i; end
  def usec; end
  def utc; end
  def utc?; end
  def utc_offset; end
end
module DateAndTime
end
module DateAndTime::Zones
  def in_time_zone(zone = nil); end
  def time_with_zone(time, zone); end
end
class Date
  def as_json(options = nil); end
  def default_inspect; end
  def readable_inspect; end
  def to_default_s; end
  def to_formatted_s(format = nil); end
  include DateAndTime::Zones
end
module ActiveSupport::ToJsonWithActiveSupportEncoder
  def to_json(options = nil); end
end
class Struct
  def as_json(options = nil); end
end
class Symbol
  def as_json(options = nil); end
end
class Float < Numeric
  def as_json(options = nil); end
end
class BigDecimal < Numeric
  def as_json(options = nil); end
end
class Regexp
  def as_json(options = nil); end
end
module Enumerable
  def as_json(options = nil); end
end
class IO
  def as_json(options = nil); end
end
class Range
  def as_json(options = nil); end
end
class URI::Generic
  def as_json(options = nil); end
end
class Pathname
  def as_json(options = nil); end
end
class IPAddr
  def as_json(options = nil); end
end
class Process::Status
  def as_json(options = nil); end
end
class Exception
  def as_json(options = nil); end
end
module ActiveSupport::JSON::Encoding
  def self.escape_html_entities_in_json; end
  def self.escape_html_entities_in_json=(arg0); end
  def self.json_encoder; end
  def self.json_encoder=(arg0); end
  def self.time_precision; end
  def self.time_precision=(arg0); end
  def self.use_standard_json_time_format; end
  def self.use_standard_json_time_format=(arg0); end
end
class ActiveSupport::JSON::Encoding::JSONGemEncoder
  def encode(value); end
  def initialize(options = nil); end
  def jsonify(value); end
  def options; end
  def stringify(jsonified); end
end
class ActiveSupport::JSON::Encoding::JSONGemEncoder::EscapedString < String
  def to_json(*arg0); end
  def to_s; end
end
module ActiveSupport::Notifications
  def self.instrument(name, payload = nil); end
  def self.instrumenter; end
  def self.monotonic_subscribe(pattern = nil, callback = nil, &block); end
  def self.notifier; end
  def self.notifier=(arg0); end
  def self.publish(name, *args); end
  def self.subscribe(pattern = nil, callback = nil, &block); end
  def self.subscribed(callback, pattern = nil, monotonic: nil, &block); end
  def self.unsubscribe(subscriber_or_name); end
end
class ActiveSupport::Notifications::Instrumenter
  def finish(name, payload); end
  def finish_with_state(listeners_state, name, payload); end
  def id; end
  def initialize(notifier); end
  def instrument(name, payload = nil); end
  def start(name, payload); end
  def unique_id; end
end
class ActiveSupport::Notifications::Event
  def <<(event); end
  def allocations; end
  def children; end
  def cpu_time; end
  def duration; end
  def end; end
  def finish!; end
  def idle_time; end
  def initialize(name, start, ending, transaction_id, payload); end
  def name; end
  def now; end
  def now_allocations; end
  def now_cpu; end
  def parent_of?(event); end
  def payload; end
  def payload=(arg0); end
  def start!; end
  def time; end
  def transaction_id; end
end
class ActiveSupport::Notifications::Fanout
  def finish(name, id, payload, listeners = nil); end
  def initialize; end
  def listeners_for(name); end
  def listening?(name); end
  def lock; end
  def locked?; end
  def publish(name, *args); end
  def start(name, id, payload); end
  def subscribe(pattern = nil, callable = nil, monotonic: nil, &block); end
  def synchronize(&block); end
  def try_lock; end
  def unlock; end
  def unsubscribe(subscriber_or_name); end
  def wait; end
  include Mutex_m
end
module ActiveSupport::Notifications::Fanout::Subscribers
  def self.new(pattern, listener, monotonic); end
  def self.wrap_all(pattern, subscriber); end
end
class ActiveSupport::Notifications::Fanout::Subscribers::Matcher
  def ===(name); end
  def exclusions; end
  def initialize(pattern); end
  def pattern; end
  def self.wrap(pattern); end
  def unsubscribe!(name); end
end
class ActiveSupport::Notifications::Fanout::Subscribers::Evented
  def finish(name, id, payload); end
  def initialize(pattern, delegate); end
  def matches?(name); end
  def pattern; end
  def publish(name, *args); end
  def start(name, id, payload); end
  def subscribed_to?(name); end
  def unsubscribe!(name); end
end
class ActiveSupport::Notifications::Fanout::Subscribers::Timed < ActiveSupport::Notifications::Fanout::Subscribers::Evented
  def finish(name, id, payload); end
  def publish(name, *args); end
  def start(name, id, payload); end
end
class ActiveSupport::Notifications::Fanout::Subscribers::MonotonicTimed < ActiveSupport::Notifications::Fanout::Subscribers::Evented
  def finish(name, id, payload); end
  def publish(name, *args); end
  def start(name, id, payload); end
end
class ActiveSupport::Notifications::Fanout::Subscribers::EventObject < ActiveSupport::Notifications::Fanout::Subscribers::Evented
  def build_event(name, id, payload); end
  def finish(name, id, payload); end
  def start(name, id, payload); end
end
class ActiveSupport::Notifications::Fanout::Subscribers::AllMessages
  def finish(name, id, payload); end
  def initialize(delegate); end
  def matches?(arg0); end
  def publish(name, *args); end
  def start(name, id, payload); end
  def subscribed_to?(name); end
  def unsubscribe!(*arg0); end
end
module ActiveSupport::PerThreadRegistry
  def instance; end
  def method_missing(name, *args, &block); end
  def self.extended(object); end
end
class ActiveSupport::Notifications::InstrumentationRegistry
  def initialize; end
  def instrumenter_for(notifier); end
  extend ActiveSupport::PerThreadRegistry
end
class ActiveSupport::Deprecation
  def self.allow(**, &&); end
  def self.behavior(**, &&); end
  def self.behavior=(arg); end
  def self.debug(**, &&); end
  def self.debug=(arg); end
  def self.deprecate_methods(**, &&); end
  def self.deprecation_horizon(**, &&); end
  def self.deprecation_horizon=(arg); end
  def self.deprecation_warning(deprecated_method_name, message = nil, caller_backtrace = nil); end
  def self.disallowed_behavior(**, &&); end
  def self.disallowed_behavior=(arg); end
  def self.disallowed_warnings(**, &&); end
  def self.disallowed_warnings=(arg); end
  def self.gem_name(**, &&); end
  def self.gem_name=(arg); end
  def self.initialize(**, &&); end
  def self.silence(**, &&); end
  def self.silenced(**, &&); end
  def self.silenced=(arg); end
  def self.warn(message = nil, callstack = nil); end
  extend ActiveSupport::Deprecation::InstanceDelegator::ClassMethods
  extend Singleton::SingletonClassMethods
  include ActiveSupport::Deprecation::Behavior
  include ActiveSupport::Deprecation::Disallowed
  include ActiveSupport::Deprecation::InstanceDelegator
  include ActiveSupport::Deprecation::MethodWrapper
  include ActiveSupport::Deprecation::Reporting
  include Singleton
end
module ActiveSupport::Deprecation::InstanceDelegator
  def self.included(base); end
end
module ActiveSupport::Deprecation::InstanceDelegator::ClassMethods
  def include(included_module); end
  def method_added(method_name); end
end
module ActiveSupport::Deprecation::InstanceDelegator::OverrideDelegators
  def deprecation_warning(deprecated_method_name, message = nil, caller_backtrace = nil); end
  def warn(message = nil, callstack = nil); end
end
class ActiveSupport::DeprecationException < StandardError
end
module ActiveSupport::Deprecation::Behavior
  def arity_coerce(behavior); end
  def behavior; end
  def behavior=(behavior); end
  def debug; end
  def debug=(arg0); end
  def disallowed_behavior; end
  def disallowed_behavior=(behavior); end
end
module ActiveSupport::Deprecation::Reporting
  def _extract_callstack(callstack); end
  def allow(allowed_warnings = nil, if: nil, &block); end
  def deprecated_method_warning(method_name, message = nil); end
  def deprecation_caller_message(callstack); end
  def deprecation_message(callstack, message = nil); end
  def deprecation_warning(deprecated_method_name, message = nil, caller_backtrace = nil); end
  def extract_callstack(callstack); end
  def gem_name; end
  def gem_name=(arg0); end
  def ignored_callstack(path); end
  def silence(&block); end
  def silenced; end
  def silenced=(arg0); end
  def warn(message = nil, callstack = nil); end
end
module ActiveSupport::Deprecation::Disallowed
  def deprecation_disallowed?(message); end
  def disallowed_warnings; end
  def disallowed_warnings=(arg0); end
  def explicitly_allowed?(message); end
end
module ActiveSupport::Deprecation::DeprecatedConstantAccessor
  def self.included(base); end
end
module ActiveSupport::Deprecation::MethodWrapper
  def deprecate_methods(target_module, *method_names); end
end
class ActiveSupport::Deprecation::DeprecationProxy
  def inspect; end
  def method_missing(called, *args, &block); end
  def self.new(*args, &block); end
end
class ActiveSupport::Deprecation::DeprecatedObjectProxy < ActiveSupport::Deprecation::DeprecationProxy
  def initialize(object, message, deprecator = nil); end
  def target; end
  def warn(callstack, called, args); end
end
class ActiveSupport::Deprecation::DeprecatedInstanceVariableProxy < ActiveSupport::Deprecation::DeprecationProxy
  def initialize(instance, method, var = nil, deprecator = nil); end
  def target; end
  def warn(callstack, called, args); end
end
class ActiveSupport::Deprecation::DeprecatedConstantProxy < Module
  def class; end
  def const_missing(name); end
  def hash(**, &&); end
  def initialize(old_const, new_const, deprecator = nil, message: nil); end
  def inspect; end
  def instance_methods(**, &&); end
  def method_missing(called, *args, &block); end
  def name(**, &&); end
  def respond_to?(**, &&); end
  def self.new(*args, **options, &block); end
  def target; end
end