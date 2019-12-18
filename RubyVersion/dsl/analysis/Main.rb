$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'LexicalAnalyzer'

puts LexicalAnalyzer.new('y = x * 7').analyze
