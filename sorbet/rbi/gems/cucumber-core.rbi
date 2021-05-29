# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/cucumber-core/all/cucumber-core.rbi
#
# cucumber-core-9.0.0

module Cucumber
end
module Cucumber::Core
  def compile(gherkin_documents, last_receiver, filters = nil, event_bus = nil); end
  def compose(filters, last_receiver); end
  def execute(gherkin_documents, filters = nil, event_bus = nil); end
  def parse(gherkin_documents, compiler, event_bus, gherkin_query); end
end
class Cucumber::Core::Event
  def self.event_id; end
  def self.new(*attributes); end
  def self.underscore(string); end
end
module Cucumber::Core::Events
  def self.build_registry(*types); end
  def self.registry; end
end
class Anonymous_Cucumber_Core_Event_6 < Cucumber::Core::Event
  def attributes; end
  def envelope; end
  def event_id; end
  def initialize(*args); end
  def to_h; end
end
class Cucumber::Core::Events::Envelope < Anonymous_Cucumber_Core_Event_6
  def envelope; end
end
class Anonymous_Cucumber_Core_Event_7 < Cucumber::Core::Event
  def attributes; end
  def event_id; end
  def gherkin_document; end
  def initialize(*args); end
  def to_h; end
end
class Cucumber::Core::Events::GherkinSourceParsed < Anonymous_Cucumber_Core_Event_7
  def gherkin_document; end
end
class Anonymous_Cucumber_Core_Event_8 < Cucumber::Core::Event
  def attributes; end
  def event_id; end
  def initialize(*args); end
  def pickle_step; end
  def test_step; end
  def to_h; end
end
class Cucumber::Core::Events::TestStepCreated < Anonymous_Cucumber_Core_Event_8
  def pickle_step; end
  def test_step; end
end
class Anonymous_Cucumber_Core_Event_9 < Cucumber::Core::Event
  def attributes; end
  def event_id; end
  def initialize(*args); end
  def pickle; end
  def test_case; end
  def to_h; end
end
class Cucumber::Core::Events::TestCaseCreated < Anonymous_Cucumber_Core_Event_9
  def pickle; end
  def test_case; end
end
class Anonymous_Cucumber_Core_Event_10 < Cucumber::Core::Event
  def attributes; end
  def event_id; end
  def initialize(*args); end
  def test_case; end
  def to_h; end
end
class Cucumber::Core::Events::TestCaseStarted < Anonymous_Cucumber_Core_Event_10
  def test_case; end
end
class Anonymous_Cucumber_Core_Event_11 < Cucumber::Core::Event
  def attributes; end
  def event_id; end
  def initialize(*args); end
  def test_step; end
  def to_h; end
end
class Cucumber::Core::Events::TestStepStarted < Anonymous_Cucumber_Core_Event_11
  def test_step; end
end
class Anonymous_Cucumber_Core_Event_12 < Cucumber::Core::Event
  def attributes; end
  def event_id; end
  def initialize(*args); end
  def result; end
  def test_step; end
  def to_h; end
end
class Cucumber::Core::Events::TestStepFinished < Anonymous_Cucumber_Core_Event_12
  def result; end
  def test_step; end
end
class Anonymous_Cucumber_Core_Event_13 < Cucumber::Core::Event
  def attributes; end
  def event_id; end
  def initialize(*args); end
  def result; end
  def test_case; end
  def to_h; end
end
class Cucumber::Core::Events::TestCaseFinished < Anonymous_Cucumber_Core_Event_13
  def result; end
  def test_case; end
end
class Cucumber::Core::EventBus
  def broadcast(event); end
  def broadcast_queued_events_to(handler, event_type); end
  def event_types; end
  def handlers_for(event_class); end
  def initialize(registry = nil); end
  def is_registered_id?(event_id); end
  def is_registered_type?(event_type); end
  def method_missing(event_id, *args); end
  def on(event_id, handler_object = nil, &handler_proc); end
  def validate_handler_and_event_id!(handler, event_id); end
end
module Cucumber::Core::Test
end
module Cucumber::Core::Test::Result
  def self.ok?(type, be_strict = nil); end
  def self.query_methods(result_type); end
end
class Cucumber::Core::Test::Result::Unknown
  def describe_to(visitor, *args); end
  def to_message; end
  def with_filtered_backtrace(filter); end
  include Anonymous_Module_14
end
module Anonymous_Module_14
  def failed?; end
  def flaky?; end
  def passed?; end
  def pending?; end
  def skipped?; end
  def to_sym; end
  def undefined?; end
  def unknown?; end
