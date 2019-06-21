
require_relative "../config/config"
require_relative "../helper/helper"
require "minitest/autorun"

class HelperTest < MiniTest::Unit::TestCase
  def test_valid_place_command
    assert_equal true, Helper.valid_place?("PLACE 1,1,NORTH")
  end

  def test_place_command_negative_number
    assert_equal false, Helper.valid_place?("place -1,-1,north")
  end

  def test_place_command_out_boundary
    assert_equal false, Helper.valid_place?("place 6,1,north")
  end

  def test_valid_command
    assert_equal true, Helper.valid_command?("MOVE")
    assert_equal true, Helper.valid_command?("LEFT")
    assert_equal true, Helper.valid_command?("RIGHT")
    assert_equal true, Helper.valid_command?("REPORT")
  end

  def test_not_valid_command
    assert_equal false, Helper.valid_command?("abc")
    assert_equal false, Helper.valid_command?("   ")
    assert_equal false, Helper.valid_command?("123")
    assert_equal false, Helper.valid_command?("abc123")
  end

  def test_report_command
    assert_equal true, Helper.valid_report?("REPORT")
    assert_equal false, Helper.valid_report?("   ")
    assert_equal false, Helper.valid_report?("123")
    assert_equal false, Helper.valid_report?("abc123")
  end
end
