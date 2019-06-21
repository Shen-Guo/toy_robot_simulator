require "minitest/autorun"
require_relative "../models/robot"
require_relative "../helper/helper"
require_relative "../config/config"
require_relative "../lib/robot_toy_lib"

class OutputTest < MiniTest::Unit::TestCase
  def test_output_a
    commands = ["PLACE 0,0,NORTH", "MOVE", "LEFT", "RIGHT", "REPORT"]
    robot_toy = RobotToyLib.new(commands)
    assert_equal "0,1,NORTH", robot_toy.handle_commands
  end

  def test_output_b
    commands = ["PLACE 0,0,NORTH", "LEFT", "REPORT"]
    robot_toy = RobotToyLib.new(commands)
    assert_equal "0,0,WEST", robot_toy.handle_commands
  end

  def test_output_c
    commands = ["PLACE 1,2,EAST", "MOVE", "MOVE", "LEFT", "MOVE", "REPORT"]
    robot_toy = RobotToyLib.new(commands)
    assert_equal "3,3,NORTH", robot_toy.handle_commands
  end

  def test_output_out_boundary_a
    commands = ["PLACE 4,4,EAST", "MOVE", "REPORT"]
    robot_toy = RobotToyLib.new(commands)
    assert_equal "4,4,EAST", robot_toy.handle_commands
  end

  def test_output_out_boundary_b
    commands = ["PLACE 0,0,WEST", "MOVE", "LEFT", "REPORT"]
    robot_toy = RobotToyLib.new(commands)
    assert_equal "0,0,SOUTH", robot_toy.handle_commands
  end

  def test_output_out_boundary_c
    commands = ["PLACE 4,0,EAST", "MOVE", "LEFT", "REPORT"]
    robot_toy = RobotToyLib.new(commands)
    assert_equal "4,0,NORTH", robot_toy.handle_commands
  end

  def test_output_out_boundary_d
    commands = ["PLACE 0,4,NORTH", "MOVE", "MOVE", "REPORT"]
    robot_toy = RobotToyLib.new(commands)
    assert_equal "0,4,NORTH", robot_toy.handle_commands
  end
end
