class Direction < Struct.new(:direction)

  attr_accessor :current_index

  def offset
    directions[current_index][1]
  end

  def turn_right
    Direction.new right_direction
  end

  def turn_left
    Direction.new left_direction
  end

  def to_s
    direction.upcase.to_s
  end

private

  def right_direction
    directions[next_direction_index][0]
  end

  def left_direction
    directions[previous_direction_index][0]
  end

  def next_direction_index
    return 0 if current_index + 1 == directions.size
    current_index + 1
  end

  def previous_direction_index
    current_index - 1
  end

  def directions
    [
      [:north, Point.new(0, 1)],
      [:east, Point.new(1, 0)],
      [:south, Point.new(0, -1)],
      [:west, Point.new(-1, 0)]
    ]
  end

  def current_index
    @current_index ||= find_current_index
  end

  def find_current_index
    directions.each_with_index do |direction_array, index|
      return index if direction_array.include? direction
    end
    raise "Invalid Direction: #{direction}"
  end
end