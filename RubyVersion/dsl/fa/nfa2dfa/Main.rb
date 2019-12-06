$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'NFA'
require 'NFARuleBook'
require 'Set'
require 'NFADesign'
require 'NFASimulation'

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
   FARule.new(1, 'a', 1), FARule.new(1, 'a', 2),
   FARule.new(1, nil, 2), FARule.new(2, 'b', 3),
   FARule.new(3, 'b', 1), FARule.new(3, nil, 2)
])

nfa_design = NFADesign.new(1, [3], rulebook)
puts nfa_design.to_nfa.current_states
puts nfa_design.to_nfa(Set[2]).current_states

puts 'next_state'
puts simulation = NFASimulation.new(nfa_design)
puts simulation.next_state(Set[1,2], 'a')
puts simulation.next_state(Set[1,2], 'b')
puts simulation.next_state(Set[3,2], 'b')
puts simulation.next_state(Set[1,3,2], 'b')
puts simulation.next_state(Set[1,3,2], 'a')

puts 'discover_states_and_rules'
start_state = nfa_design.to_nfa.current_states
puts start_state
puts simulation.discover_states_and_rules(Set[start_state])
