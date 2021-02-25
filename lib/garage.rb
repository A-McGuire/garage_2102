class Garage
  attr_reader :name,
              :customers
  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def all_cars
    customers.flat_map do |customer|
      customer.cars
    end
  end

  def cars_by_make
    all_cars.group_by do |car|
      car.make
    end
  end

  def oldest_cars
    oldest_cars = all_cars.sort_by do |car|
      car.age
    end.reverse #todo there may be a better enum that includes reverse
    oldest_cars[0..2] 
  end
end