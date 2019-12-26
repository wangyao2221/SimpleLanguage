$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'DPDARuleBook'
require '../PDAConfiguration'
require '../Stack'
require '../PDARule'
require 'DPDA'
require 'DPDADesign'

#configuration = PDAConfiguration.new(1, Stack.new(['$']))
#rule = PDARule.new(1, '(', 2, '$', ['b', '$'])
#rulebook = DPDARuleBook.new([PDARule.new(1, '(', 2, '$', ['b', '$']),
#                             PDARule.new(2, '(', 2, 'b', ['b', 'b']),
#                             PDARule.new(2, ')', 2, 'b', []),
#                             PDARule.new(2, nil, 1, '$', ['$'])])
##puts rulebook.next_state(configuration, '(')
#
#dpda = DPDA.new(configuration, [1], rulebook)
#puts dpda.accepting?
#dpda.read_string('(()')
#puts dpda.accepting?
#puts dpda.current_configuration
#
#configuration = PDAConfiguration.new(2, Stack.new(['$']))
#puts rulebook.follow_free_moves(configuration)
#
#dpda_design = DPDADesign.new(2, '$', [1], rulebook)
#puts dpda_design.accepting?('((a))') # error

# DPDA 引入 NPDA
# 识别a、b数量相等的确定性下推自动机
#rulebook = DPDARuleBook.new([PDARule.new(1, 'a', 2, '$', ['a', '$']),
#                             PDARule.new(1, 'b', 2, '$', ['b', '$']),
#                             PDARule.new(2, 'a', 2, 'a', ['a', 'a']),
#                             PDARule.new(2, 'b', 2, 'b', ['b', 'b']),
#                             PDARule.new(2, 'a', 2, 'b', []),
#                             PDARule.new(2, 'b', 2, 'a', []),
#                             PDARule.new(2, nil, 1, '$', ['$'])
#                            ])
#
#dpda_design = DPDADesign.new(1, '$', [1], rulebook)
#puts dpda_design.accepting?('ababab')
#puts dpda_design.accepting?('bbbaaaab')
#puts dpda_design.accepting?('baa')

# 是被回文
rulebook = DPDARuleBook.new([PDARule.new(1, 'a', 1, '$', ['a', '$']),
                             PDARule.new(1, 'a', 1, 'a', ['a', 'a']),
                             PDARule.new(1, 'a', 1, 'b', ['a', 'b']),
                             PDARule.new(1, 'b', 1, '$', ['b', '$']),
                             PDARule.new(1, 'b', 1, 'b', ['b', 'b']),
                             PDARule.new(1, 'b', 1, 'a', ['b', 'a']),
                             PDARule.new(1, 'm', 2, '$', ['$']),
                             PDARule.new(1, 'm', 2, 'a', ['a']),
                             PDARule.new(1, 'm', 2, 'b', ['b']),
                             PDARule.new(2, 'a', 2, 'a', []),
                             PDARule.new(2, 'b', 2, 'b', []),
                             PDARule.new(2, nil, 3, '$', ['$'])
                            ])

dpda_design = DPDADesign.new(1, '$', [3], rulebook)
puts dpda_design.accepting?('abmba')
puts dpda_design.accepting?('babbamabbab')
puts dpda_design.accepting?('abmb')
puts dpda_design.accepting?('baambaa')