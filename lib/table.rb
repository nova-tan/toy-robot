class Table

  attr_accessor :width, :height

  def initialize(width = 5, height = 5)
    self.width = width
    self.height = height
  end

  def on_table?(point)
    point.x <= width and point.x >= 0 and point.y <= width and point.y >= 0
  end

end