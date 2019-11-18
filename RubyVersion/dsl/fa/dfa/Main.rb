$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'DFARuleBook'
require 'DFA'
require 'DFADesign'

rulebook = DFARuleBook.new([
    FARule.new(1, 'a', 2), FARule.new(1, 'b', 1),
    FARule.new(2, 'a', 2), FARule.new(2, 'b', 3),
    FARule.new(3, 'a', 3), FARule.new(3, 'b', 3)
])

# puts rulebook.next_state(1, 'b')

# dfa = DFA.new(1, [3], rulebook)
# puts dfa
# puts dfa.accepting?
# dfa.read_character('a')
# puts dfa
# puts dfa.accepting?
# dfa.read_character('b')
# puts dfa
# puts dfa.accepting?

# dfa = DFA.new(1, [3], rulebook)
# puts dfa
# dfa.read_string('aaa')
# puts dfa.accepting?

dfa_design = DFADesign.new(1, [3], rulebook)
puts dfa_design.accepting?('ab')