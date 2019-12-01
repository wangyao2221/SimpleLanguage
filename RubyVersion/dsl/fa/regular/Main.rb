$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'Pattern'
require 'treetop'

#pattern = Repeat.new(
#    Choose.new(
#              Concatenate.new(Literal.new('a'), Literal.new('b')),
#              Literal.new('a')
#    )
#)
#
#puts pattern
#puts pattern.matchs?('aaab')

Treetop.load'pattern'
parser = PatternParser.new
parse_tree = parser.parse('(a(|b))*')
puts parse_tree.inspect
pattern = parse_tree.to_ast
puts pattern.matchs?('abaab')
puts pattern.matchs?('abba')