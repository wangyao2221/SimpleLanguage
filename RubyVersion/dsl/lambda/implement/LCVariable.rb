class LCVariable < Struct.new(:name)
  def to_s
    name.to_s
  end

  def inspect
    to_s
  end
end