end
class Cucumber::Core::Test::Result::Passed
  def describe_to(visitor, *args); end
  def duration; end
  def duration=(arg0); end
  def initialize(duration); end
  def ok?(be_strict = nil); end
  def self.ok?(be_strict = nil); end
  def to_message; end
  def to_s; end
  def with_appended_backtrace(step); end
  def with_filtered_backtrace(filter); end
  include Anonymous_Module_15
end
module Anonymous_Module_15
  def failed?; end
  def flaky?; end
  def passed?; end
  def pending?; end
  def skipped?; end
  def to_sym; end
  def undefined?; end
  def unknown?; end
end
class Cucumber::Core::Test::Result::Failed
  def describe_to(visitor, *args); end
  def duration; end
  def exception; end
  def initialize(duration, exception); end
  def ok?(be_strict = nil); end
  def self.ok?(be_strict = nil); end
  def to_message; end
  def to_s; end
  def with_appended_backtrace(step); end
  def with_duration(new_duration); end
  def with_filtered_backtrace(filter); end
  include Anonymous_Module_16
end
module Anonymous_Module_16
  def failed?; end
  def flaky?; end
  def passed?; end
  def pending?; end
  def skipped?; end
  def to_sym; end
  def undefined?; end
  def unknown?; end
end
class Cucumber::Core::Test::Result::Flaky
  def self.ok?(be_strict = nil); end
end
class Cucumber::Core::Test::Result::Raisable < StandardError
  def duration; end
  def initialize(message = nil, duration = nil, backtrace = nil); end
  def message; end
  def ok?(be_strict = nil); end
  def with_appended_backtrace(step); end
  def with_duration(new_duration); end
  def with_filtered_backtrace(filter); end
  def with_message(new_message); end
end
class Cucumber::Core::Test::Result::Undefined < Cucumber::Core::Test::Result::Raisable
  def describe_to(visitor, *args); end
  def self.ok?(be_strict = nil); end
  def to_message; end
  def to_s; end
  include Anonymous_Module_17
end
module Anonymous_Module_17
  def failed?; end
  def flaky?; end
  def passed?; end
  def pending?; end
  def skipped?; end
  def to_sym; end
  def undefined?; end
  def unknown?; end
end
class Cucumber::Core::Test::Result::Skipped < Cucumber::Core::Test::Result::Raisable
  def describe_to(visitor, *args); end
  def self.ok?(be_strict = nil); end
  def to_message; end
  def to_s; end
  include Anonymous_Module_18
end
module Anonymous_Module_18
  def failed?; end
  def flaky?; end
  def passed?; end
  def pending?; end
  def skipped?; end
  def to_sym; end
  def undefined?; end
  def unknown?; end
end
class Cucumber::Core::Test::Result::Pending < Cucumber::Core::Test::Result::Raisable
  def describe_to(visitor, *args); end
  def self.ok?(be_strict = nil); end
  def to_message; end
  def to_s; end
  include Anonymous_Module_19
end
module Anonymous_Module_19
  def failed?; end
  def flaky?; end
  def passed?; end
  def pending?; end
  def skipped?; end
  def to_sym; end
  def undefined?; end
  def unknown?; end
end
class Cucumber::Core::Test::Result::StrictConfiguration
  def initialize(strict_types = nil); end
  def merge!(other); end
  def set?(type); end
  def set_strict(setting, type = nil); end
  def settings; end
  def settings=(arg0); end
  def strict?(type = nil); end
end
class Cucumber::Core::Test::Result::Summary
  def decrement_failed; end
  def duration(duration); end
  def durations; end
  def exception(exception); end
  def exceptions; end
  def get_total(method_name); end
  def increment_total(status); end
  def initialize; end
  def method_missing(name, *args); end
  def ok?(be_strict = nil); end
  def total(for_status = nil); end
end
class Cucumber::Core::Test::Result::Duration
  def initialize(nanoseconds); end
  def nanoseconds; end
  def to_message_duration; end
  include Cucumber::Messages::TimeConversion
end
class Cucumber::Core::Test::Result::UnknownDuration
  def nanoseconds; end
  def tap(&block); end
  def to_message_duration; end
  include Cucumber::Messages::TimeConversion
end
class Cucumber::Core::Test::IncompatibleLocations < StandardError
end
module Cucumber::Core::Test::Location
  def self.from_file_colon_line(file_colon_line); end
  def self.from_source_location(file, line); end
  def self.new(file, raw_lines = nil); end
  def self.of_caller(additional_depth = nil); end
end
class Anonymous_Struct_20 < Struct
  def file; end
  def file=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
