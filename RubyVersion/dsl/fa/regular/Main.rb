$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'Pattern'

pattern = Repeat.new(
    Choose.new(
              Concatenate.new(Literal.new('a'), Literal.new('b')),
              Literal.new('a')
    )
)

puts pattern
puts pattern.matchs?('aaab')
