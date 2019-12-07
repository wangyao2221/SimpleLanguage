$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'DPDARuleBook'
require '../PDAConfiguration'
require '../Stack'
require '../PDARule'

configuration = PDAConfiguration.new('1', Stack.new(['$']))
rule = PDARule.new('1', '(', '2', '$', ['b', '$'])
rulebook = DPDARuleBook.new([rule])
puts rulebook.next_state(configuration, '(')