end
class Cucumber::Core::Test::Location::Wildcard < Anonymous_Struct_20
  def include?(lines); end
  def match?(other); end
  def to_s; end
end
class Anonymous_Struct_21 < Struct
  def file; end
  def file=(_); end
  def lines; end
  def lines=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
end
class Cucumber::Core::Test::Location::Precise < Anonymous_Struct_21
  def hash; end
  def include?(other_lines); end
  def inspect; end
  def line; end
  def match?(other); end
  def on_line(new_line); end
  def to_s; end
  def to_str; end
end
class Anonymous_Struct_22 < Struct
  def data; end
  def data=(_); end
  def self.[](*arg0); end
  def self.inspect; end
  def self.members; end
  def self.new(*arg0); end
end
class Cucumber::Core::Test::Location::Lines < Anonymous_Struct_22
  def +(more_lines); end
  def data; end
  def first; end
  def include?(other); end
  def initialize(raw_data); end
  def inspect; end
  def max; end
  def min; end
  def range?; end
  def to_s; end
end
module Cucumber::Core::Test::HasLocation
  def attributes; end
  def comments; end
  def file; end
  def file_colon_line; end
  def line; end
  def location; end
  def multiline_arg; end
  def tags; end
end
module Cucumber::Core::Filter
  def self.new(*attributes, &block); end
end
module Cucumber::Core::Gherkin
end
class Cucumber::Core::Gherkin::ParseError < StandardError
end
class Cucumber::Core::Gherkin::Parser
  def document(document); end
  def done; end
  def event_bus; end
  def gherkin_options(document); end
  def gherkin_query; end
  def initialize(receiver, event_bus, gherkin_query); end
  def receiver; end
end
class Cucumber::Core::Gherkin::Document
  def ==(other); end
  def body; end
  def initialize(uri, body, language = nil); end
  def language; end
  def to_s; end
  def uri; end
end
class Cucumber::Core::Test::Case
  def ==(other); end
  def around_hooks; end
  def compose_around_hooks(visitor, *args, &block); end
  def describe_to(visitor, *args); end
  def eql?(other); end
  def hash; end
  def id; end
  def initialize(id, name, test_steps, location, tags, language, around_hooks = nil); end
  def inspect; end
  def language; end
  def location; end
  def match_locations?(queried_locations); end
  def match_name?(name_regexp); end
  def match_single_tag_expression?(expression); end
  def match_tags?(*expressions); end
  def name; end
  def step_count; end
  def tags; end
  def test_steps; end
  def with_around_hooks(around_hooks); end
  def with_steps(test_steps); end
end
class Cucumber::Core::Test::Timer
  def duration; end
  def nsec; end
  def sec; end
  def start; end
  def time_in_nanoseconds; end
end
module Cucumber::Core::Test::Timer::MonotonicTime
  def self.time_in_nanoseconds; end
  def time_in_nanoseconds; end
end
class Cucumber::Core::Test::Action
  def execute(*args); end
  def failed(exception); end
  def initialize(location = nil, &block); end
  def inspect; end
  def location; end
  def passed; end
  def skip(*arg0); end
  def skipped; end
end
class Cucumber::Core::Test::UnskippableAction < Cucumber::Core::Test::Action
  def skip(*args); end
end
class Cucumber::Core::Test::UndefinedAction
  def execute(*arg0); end
  def initialize(source_location); end
  def location; end
  def skip(*arg0); end
  def undefined; end
end
class Cucumber::Core::Test::EmptyMultilineArgument
  def all_locations; end
  def data_table?; end
  def describe_to(*arg0); end
  def doc_string?; end
  def inspect; end
  def map(&block); end
end
class Cucumber::Core::Test::Step
  def action_location; end
  def backtrace_line; end
  def describe_to(visitor, *args); end
  def execute(*args); end
  def hook?; end
  def id; end
  def initialize(id, text, location, multiline_arg = nil, action = nil); end
  def inspect; end
  def location; end
  def multiline_arg; end
  def skip(*args); end
  def text; end
  def to_s; end
  def with_action(action_location = nil, &block); end
end
class Cucumber::Core::Test::HookStep < Cucumber::Core::Test::Step
  def hook?; end
  def initialize(id, text, location, action); end
end
class Cucumber::Core::Test::Tag
  def initialize(location, name); end
  def inspect; end
  def name; end
  include Cucumber::Core::Test::HasLocation
end
class Cucumber::Core::Test::DocString < SimpleDelegator
  def ==(other); end
  def content; end
  def content_type; end
  def data_table?; end
  def describe_to(visitor, *args); end
  def doc_string?; end
  def initialize(content, content_type); end
  def inspect; end
  def map; end
  def to_step_definition_arg; end
