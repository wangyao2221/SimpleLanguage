$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Expression'
require 'Statement'

# proc = eval(Number.new(5).to_ruby)
# puts proc.call({})
#
# proc = eval(Variable.new(:x).to_ruby)
# puts proc.call({x: 7})
#
# proc = eval(Add.new(Variable.new(:x), Number.new(2)).to_ruby)
# puts proc.call({x: 1})
#
# proc = eval(Multiply.new(Number.new(1), Number.new(2)).to_ruby)
# puts proc.call({})
#
# proc = eval(GreaterThan.new(Number.new(1), Number.new(2)).to_ruby)
# puts proc.call({})
#
# proc = eval(LessThan.new(Number.new(1), Number.new(2)).to_ruby)
# puts proc.call({})
#
# proc = eval(EQ.new(Number.new(2), Number.new(2)).to_ruby)
# puts proc.call({})

# statement = Assignment.new(:x, Number.new(1))
# puts statement.to_ruby
# proc = eval(statement.to_ruby)
# puts proc.call({})

# statement = Sequence.new(Assignment.new(:x, Number.new(1)), Assignment.new(:y, Number.new(2)))
# puts statement.to_ruby
# proc = eval(statement.to_ruby)
# puts proc.call({})

statement = While.new(
    LessThan.new(Variable.new(:x), Number.new(5)),
    Assignment.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
)
puts statement.to_ruby
proc = eval(statement.to_ruby)
puts proc.call({x: 1})
