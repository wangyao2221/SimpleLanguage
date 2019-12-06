class Stack < Struct.new(:contents)
  def push(character)
    Stack.new([character] + contents) # 重新new一个，无破坏性，但浪费空间
  end

  def pop
    Stack.new(contents.drop(1))
  end

  def top
    contents.first
  end

  def inspect
    "#<Stack  (#{top})#{contents.drop(1).join}>"
  end
end
