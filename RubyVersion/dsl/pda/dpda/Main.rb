$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'DPDARuleBook'
require '../PDAConfiguration'
require '../Stack'
require '../PDARule'
require 'DPDA'
require 'DPDADesign'

configuration = PDAConfiguration.new(1, Stack.new(['$']))
rule = PDARule.new(1, '(', 2, '$', ['b', '$'])
rulebook = DPDARuleBook.new([PDARule.new(1, '(', 2, '$', ['b', '$']),
                             PDARule.new(2, '(', 2, 'b', ['b', 'b']),
                             PDARule.new(2, ')', 2, 'b', []),
                             PDARule.new(2, nil, 1, '$', ['$'])])
#puts rulebook.next_state(configuration, '(')

dpda = DPDA.new(configuration, [1], rulebook)
puts dpda.accepting?
dpda.read_string('(()')
puts dpda.accepting?
puts dpda.current_configuration

configuration = PDAConfiguration.new(2, Stack.new(['$']))
puts rulebook.follow_free_moves(configuration)

dpda_design = DPDADesign.new(2, '$', [1], rulebook)
puts dpda_design.accepting?('((a))') # error
