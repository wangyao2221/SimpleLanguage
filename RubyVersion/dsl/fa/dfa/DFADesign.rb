require 'DFA'

class DFADesign < Struct.new(:current_state, :accept_states, :rulebook)
  def to_dfa
    DFA.new(current_state, accept_states, rulebook)
  end

  def accepting?(string)
    # 面向过程或面向对象实现这一行需要三行，第一步: dfa = to_dfa 第二步:dfa.read_string(string) 第三部: dfa.accepting?，这里只需要一行
    to_dfa.tap {|dfa| dfa.read_string(string)}.accepting?
  end
end
