$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'NPDARuleBook'
require 'NPDADesign'
require '../PDARule'
require 'Set'

rulebook = NPDARuleBook.new([PDARule.new(1, 'a', 1, '$', ['a', '$']),
                             PDARule.new(1, 'a', 1, 'a', ['a', 'a']),
                             PDARule.new(1, 'a', 1, 'b', ['a', 'b']),
                             PDARule.new(1, 'b', 1, '$', ['b', '$']),
                             PDARule.new(1, 'b', 1, 'b', ['b', 'b']),
                             PDARule.new(1, 'b', 1, 'a', ['b', 'a']),
                             PDARule.new(1, nil, 2, '$', ['$']),
                             PDARule.new(1, nil, 2, 'a', ['a']),
                             PDARule.new(1, nil, 2, 'b', ['b']),
                             PDARule.new(2, 'a', 2, 'a', []),
                             PDARule.new(2, 'b', 2, 'b', []),
                             PDARule.new(2, nil, 3, '$', ['$'])
                            ])

configuration = PDAConfiguration.new(1, Stack.new(['$']))
npda = NPDA.new(Set[configuration], [3], rulebook)
puts npda.accepting?
puts npda.current_configurations
npda.read_string('abb')
puts npda.accepting?
puts npda.current_configurations
npda.read_character('a')
puts npda.accepting?
puts npda.current_configurations

puts

npda_design = NPDADesign.new(1, '$', [3], rulebook)
puts npda_design.accepting?('abba')
puts npda_design.accepting?('babbaabbab')
puts npda_design.accepting?('abb')
puts npda_design.accepting?('baabaa')