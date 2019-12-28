class DPDA < Struct.new(:current_configuration, :accept_states, :rulebook)
  def accepting?
    accept_states.include?(current_configuration.state)
  end

  # NPDA里没有next_configurations,对比一下原因在于applies_to?,NDPA的next_configurations没有就是空寂，不需要applies_to?去判断
  # 所以NDPA直接使用read_character,DPDA封装了一层,使逻辑更清晰
  def next_configuration(character)
    #self.current_configuration = rulebook.next_configuration(current_configuration, character) V1.0 假设它总能找到可用的规则，所以没有规则可用时会报错
    if rulebook.applies_to?(current_configuration, character)
      rulebook.next_configuration(current_configuration, character)
    else
      current_configuration.stuck
    end
  end

  def read_character(character)
    self.current_configuration = next_configuration(character)
  end

  def stuck?
    current_configuration.stuck?
  end

  def read_string(string)
    string.chars.each do |character|
      read_character(character) unless stuck?
    end
  end

  def current_configuration
    rulebook.follow_free_moves(super)
  end
end
