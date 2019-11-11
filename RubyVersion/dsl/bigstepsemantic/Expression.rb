class Number < Struct.new(:value)
  def evaluate(environment)
    self
  end
end

class Variable < Struct.new(:name)

end

class Add < Struct.new(:left, :right)
  def evaluate(environment)
    Number.new(left.evaluate(environment).value + right.evaluate(environment).value)
  end
end

class Multiply < Struct.new(:left, :right)

end

class Boolean < Struct.new(:value)

end

class LessThan < Struct.new(:left,:right)

end

class GreaterThan < Struct.new(:left,:right)

end

class EQ < Struct.new(:left,:right)

end