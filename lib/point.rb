class Point < Struct.new(:x, :y)

  def to_s
    "#{x},#{y}"
  end

  def +(point)
    Point.new x + point.x, y + point.y
  end
end