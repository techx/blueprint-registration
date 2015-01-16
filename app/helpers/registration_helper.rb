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

  def graduation_years
    [
      [2015,2015],
      [2016,2016],
      [2017,2017],
      [2018,2018]
    ]
  end

  def genders
    [
      ["Prefer not to answer","no_answer"],
      ["Male","male"],
      ["Female","female"],
    ]
  end

end
