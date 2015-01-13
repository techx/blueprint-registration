module RegistrationHelper

  def interests
    ["Node.js", "Ruby On Rails", "Python", "HTML, CSS", "Design", "iOS", "Android",]
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

end
