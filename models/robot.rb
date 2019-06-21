
require_relative "../helper/helper"
require_relative "../config/config"

# model for generating robot
class Robot
  attr_accessor :x, :y, :facing_direction

  def initialize(x, y, f, size_x = 5, size_y = 5)
    @x = x
    @y = y
    @facing_direction = f.upcase
    @degree = convert_direction_to_degree
    @size_x = size_x
    @size_y = size_y
  end

  def convert_direction_to_degree
    Config.direction_convertor[@facing_direction]
  end

  def convert_degree_to_direction
    Config.direction_convertor.key(@degree)
  end

  # move robot based on direction
  def move
    case convert_degree_to_direction
    when "NORTH"
      @y = @y + 1 < @size_y ? @y + 1 : @y
    when "WEST"
      @x = @x - 1 >= 0 ? @x - 1 : @x
    when "SOUTH"
      @y = @y - 1 >= 0 ? @y - 1 : @y
    when "EAST"
      @x = @x + 1 < @size_x ? @x + 1 : @x
    end
  end

  # left /right will rotate robot 90 degrees at desired direction
  def left
    @degree = (@degree - 90) % 360
  end

  def right
    @degree = (@degree + 90) % 360
  end

  # get robot postion and facing direction
  def report
    @facing_direction = convert_degree_to_direction
    "#{@x},#{@y},#{@facing_direction}"
  end
end
