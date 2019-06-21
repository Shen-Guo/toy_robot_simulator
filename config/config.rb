class Config
  def self.direction_convertor
    { "EAST" => 0, "SOUTH" => 90, "WEST" => 180, "NORTH" => 270 }
  end

  def self.table_size_x
    5
  end

  def self.table_size_y
    5
  end

  def self.valid_commands
    ["MOVE", "LEFT", "RIGHT", "REPORT"]
  end

  def self.first_valid_command
    first_valid_command = /^place [0-4],[0-4],(north|south|east|west)$/i
  end

  def self.last_valid_command
    "REPORT"
  end
end
