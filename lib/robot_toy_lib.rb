require_relative "../models/robot"
require_relative "../helper/helper"

class RobotToyLib
  # commands: command array
  # size_x: the table size for x dimension (default 5)
  # size_y: the table size for y dimension (default 5)
  def initialize(commands, size_x = 5, size_y = 5)
    @commands = commands
    @size_x = size_x
    @size_y = size_y
  end

  # processing user input commands and generate output

  def handle_commands
    begin
      # obtain params for valid first input and pass them to model
      if Helper.valid_place?(@commands.first)
        params = @commands.first.split(" ")[1].split(",")
        x = params[0].to_i
        y = params[1].to_i
        f = params[2]
        robot = Robot.new(x, y, f, @size_x, @size_y)
        # skip first commands and apply robot movement according to commands
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
