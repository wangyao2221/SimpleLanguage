class LCCall < Struct.new(:left, :right)
  def replace(name, replacement)
    LCCall.new(left.replace(name, replacement), right.replace(name, replacement))
  end

  def to_s
    "#{left}[#{right}]"
  end

  def inspect
    to_s
  end
end
