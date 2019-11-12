$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Expression'
require 'Statement'

# puts Number.new(10).evaluate({})
# puts Add.new(Number.new(10), Number.new(20)).evaluate({})
# puts GreaterThan.new(Add.new(Number.new(3), Number.new(2)), Add.new(Number.new(2), Number.new(2))).evaluate({})
#
# puts Assignment.new(:x, Number.new(1)).evaluate({})
# puts If.new(GreaterThan.new(Number.new(1), Number.new(2)), Assignment.new(:x, Number.new(1)), Assignment.new(:x, Number.new(2))).evaluate({})
# puts Sequence.new(Assignment.new(:x, Number.new(1)), Assignment.new(:y, Number.new(2))).evaluate({})
puts While.new(LessThan.new(Variable.new(:x), Number.new(10)), Assignment.new(:x, Add.new(Variable.new(:x), Number.new(1)))).evaluate({:x => Number.new(1)})