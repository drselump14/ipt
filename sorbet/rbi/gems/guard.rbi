# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: true
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/guard/all/guard.rbi
#
# guard-2.16.2

module Guard
  def self._evaluate(options); end
  def self._guardfile_deprecated_check(modified); end
  def self._listener_callback; end
  def self._pluginless_guardfile?; end
  def self._relative_pathnames(paths); end
  def self._relevant_changes?(changes); end
  def self.async_queue_add(changes); end
  def self.init(cmdline_options); end
  def self.interactor; end
  def self.listener; end
  def self.queue; end
  def self.setup(cmdline_options = nil); end
  def self.state; end
  extend Guard::Deprecated::Guard::ClassMethods
end
class Anonymous_Nenv_Environment_51 < Nenv::Environment
  def gem_silence_deprecations?; end
  def strict?; end
end
class Guard::Config < Anonymous_Nenv_Environment_51
  def initialize; end
  def silence_deprecations?; end
end
module Guard::UI
  def self._calling_plugin_name; end
  def self._filter(plugin); end
  def self._filtered_logger_message(message, method, color_name, options = nil); end
  def self.action_with_scopes(action, scope); end
  def self.clear(opts = nil); end
  def self.clearable; end
  def self.color(text, *color_options); end
  def self.color_enabled?; end
  def self.debug(message, options = nil); end
  def self.deprecation(message, options = nil); end
  def self.error(message, options = nil); end
  def self.info(message, options = nil); end
  def self.level=(new_level); end
  def self.logger; end
  def self.options; end
  def self.options=(options); end
  def self.reset_and_clear; end
  def self.reset_line; end
  def self.reset_logger; end
  def self.warning(message, options = nil); end
  include Guard::UI::Colors
end
module Guard::UI::Colors
end
class Guard::Options < Thor::CoreExt::HashWithIndifferentAccess
  def fetch(name); end
  def initialize(opts = nil, default_opts = nil); end
end
class Guard::UI::Logger
end
class Guard::UI::Logger::Config < Guard::Options
  def initialize(options = nil); end
  def level=(value); end
end
class Guard::UI::Config < Guard::Options
  def [](name); end
  def device; end
  def except; end
  def initialize(options = nil); end
  def logger_config; end
  def only; end
  def with_progname(name); end
end
class Guard::Terminal
  def self.clear; end
end
class Guard::PluginUtil
  def _constant_name; end
  def _full_gem_path(name); end
  def _plugin_constant; end
  def add_to_guardfile; end
  def initialize(name); end
  def initialize_plugin(options); end
  def name; end
  def name=(arg0); end
  def plugin_class(options = nil); end
  def plugin_location; end
  def self._gem_valid?(gem); end
  def self.plugin_names; end
end
class Guard::Group
  def initialize(name, options = nil); end
  def name; end
  def name=(arg0); end
  def options; end
  def options=(arg0); end
  def title; end
  def to_s; end
end
module Guard::Internals
end
class Guard::Internals::Groups
  def add(name, options = nil); end
  def all(filter = nil); end
  def initialize; end
  def matcher_for(filter); end
end
class Guard::Plugin
  def _register_callbacks; end
  def callbacks; end
  def callbacks=(arg0); end
  def group; end
  def group=(arg0); end
  def hook(event, *args); end
  def initialize(options = nil); end
  def name; end
  def options; end
  def options=(arg0); end
  def self.add_callback(listener, guard_plugin, events); end
  def self.callbacks; end
  def self.non_namespaced_classname; end
  def self.non_namespaced_name; end
  def self.notify(guard_plugin, event, *args); end
  def self.reset_callbacks!; end
  def self.template(plugin_location); end
  def title; end
  def to_s; end
  def watchers; end
  def watchers=(arg0); end
end
class Guard::Internals::Plugins
  def add(name, options); end
  def all(filter = nil); end
  def initialize; end
  def matcher_for(filter); end
  def remove(plugin); end
