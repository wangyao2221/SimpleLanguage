$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'Tape'
require 'TMRule'
require 'TMConfiguration'
require 'DTMRulebook'
require 'DTM'

tape = Tape.new(['1', '0', '1'], '1', [], '_')
puts tape.inspect
puts tape.move_head_left.inspect
puts tape.move_head_right.inspect
puts tape.move_head_right.write('0').inspect

rule = TMRule.new(1, '0', 2, '1', :right)
puts rule
puts rule.applies_to?(TMConfiguration.new(1, Tape.new([], '0', [], '_')))
puts rule.applies_to?(TMConfiguration.new(1, Tape.new([], '1', [], '_')))
puts rule.applies_to?(TMConfiguration.new(2, Tape.new([], '0', [], '_')))

puts rule.follow(TMConfiguration.new(1, Tape.new([], '0', [], '_')))

rulebook = DTMRuleBook.new([
                               TMRule.new(1, '0', 2, '1', :right),
                               TMRule.new(1, '1', 1, '0', :left),
                               TMRule.new(1, '_', 2, '1', :right),
                               TMRule.new(2, '0', 2, '0', :right),
                               TMRule.new(2, '1', 2, '1', :right),
                               TMRule.new(2, '_', 3, '_', :left)
                           ])
puts rulebook
configuration = TMConfiguration.new(1, tape)
configuration = rulebook.next_configuration(configuration)
puts configuration
configuration = rulebook.next_configuration(configuration)
puts configuration
configuration = rulebook.next_configuration(configuration)
puts configuration
configuration = rulebook.next_configuration(configuration)
puts configuration
configuration = rulebook.next_configuration(configuration)
puts configuration
configuration = rulebook.next_configuration(configuration)
puts configuration
#configuration = rulebook.next_configuration(configuration)
#puts configuration

dtm = DTM.new(TMConfiguration.new(1, tape), [3], rulebook)
puts dtm.accepting?
dtm.run
puts dtm
puts dtm.accepting?

# 卡死情况处理
tape = Tape.new(['1', '2', '1'], '1', [], '_')
dtm = DTM.new(TMConfiguration.new(1, tape), [3], rulebook)
dtm.run
puts dtm
puts dtm.accepting?
puts dtm.stuck?

rulebook = DTMRuleBook.new([
                                # 状态 1：向右扫描，查找 a
                               TMRule.new(1, 'X', 1, 'X', :right), # 跳过 X
                               TMRule.new(1, 'a', 2, 'X', :right), # 删除 a，进入状态 2
                               TMRule.new(1, '_', 6, '_', :left), # 查找空格，进入状态 6（接受）
                               # 状态 2：向右扫描，查找 b
                               TMRule.new(2, 'a', 2, 'a', :right), # 跳过 a
                               TMRule.new(2, 'X', 2, 'X', :right), # 跳过 X
                               TMRule.new(2, 'b', 3, 'X', :right), # 删除 b，进入状态 3
                               # 状态 3：向右扫描，查找 c
                               TMRule.new(3, 'b', 3, 'b', :right), # 跳过 b
                               TMRule.new(3, 'X', 3, 'X', :right), # 跳过 X
                               TMRule.new(3, 'c', 4, 'X', :right), # 删除 c，进入状态 4
                               # 状态 4：向右扫描，查找字符串结束标记
                               TMRule.new(4, 'c', 4, 'c', :right), # 跳过 c
                               TMRule.new(4, '_', 5, '_', :left), # 查找空格，进入状态 5
                               # 状态 5：向左扫描，查找字符串开始标记
                               TMRule.new(5, 'a', 5, 'a', :left), # 跳过 a
                               TMRule.new(5, 'b', 5, 'b', :left), # 跳过 b
                               TMRule.new(5, 'c', 5, 'c', :left), # 跳过 c
                               TMRule.new(5, 'X', 5, 'X', :left), # 跳过 X
                               TMRule.new(5, '_', 1, '_', :right) # 查找空格，进入状态 1
                           ])

tape = Tape.new([], 'a', ['a', 'a', 'b', 'b', 'b', 'c', 'c', 'c'], '_')
dtm = DTM.new(TMConfiguration.new(1, tape), [6], rulebook)
10.times {dtm.step}
puts dtm.current_configuration
25.times {dtm.step}
puts dtm.current_configuration
dtm.run
puts dtm.current_configuration
puts dtm.accepting?


rulebook = DTMRuleBook.new([
                                # 状态 1： 从磁带读取第一个字符
                               TMRule.new(1, 'a', 2, 'a', :right), # 记住 a
                               TMRule.new(1, 'b', 3, 'b', :right), # 记住 b
                               TMRule.new(1, 'c', 4, 'c', :right), # 记住 c
                               # 状态 2： 向右扫描，查找字符串结束标记（记住 a）
                               TMRule.new(2, 'a', 2, 'a', :right), # 跳过 a
                               TMRule.new(2, 'b', 2, 'b', :right), # 跳过 b
                               TMRule.new(2, 'c', 2, 'c', :right), # 跳过 c
                               TMRule.new(2, '_', 5, 'a', :right), # 找到空格，写 a
                               # 状态 3： 向右扫描，查找字符串结束标记（记住 b）
                               TMRule.new(3, 'a', 3, 'a', :right), # 跳过 a
                               TMRule.new(3, 'b', 3, 'b', :right), # 跳过 b
                               TMRule.new(3, 'c', 3, 'c', :right), # 跳过 c
                               TMRule.new(3, '_', 5, 'b', :right), # 找到空格，写 b
                               TMRule.new(4, 'a', 4, 'a', :right), # 跳过 a
                               TMRule.new(4, 'b', 4, 'b', :right), # 跳过 b
                               TMRule.new(4, 'c', 4, 'c', :right), # 跳过 c
                               TMRule.new(4, '_', 5, 'c', :right) # 查找空格，写 c
                           ])

tape = Tape.new([], 'b', ['c', 'b', 'c', 'a'], '_')
dtm = DTM.new(TMConfiguration.new(1, tape), [5], rulebook)
dtm.run
puts dtm.current_configuration.tape.inspect

def increment_rules(start_state, return_state)
  incrementing = start_state
  finishing = Object.new
  finished = return_state
  [
      TMRule.new(incrementing, '0', finishing, '1', :right),
      TMRule.new(incrementing, '1', incrementing, '0', :left),
      TMRule.new(incrementing, '_', finishing, '1', :right),
      TMRule.new(finishing, '0', finishing, '0', :right),
      TMRule.new(finishing, '1', finishing, '1', :right),
      TMRule.new(finishing, '_', finished, '_', :left)
  ]
end

added_zero, added_one, added_two, added_three = 0, 1, 2, 3
rulebook = DTMRuleBook.new(
    increment_rules(added_zero, added_one) +
        increment_rules(added_one, added_two) +
        increment_rules(added_two, added_three)
)
puts rulebook.rules.length
tape = Tape.new(['1', '0', '1'], '1', [], '_')
dtm = DTM.new(TMConfiguration.new(added_zero, tape), [added_three], rulebook)
dtm.run
puts dtm.current_configuration.tape.inspect