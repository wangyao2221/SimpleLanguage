$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'NFA'
require 'NFARuleBook'
require 'Set'
require 'NFADesign'

# rulebook = NFARuleBook.new([
#    FARule.new(1, 'a', 1), FARule.new(1, 'b', 1),
#    FARule.new(1, 'b', 2), FARule.new(2, 'a', 3),
#    FARule.new(2, 'b', 3), FARule.new(3, 'a', 4),
#    FARule.new(3, 'b', 4)
# ])
#
# puts rulebook.next_states(Set[1, 2, 3, 4], 'b')
#
# nfa = NFA.new(Set[1, 2], Set[4], rulebook)
# puts nfa.accepting?
# nfa.read_character('a')
# puts nfa.accepting?
# nfa.read_character('a')
# puts nfa.accepting?
#
# nfa = NFA.new(Set[1, 2], Set[4], rulebook)
# puts nfa.accepting?
# nfa.read_string('aa')
# puts nfa.accepting?

# rulebook = NFARuleBook.new([
#    FARule.new(1, nil, 2), FARule.new(1, 'b', 1),
#    FARule.new(1, 'b', 2), FARule.new(2, 'a', 3),
#    FARule.new(2, 'b', 3), FARule.new(3, 'a', 4),
#    FARule.new(3, 'b', 4)
# ])
#
# # puts NFA.new(Set[1], [4], rulebook).accepting?
# nfa_design = NFADesign.new(1, [4], rulebook)
# puts nfa_design.accepts?('baa')


rulebook = NFARuleBook.new([
   FARule.new(1, nil, 2), FARule.new(1, nil, 4),
   FARule.new(2, 'a', 3), FARule.new(3, 'a', 2),
   FARule.new(4, 'b', 5), FARule.new(5, 'a', 6),
   FARule.new(6, 'a', 4)
])

nfa_design = NFADesign.new(1, [2, 4], rulebook)
puts nfa_design.accepts?('aaaaa')