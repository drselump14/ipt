# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/verse/all/verse.rbi
#
# verse-0.4.0

module Verse
  def self.align(text, width, direction, options = nil); end
  def self.pad(text, padding, options = nil); end
  def self.truncate(text, truncate_at, options = nil); end
  def self.wrap(text, wrap_at, options = nil); end
end
class Verse::Alignment
  def actual_width(text); end
  def align(width, direction = nil, options = nil); end
  def center(width, options = nil); end
  def center_justify(text, width, filler); end
  def convert_to_method(direction); end
  def direction; end
  def fill; end
  def initialize(text, options = nil); end
  def left(width, options = nil); end
  def left_justify(text, width, filler); end
  def process_lines; end
  def right(width, options = nil); end
  def right_justify(text, width, filler); end
  def self.align(text, width, direction, options); end
  def text; end
end
class Verse::Padder
  def bottom; end
  def bottom=(value); end
  def empty?; end
  def horizontal?; end
  def initialize(padding); end
  def left; end
  def left=(value); end
  def padding; end
  def right; end
  def right=(value); end
  def self.convert_to_ary(value); end
  def self.parse(value = nil); end
  def to_s; end
  def top; end
  def top=(value); end
  def vertical?; end
end
class Verse::Padding
  def display_width(string); end
  def initialize(text, options = nil); end
  def maximum_length(text); end
  def pad(padding = nil, options = nil); end
  def pad_around(text); end
  def pad_multi_line(text); end
  def self.pad(text, padding, options); end
  def text; end
end
class Verse::Sanitizer
  def ansi?(string); end
  def replace(text, separator = nil); end
  def sanitize(text); end
end
class Verse::Truncation
  def display_width(string); end
  def initialize(text, options = nil); end
  def self.truncate(text, truncate_at, options = nil); end
  def separator; end
  def shorten(original_chars, chars, length_without_trailing); end
  def text; end
  def to_chars(text); end
  def trailing; end
  def truncate(truncate_at = nil, options = nil); end
end
class Verse::Wrapping
  def display_width(string); end
  def format_paragraph(paragraph, wrap_at, ansi_stack); end
  def initialize(text, options = nil); end
  def insert_ansi(ansi_stack, string); end
  def self.wrap(text, wrap_at, options = nil); end
  def text; end
  def wrap(wrap_at = nil); end
end
