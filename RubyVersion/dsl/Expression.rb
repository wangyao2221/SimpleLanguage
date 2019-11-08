class Number < Struct.new(:value)
  def to_s
    value.to_s
  end

  def reducible?
    false
  end

  def reduce
    value
  end
end

class Variable < Struct.new(:name)
  def reducible?
    true
  end

  def reduce(environment)
    environment[name]
  end
end

class Add < Struct.new(:left, :right)
  def to_s
    "#{left} + #{right}"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      Add.new(left.reduce(environment), right)
    elsif right.reducible?
      Add.new(left,right.reduce(environment))
    else
      Number.new(left.value + right.value)
    end
  end
end

class Multiply < Struct.new(:left, :right)
  def to_s
    "#{left} * #{right}"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      Multiply.new(left.reduce(environment), right)
    elsif right.reducible?
      Multiply.new(left, right.reduce(environment))
    else
      Number.new(left.value * right.value)
    end
  end
end

class Boolean < Struct.new(:value)
  def to_s
    value.to_s
  end

  def reducible?
    false
  end
end

class LessThan < Struct.new(:left,:right)
  def to_s
    "#{left} < #{right}"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      LessThan.new(left.reduce(environment),right)
    elsif right.reducible?
      LessThan.new(left,right.reduce(environment))
    else
      Boolean.new(left.value < right.value)
    end
  end
end

class GreaterThan < Struct.new(:left,:right)
  def to_s
    "#{left} < #{right}"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      GreaterThan.new(left.reduce(environment),right)
    elsif right.reducible?
      GreaterThan.new(left,right.reduce(environment))
    else
      Boolean.new(left.value > right.value)
    end
  end
end

class EQ < Struct.new(:left,:right)
  def to_s
    "#{left} == #{right}"
  end

  def reducible?
    true
  end

  def reduce(environment)
    if left.reducible?
      EQ.new(left.reduce(environment),right)
    elsif right.reducible?
      EQ.new(left,right.reduce(environment))
    else
      EQ.new(left.value == right.value)
    end
  end
end