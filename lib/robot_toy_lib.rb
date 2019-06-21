require_relative "../models/robot"
require_relative "../helper/helper"

class RobotToyLib
  def initialize(commands)
    @commands = commands
  end

  def handle_commands
    begin
      if Helper.valid_place?(@commands.first)
        params = @commands.first.split(" ")[1].split(",")
        x = params[0].to_i
        y = params[1].to_i
        f = params[2]
        robot = Robot.new(x, y, f)
        @commands[1..-1].each do |command|
          if Helper.valid_command?(command)
            case command
            when "MOVE"
              robot.move
            when "LEFT"
              robot.left
            when "RIGHT"
              robot.right
            when "REPORT"
              break
            end
          end
        end
      end
      robot.report
    rescue => ex
      puts "error: #{ex.message}"
    end
  end
end
