
require_relative "./helper/helper"
require_relative "./lib/robot_toy_lib"

commands = []
is_first_line = true

puts "please enter command for robot"
loop do
  command = gets.upcase.strip.chomp
  if is_first_line
    if Helper.valid_place?(command)
      commands << command
      is_first_line = false
    else
      puts "A valid place command is required for first command"
    end
  else
    if Helper.valid_command?(command)
      commands << command
    else
      puts "command not valid for robot toy"
    end
  end
  break if Helper.valid_report?(command)
end
robot_toy = RobotToyLib.new(commands)
puts robot_toy.handle_commands
