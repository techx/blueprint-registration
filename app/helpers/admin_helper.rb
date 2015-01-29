module AdminHelper

  def get_state(hacker)
    begin
      return Phoner::Phone.parse(hacker.phone).area_code.to_i.to_region
    rescue
      return "??"
    end
  end

end
