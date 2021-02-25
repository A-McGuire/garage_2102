require 'minitest/autorun'
require 'minitest/pride'
require './lib/garage'
require './lib/car'
require './lib/owner'

class GarageTest < MiniTest::Test

 def test_it_exists_with_attributes
    garage = Garage.new('Totally Safe Parking')
    assert_instance_of Garage, garage
    
    assert_equal 'Totally Safe Parking', garage.name 
  end
  
  def test_add_customers
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_2 = Owner.new('Glen Coco', 'Unknown')
    
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')
    garage.add_customer(owner_1)
    garage.add_customer(owner_2)
    
    assert_equal [owner_1, owner_2], garage.customers
  end
end



# garage.all_cars
# # => [mustang

# garage.cars_by_makeford escape
# # => {
# #   "Ford" => [#<Car:0x00007fcb13bd22d0...>, #<Car:0x00007fb898081850...>],
# #   "Chevrolet" => [#<Car:0x00ownder_2
# #   "Volvo" => [#<Car:0x00007fb5ef98b118...>]
# #    }

# garage.oldest_cars
# # => [#<Car:0x00007fcb13bd22d0...>, #<Car:0x00007fb898081850...>, #<Car:0x00007fb898081850...>] 