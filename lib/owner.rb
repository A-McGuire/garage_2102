require './lib/car'
class Owner
  attr_reader :name,
              :occupation
  def initialize(name, occupation)
    @name = name
    @occupation = occupation
    @cars = []
  end

  def cars
    @cars
  end

  def buy(car) # todo can probably clean this up
    info_hash = {}
    info_arr = car.split
    info_hash[:year] = info_arr.shift
    info_hash[:description] = info_arr.join(" ")
    @cars << Car.new(info_hash)
  end
  
  def vintage_cars
    @cars.find_all do |car|
      car.age > 24
    end
  end
end