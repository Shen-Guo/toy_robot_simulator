require "minitest/autorun"
require_relative "../models/robot"

class RobotTest < MiniTest::Unit::TestCase
  def test_init
    robot = Robot.new(0, 0, "NORTH")
    assert_equal 0, robot.x
    assert_equal 0, robot.y
    assert_equal "NORTH", robot.facing_direction
  end

  def test_move_north
    robot = Robot.new(0, 0, "NORTH")
    robot.move
    assert_equal "0,1,NORTH", robot.report
  end

  def test_move_south
    robot = Robot.new(1, 1, "SOUTH")
    robot.move
    assert_equal "1,0,SOUTH", robot.report
  end

  def test_move_east
    robot = Robot.new(1, 1, "EAST")
    robot.move
    assert_equal "2,1,EAST", robot.report
  end

  def test_move_west
    robot = Robot.new(1, 1, "WEST")
    robot.move
    assert_equal "0,1,WEST", robot.report
  end

  def test_left
    robot = Robot.new(0, 0, "NORTH")
    robot.left
    assert_equal "0,0,WEST", robot.report
  end

  def test_right
    robot = Robot.new(0, 0, "NORTH")
    robot.right
    assert_equal "0,0,EAST", robot.report
  end

  def test_report_with_multiple_commands
    robot = Robot.new(0, 0, "NORTH")
    robot.right
    robot.move
    robot.move
    robot.left
    robot.move
    assert_equal "2,1,NORTH", robot.report
  end

  def test_invalid_move
    robot = Robot.new(0, 0, "NORTH")
    robot.left
    robot.move
    assert_equal "0,0,WEST", robot.report
  end

  def test_invalid_move_a
    robot = Robot.new(0, 0, "NORTH")
    robot.left
    robot.move
    assert_equal "0,0,WEST", robot.report
  end

  def test_invalid_move_b
    robot = Robot.new(4, 4, "NORTH")
    robot.move
    robot.left
    assert_equal "4,4,WEST", robot.report
  end

  def test_invalid_move_c
    robot = Robot.new(0, 4, "NORTH")
    robot.move
    assert_equal "0,4,NORTH", robot.report
  end

  def test_invalid_move_d
    robot = Robot.new(4, 0, "EAST")
    robot.move
    assert_equal "4,0,EAST", robot.report
  end
end
