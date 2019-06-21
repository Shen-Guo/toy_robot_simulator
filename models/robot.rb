
require_relative "../helper/helper"
require_relative "../config/config"

class Robot
  attr_accessor :x, :y, :facing_direction

  def initialize(x, y, f)
    @x = x
    @y = y
    @facing_direction = f.upcase
    @degree = convert_direction_to_degree
  end

  def convert_direction_to_degree
    Config.direction_convertor[@facing_direction]
  end

  def convert_degree_to_direction
    Config.direction_convertor.key(@degree)
  end

  def move
    case @degree
    when 270
      @y = @y + 1 < Config.table_size_y ? @y + 1 : @y
    when 180
      @x = @x - 1 >= 0 ? @x - 1 : @x
    when 90
      @y = @y - 1 >= 0 ? @y - 1 : @y
    when 0
      @x = @x + 1 < Config.table_size_x ? @x + 1 : @x
    end
  end

  def left
    @degree = (@degree - 90) % 360
  end

  def right
    @degree = (@degree + 90) % 360
  end

  def report
    @facing_direction = convert_degree_to_direction
    "#{@x},#{@y},#{@facing_direction}"
  end
end
