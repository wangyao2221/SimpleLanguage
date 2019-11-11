$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Expression'

puts Number.new(10).evaluate({})
puts Add.new(Number.new(10), Number.new(20)).evaluate({})