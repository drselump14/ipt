# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/middleware/all/middleware.rbi
#
# middleware-0.1.0

module Middleware
end
class Middleware::Builder
  def call(env = nil); end
  def delete(index); end
  def flatten; end
  def index(object); end
  def initialize(opts = nil, &block); end
  def insert(index, middleware, *args, &block); end
  def insert_after(index, middleware, *args, &block); end
  def insert_before(index, middleware, *args, &block); end
  def replace(index, middleware, *args, &block); end
  def stack; end
  def to_app; end
  def use(middleware, *args, &block); end
end
class Middleware::Runner
  def build_call_chain(stack); end
  def call(env); end
  def initialize(stack); end
end