end
class Cucumber::Core::Test::DataTable
  def ==(other); end
  def data_table?; end
  def describe_to(visitor, *args); end
  def doc_string?; end
  def dup; end
  def ensure_array_of_array(array); end
  def hashes_to_array(hashes); end
  def initialize(rows); end
  def inspect; end
  def map(&block); end
  def raw; end
  def to_step_definition_arg; end
  def transpose; end
  def verify_rows_are_same_length(raw); end
end
class Cucumber::Core::Compiler
  def create_multiline_arg(pickle_step, _uri); end
  def create_test_case(pickle); end
  def create_test_step(pickle_step, uri); end
  def done; end
  def gherkin_query; end
  def id_generator; end
  def initialize(receiver, gherkin_query, event_bus = nil); end
  def pickle(pickle); end
  def receiver; end
  def source_line(id); end
  def source_line_for_pickle_tag(tag); end
  def source_lines_for_pickle(pickle); end
  def source_lines_for_pickle_step(pickle_step); end
end
class Cucumber::Core::Test::Runner
  def around_hook(hook, &continue); end
  def done; end
  def event_bus; end
  def initialize(event_bus); end
  def running_test_case; end
  def running_test_step; end
  def test_case(test_case, &descend); end
  def test_step(test_step); end
end
class Cucumber::Core::Test::Runner::RunningTestCase
  def duration(step_duration, step_result); end
  def exception(step_exception, step_result); end
  def execute(test_step, &continue); end
  def failed(step_result); end
  def initialize; end
  def passed(step_result); end
  def pending(message, step_result); end
  def result; end
  def skipped(step_result); end
  def status; end
  def undefined(step_result); end
end
module Cucumber::Core::Test::Runner::RunningTestCase::Status
end
class Cucumber::Core::Test::Runner::RunningTestCase::Status::Base
  def execute(test_step, monitor, &continue); end
  def initialize(step_result); end
  def result; end
  def step_result; end
end
class Cucumber::Core::Test::Runner::RunningTestCase::Status::Unknown < Cucumber::Core::Test::Runner::RunningTestCase::Status::Base
  def result(duration); end
end
class Cucumber::Core::Test::Runner::RunningTestCase::Status::Passing < Cucumber::Core::Test::Runner::RunningTestCase::Status::Base
  def result(duration); end
end
class Cucumber::Core::Test::Runner::RunningTestCase::Status::Failing < Cucumber::Core::Test::Runner::RunningTestCase::Status::Base
  def execute(test_step, monitor, &continue); end
  def result(duration); end
end
class Cucumber::Core::Test::Runner::RunningTestCase::Status::Pending < Cucumber::Core::Test::Runner::RunningTestCase::Status::Failing
end
class Cucumber::Core::Test::Runner::RunningTestCase::Status::Skipping < Cucumber::Core::Test::Runner::RunningTestCase::Status::Failing
  def result(duration); end
end
class Cucumber::Core::Test::AroundHook
  def describe_to(visitor, *args, &continue); end
  def execute(*args, &continue); end
  def failed(exception); end
  def hook?; end
  def initialize(&block); end
end
module Cucumber::Core::Report
end
class Cucumber::Core::Report::Summary
  def initialize(event_bus); end
  def ok?(be_strict = nil); end
  def subscribe_to(event_bus); end
  def test_cases; end
  def test_steps; end
end
class Anonymous_Object_23
  def done; end
  def filter_locations; end
  def initialize(*args); end
  def receiver; end
  def test_case(test_case); end
  def with_receiver(new_receiver); end
end
class Cucumber::Core::Test::LocationsFilter < Anonymous_Object_23
  def done; end
  def sorted_test_cases; end
  def test_case(test_case); end
  def test_cases; end
end
class Anonymous_Object_24
  def done; end
  def initialize(*args); end
  def name_regexps; end
  def receiver; end
  def test_case(test_case); end
  def with_receiver(new_receiver); end
end
class Cucumber::Core::Test::NameFilter < Anonymous_Object_24
  def accept?(test_case); end
  def test_case(test_case); end
end
class Anonymous_Object_25
  def done; end
  def filter_expressions; end
  def initialize(*args); end
  def receiver; end
  def test_case(test_case); end
  def with_receiver(new_receiver); end
end
class Cucumber::Core::Test::TagFilter < Anonymous_Object_25
  def done; end
  def test_case(test_case); end
  def test_cases; end
end
class Cucumber::Core::Test::TagFilter::TestCases
  def <<(test_case); end
  def initialize; end
  def test_cases_by_tag_name; end
  def with_tag_name(tag_name); end
end
