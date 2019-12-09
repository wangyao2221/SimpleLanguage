require 'DPDA'
require '../PDAConfiguration'
require '../Stack'

# 虽然这样定义最终结果是对的，但是语义上不符合，Configuration是表示自动机执行起来的状态，而没有状态机之前不能有Configuration，只能给出包含的元素
#class DPDADesign < Struct.new(:configuration, :accept_states, :rulebook)
#  def to_dpda
#    DPDA.new(configuration, accept_states, rulebook)
#  end
#
#  def accepting?(string)
#    to_dpda.tap {|dpda| dpda.read_string(string)}.accepting?
#  end
#end

class DPDADesign < Struct.new(:start_state, :bottom_character, :accept_states, :rulebook)
  def to_dpda
    start_stack = Stack.new([bottom_character])
    start_configuration = PDAConfiguration.new(start_state, start_stack)
    DPDA.new(start_configuration, accept_states, rulebook)
  end

  def accepting?(string)
    to_dpda.tap {|dpda| dpda.read_string(string)}.accepting?
  end
end
