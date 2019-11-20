$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'NFA'
require 'NFARuleBook'
require 'Set'

rulebook = NFARuleBook.new([
   FARule.new(1, 'a', 1), FARule.new(1, 'b', 1),
   FARule.new(1, 'b', 2), FARule.new(2, 'a', 3),
   FARule.new(2, 'b', 3), FARule.new(3, 'a', 4),
   FARule.new(3, 'b', 4)
])

puts rulebook.next_states(Set[1, 2, 3, 4], 'b')

nfa = NFA.new(Set[1, 2], Set[4], rulebook)
puts nfa.accepting?
nfa.read_character('a')
puts nfa.accepting?
nfa.read_character('a')
puts nfa.accepting?

nfa = NFA.new(Set[1, 2], Set[4], rulebook)
puts nfa.accepting?
nfa.read_character('aa')
puts nfa.accepting?
