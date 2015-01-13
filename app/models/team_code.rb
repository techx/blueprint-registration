class TeamCode

  def self.generate!
    SecureRandom.hex[0..10]
  end

  def self.is_valid?(code)
    /^[0-9a-f]{10}$/
  end

  def self.team_full?(code)
    return Hacker.where(:team_code => code).count >= 4
  end

  def self.validate_code(code)
    if not is_valid?(code)
      {valid: false, message: "Invalid team code."}
    elsif not team_full?(code)
      {valid: false, message: "Team is full."}
    else
      {valid: true, message: "Successfully joined team!"}
    end
  end

end
