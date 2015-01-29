module AdminHelper

  def get_state(hacker)
    begin
      return Phoner::Phone.parse(hacker.phone).area_code.to_i.to_region
    rescue
      return "??"
    end
  end

  def team(hacker)
    hacker.team.map{|h| h.name }.join(", ")
  end

  def phone(hacker)
    begin
      return Phoner::Phone.parse(hacker.phone).format(:us)
    rescue
      return hacker.phone
    end
  end

end
