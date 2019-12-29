$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'NPDA'
require 'NPDARuleBook'
require '../PDAConfiguration'
require '../Stack'
require 'Set'

class NPDADesign < Struct.new(:start_state, :bottom_character, :accept_states, :rulebook)
  def accepts?(string)
    to_npda.tap { |npda| npda.read_string(string) }.accepting?
  end

  def to_npda
    start_stack = Stack.new([bottom_character])
    start_configuration = PDAConfiguration.new(start_state, start_stack)
    # 注意要用 Set[]
    NPDA.new(Set[start_configuration], accept_states, rulebook)
  end
end