end
class Guard::Internals::Session
  def clear?; end
  def clearing(on); end
  def clearing?; end
  def cmdline_groups; end
  def cmdline_plugins; end
  def convert_scope(entries); end
  def debug?; end
  def evaluator_options; end
  def groups; end
  def guardfile_group_scope; end
  def guardfile_ignore; end
  def guardfile_ignore=(ignores); end
  def guardfile_ignore_bang; end
  def guardfile_ignore_bang=(arg0); end
  def guardfile_notification=(config); end
  def guardfile_plugin_scope; end
  def guardfile_scope(scope); end
  def initialize(new_options); end
  def interactor_name; end
  def listener_args; end
  def notify_options; end
  def plugins; end
  def watchdirs; end
  def watchdirs=(dirs); end
end
class Guard::Internals::Scope
  def _find_non_empty_scope(type, local_scope); end
  def _groups; end
  def _hashify_scope(type); end
  def _instantiate(meth, obj); end
  def _plugins; end
  def _scope_names(new_scope, name); end
  def from_interactor(scope); end
  def grouped_plugins(scope = nil); end
  def initialize; end
  def titles(scope = nil); end
  def to_hash; end
end
module Guard::Deprecated
end
module Guard::Deprecated::Watcher
  def self.add_deprecated(klass); end
end
module Guard::Deprecated::Watcher::ClassMethods
  def match_guardfile?(files); end
end
class Guard::Watcher
  def ==(other); end
  def action; end
  def action=(arg0); end
  def call_action(matches); end
  def initialize(pattern, action = nil); end
  def match(string_or_pathname); end
  def pattern; end
  def pattern=(arg0); end
  def self.match_files(guard, files); end
  extend Guard::Deprecated::Watcher::ClassMethods
end
class Guard::Watcher::Pattern
  def self.create(pattern); end
end
class Guard::Watcher::Pattern::MatchResult
  def [](index); end
  def initialize(match_result, original_value); end
end
class Guard::Watcher::Pattern::Matcher
  def ==(other); end
  def initialize(obj); end
  def match(string_or_pathname); end
  def matcher; end
  def normalized(string_or_pathname); end
end
class Guard::Watcher::Pattern::DeprecatedRegexp
  def deprecated?; end
  def initialize(pattern); end
  def self.convert(pattern); end
  def self.show_deprecation(pattern); end
end
class Guard::Watcher::Pattern::SimplePath
  def initialize(string_or_pathname); end
  def match(string_or_pathname); end
  def normalize(string_or_pathname); end
end
class Guard::Watcher::Pattern::PathnamePath < Guard::Watcher::Pattern::SimplePath
  def normalize(string_or_pathname); end
end
class Guard::Runner
  def _run_group_plugins(plugins); end
  def _supervise(plugin, task, *args); end
  def run(task, scope_hash = nil); end
  def run_on_changes(modified, added, removed); end
  def self.stopping_symbol_for(guard); end
end
class Guard::Internals::State
  def initialize(cmdline_opts); end
  def scope; end
  def session; end
end
module Guard::Deprecated::Evaluator
  def evaluate_guardfile; end
  def reevaluate_guardfile; end
  def self.add_deprecated(klass); end
end
class Guard::Interactor
  def background(*args, &block); end
  def foreground(*args, &block); end
  def handle_interrupt(*args, &block); end
  def idle_job; end
  def initialize(no_interaction = nil); end
  def interactive?; end
  def self.enabled; end
  def self.enabled=(arg0); end
  def self.enabled?; end
  def self.options; end
  def self.options=(arg0); end
  extend Forwardable
end
class Guard::Notifier
  def self.connect(options = nil); end
  def self.detected; end
  def self.disconnect; end
  def self.notify(message, options = nil); end
  def self.supported; end
  def self.toggle; end
  def self.turn_on; end
end
module Guard::Deprecated::Dsl
  def self.add_deprecated(dsl_klass); end
