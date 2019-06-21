require_relative "../config/config"

class Helper
  def self.valid_place?(command)
    !!(Config.first_valid_command =~ command)
  end

  def self.valid_command?(command)
    Config.valid_commands.include?(command) ? true : false
  end

  def self.valid_report?(command)
    Config.last_valid_command == command
  end
end
