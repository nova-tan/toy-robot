class NullDirection

  def offset
    NullPoint.new
  end

  def turn_left
    self
  end

  def turn_right
    self
  end

  def to_s
    'nil'
  end
end