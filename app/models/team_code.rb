class TeamCode

  def self.generate!
    SecureRandom.hex[0..10]
  end

  def self.is_valid?(code)
    /^[0-9a-f]{10}$/
  end

end
