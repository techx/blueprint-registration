module RegistrationHelper

  def interests
    ["Node.js", "Ruby On Rails", "Python", "HTML, CSS", "Design", "iOS", "Android", "API Usage"]
  end

  def days
    [
      {
          title: "Learn: Feb 21st",
          value: 0
      },
      {
          title: "Hack: Feb 22nd",
          value: 1
      }
    ]
  end

  def shirt_sizes
    ["S", "M", "L", "XL", "XXL"]
  end

  def graduation_years(mentor = false)
    years = [
      [2015,2015],
      [2016,2016],
      [2017,2017],
      [2018,2018]
    ]
    years.insert(0, ["N/A", 0]) if mentor
    years
  end

  def genders
    [
      ["",nil],
      ["Prefer not to answer","no_answer"],
      ["Male","male"],
      ["Female","female"],
    ]
  end

  def laptop_types
    [
      ["",nil],
      ["Mac OS", 0],
      ["Windows", 1],
      ["Linux", 2],
      ["I have no laptop that I can bring", 3]
    ]
  end

  def phone_types
    [
      ["",nil],
      ["iPhone", 0],
      ["Android", 1],
      ["Other", 2],
      ["I have no cell phone", 3]
    ]
  end

  def booleans
    [
      ["",nil],
      ["Yes", true],
      ["No", false]
    ]
  end

  def tracks
    [
      ["",nil],
      ["iOS Development", 0],
      ["Android Development", 1],
      ["Web Development", 2]
    ]
  end

  def orientations
    [
      ["",nil],
      ["February 11th @ 6:00 PM in 4-149", 1],
      ["February 12th @ 6:00 PM in 3-442", 2],
      ["I do not live near MIT", 0]
    ]
  end

  def experience_levels
    [
      ["",nil],
      ["Absolutely none", 0],
      ["Some (AP CS or equivalent)", 1],
      ["Lots (hackathon experience, coding competitions, etc.)", 2]
    ]
  end

end
