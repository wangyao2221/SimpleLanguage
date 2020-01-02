$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Tape'
require 'TMRule'
require 'TMConfiguration'
require 'DTMRulebook'
require 'DTM'

tape = Tape.new(['1', '0', '1'], '1', [], '_')
puts tape.inspect
puts tape.move_head_left.inspect
puts tape.move_head_right.inspect
puts tape.move_head_right.write('0').inspect

rule = TMRule.new(1, '0', 2, '1', :right)
puts rule
puts rule.applies_to?(TMConfiguration.new(1, Tape.new([], '0', [], '_')))
puts rule.applies_to?(TMConfiguration.new(1, Tape.new([], '1', [], '_')))
puts rule.applies_to?(TMConfiguration.new(2, Tape.new([], '0', [], '_')))

puts rule.follow(TMConfiguration.new(1, Tape.new([], '0', [], '_')))

rulebook = DTMRuleBook.new([
                               TMRule.new(1, '0', 2, '1', :right),
                               TMRule.new(1, '1', 1, '0', :left),
                               TMRule.new(1, '_', 2, '1', :right),
                               TMRule.new(2, '0', 2, '0', :right),
                               TMRule.new(2, '1', 2, '1', :right),
                               TMRule.new(2, '_', 3, '_', :left)
                           ])
puts rulebook
configuration = TMConfiguration.new(1, tape)
configuration = rulebook.next_configuration(configuration)
puts configuration
configuration = rulebook.next_configuration(configuration)
puts configuration
configuration = rulebook.next_configuration(configuration)
puts configuration
configuration = rulebook.next_configuration(configuration)
puts configuration
configuration = rulebook.next_configuration(configuration)
puts configuration
configuration = rulebook.next_configuration(configuration)
puts configuration
#configuration = rulebook.next_configuration(configuration)
#puts configuration

dtm = DTM.new(TMConfiguration.new(1, tape), [3], rulebook)
puts dtm.accepting?
dtm.run
puts dtm
puts dtm.accepting?

tape = Tape.new(['1', '2', '1'], '1', [], '_')
dtm = DTM.new(TMConfiguration.new(1, tape), [3], rulebook)
dtm.run
puts dtm
puts dtm.accepting?
puts dtm.stuck?