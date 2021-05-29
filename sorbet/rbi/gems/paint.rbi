# This file is autogenerated. Do not edit it by hand. Regenerate it with:
#   srb rbi gems

# typed: strict
#
# If you would like to make changes to this file, great! Please create the gem's shim here:
#
#   https://github.com/sorbet/sorbet-typed/new/master?filename=lib/paint/all/paint.rbi
#
# paint-2.2.1

module Paint
  def self.%(paint_arguments, clear_color = nil); end
  def self.[](string, *options); end
  def self.color(*options); end
  def self.detect_mode; end
  def self.effect(effect_name); end
  def self.mode; end
  def self.mode=(val); end
  def self.random(background = nil); end
  def self.rgb(red, green, blue, background = nil); end
  def self.rgb_color_distance(rgb1, rgb2); end
  def self.rgb_hex(string, background = nil); end
  def self.rgb_name(color_name, background = nil); end
  def self.rgb_to_256(red, green, blue, approx = nil); end
  def self.rgb_to_ansi(red, green, blue, use_bright = nil); end
  def self.rgb_true(red, green, blue); end
  def self.simple(color_name, background = nil); end
  def self.unpaint(string); end
  def self.wrap(*ansi_codes); end
end