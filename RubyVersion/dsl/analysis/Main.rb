$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'LexicalAnalyzer'

puts LexicalAnalyzer.new('y = x * 7').analyze
puts
puts LexicalAnalyzer.new('while (x < 5) { x = x * 3 }').analyze
puts
puts LexicalAnalyzer.new('if (x < 10) { y = true; x = 0 } else { do-nothing }').analyze