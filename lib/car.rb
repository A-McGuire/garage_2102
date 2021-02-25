class Car
  attr_reader :make,
              :model,
              :color,
              :year,
              :age

  def initialize(info)
    current_year = Time.new.year
    attributes = info[:description].split(" ")
    @color = attributes[0]
    @make = attributes[1]
    @model = attributes[2]
    @year = info[:year]
    @age = current_year - @year.to_i
  end
end