$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Tape'

tape = Tape.new(['1', '0', '1'], '1', [], '_')
puts tape.inspect
puts tape.move_head_left.inspect
puts tape.move_head_right.inspect
puts tape.move_head_right.write('0').inspect