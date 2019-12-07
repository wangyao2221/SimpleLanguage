$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'Stack'
require 'PDARule'
require 'PDAConfiguration'

#stack = Stack.new(['a','b','c','d','e','f','g'])
#puts stack.inspect
#puts stack.top
#puts stack.pop.inspect
#puts stack.pop.top
#puts stack.push('x').inspect

configuration = PDAConfiguration.new('1', Stack.new(['$']))
rule = PDARule.new('1', '(', '2', '$', ['b', '$'])
puts rule.applies_to?(configuration, '(')