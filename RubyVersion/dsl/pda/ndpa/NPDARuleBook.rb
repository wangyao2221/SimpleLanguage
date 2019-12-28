class NPDARuleBook < Struct.new(:rules)
  def next_configurations(configurations, character)
    configurations.flat_map { |config| follow_rules_for(config, character)}.to_set
    #configurations.map { |config| follow_rules_for(config, character)}.to_set # 实验map是否可行
  end

  def follow_rules_for(configuration, character)
    rules_for(configuration, character).map {|rule| rule.follow(configuration)}
  end

  def rules_for(configuration, character)
    rules.select {|rule| rule.applies_to?(configuration, character)}
  end

  def follow_free_moves(configurations)
    more_configurations = next_configurations(configurations, nil)

    if more_configurations.subset?(configurations)
      follow_free_moves(configurations + more_configurations)
    else
      configurations
    end
  end
end