end
module Guard::Deprecated::Dsl::ClassMethods
  def evaluate_guardfile(options = nil); end
end
class Guard::Dsl
  def _cleanup_backtrace(backtrace); end
  def callback(*args, &block); end
  def clearing(on); end
  def directories(directories); end
  def evaluate(contents, filename, lineno); end
  def filter!(*regexps); end
  def filter(*regexps); end
  def group(*args); end
  def guard(name, options = nil); end
  def ignore!(*regexps); end
  def ignore(*regexps); end
  def interactor(options); end
  def logger(options); end
  def notification(notifier, opts = nil); end
  def scope(scope = nil); end
  def watch(pattern, &action); end
  extend Guard::Deprecated::Dsl::ClassMethods
end
class Guard::Dsl::Error < RuntimeError
end
class Guard::DslReader < Guard::Dsl
  def callback(*_args, &_block); end
  def clearing(_on); end
  def directories(_directories); end
  def group(*_args); end
  def guard(name, _options = nil); end
  def ignore!(*_regexps); end
  def ignore(*_regexps); end
  def initialize; end
  def interactor(_options); end
  def logger(_options); end
  def notification(_notifier, _opts = nil); end
  def plugin_names; end
  def scope(_scope = nil); end
  def watch(_pattern, &_action); end
end
module Guard::Guardfile
end
class Guard::Guardfile::Evaluator
  def _fetch_guardfile_contents; end
  def _from_deprecated(opts); end
  def _guardfile_contents; end
  def _guardfile_contents_usable?; end
  def _guardfile_contents_without_user_config; end
  def _instance_eval_guardfile(contents); end
  def _read(path); end
  def _use_default!; end
  def _use_inline; end
  def _use_provided; end
  def custom?; end
  def evaluate; end
  def guardfile_contents; end
  def guardfile_include?(plugin_name); end
  def guardfile_path; end
  def guardfile_source; end
  def initialize(opts = nil); end
  def inline?; end
  def options; end
  def path; end
  include Guard::Deprecated::Evaluator
end
class Guard::Guardfile::Evaluator::Error < RuntimeError
end
class Guard::Guardfile::Evaluator::NoGuardfileError < Guard::Guardfile::Evaluator::Error
end
class Guard::Guardfile::Evaluator::NoCustomGuardfile < Guard::Guardfile::Evaluator::Error
end
class Guard::Guardfile::Evaluator::NoPluginsError < Guard::Guardfile::Evaluator::Error
end
module Guard::Deprecated::Guard
  def self.add_deprecated(klass); end
end
module Guard::Deprecated::Guard::ClassMethods
  def add_group(name, options = nil); end
  def add_guard(*args); end
  def add_plugin(name, options = nil); end
  def evaluate_guardfile; end
  def evaluator; end
  def get_guard_class(name, fail_gracefully = nil); end
  def group(filter); end
  def groups(filter); end
  def guard_gem_names; end
  def guards(filter = nil); end
  def listener=(_); end
  def locate_guard(name); end
  def lock; end
  def options; end
  def plugin(filter); end
  def plugins(filter); end
  def reset_evaluator(_options); end
  def runner; end
  def running; end
  def scope; end
  def scope=(scope); end
end
module Guard::Internals::Helpers
  def _relative_pathname(path); end
end
module Guard::Internals::Tracing
  def self.trace(mod, meth); end
  def self.untrace(mod, meth); end
end
class Guard::Internals::Debugging
  def self._notify(*args); end
  def self._reset; end
  def self._trace(mod, meth, &block); end
  def self._untrace(mod, meth); end
  def self.start; end
  def self.stop; end
end
module Guard::Internals::Traps
  def self.handle(signal, &block); end
end
class Guard::Internals::Queue
  def <<(changes); end
  def _run_actions(actions); end
  def initialize(commander); end
  def pending?; end
  def process; end
end
