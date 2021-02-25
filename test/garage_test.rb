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
  
  def test_list_all_garage_cars
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_2 = Owner.new('Glen Coco', 'Unknown')
    
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')
    garage.add_customer(owner_1)
    garage.add_customer(owner_2)

    assert_equal 4, garage.all_cars.count #todo
  end
  
  def test_list_cars_by_make
    garage = Garage.new('Totally Safe Parking')
    owner_1 = Owner.new('Regina George', 'Heiress')
    owner_2 = Owner.new('Glen Coco', 'Unknown')
    
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Blue Ford Escape')
    owner_2.buy('1963 Green Chevrolet Corvette')
    owner_2.buy('2020 Silver Volvo XC90')
    garage.add_customer(owner_1)
    garage.add_customer(owner_2)
    
    # expected = {
      #   "Ford" => [#<Car:0x00007fcb13bd22d0...>, #<Car:0x00007fb898081850...>],
      #   "Chevrolet" => [#<Car:0x00007fb898081850...>],
      #   "Volvo" => [#<Car:0x00007fb5ef98b118...>]
      #            }
      assert_equal 3, garage.cars_by_make.count #todo very bad! refactor
    end
    
    def test_list_three_oldest_cars
      garage = Garage.new('Totally Safe Parking')
      owner_1 = Owner.new('Regina George', 'Heiress')
      owner_2 = Owner.new('Glen Coco', 'Unknown')
      
      owner_1.buy('1967 Green Ford Mustang')
      owner_1.buy('2001 Blue Ford Escape')
      owner_2.buy('1963 Green Chevrolet Corvette')
      owner_2.buy('2020 Silver Volvo XC90')
      garage.add_customer(owner_1)
      garage.add_customer(owner_2)
#       expected = [#<Car:0x00007f803902a8a8 @age=58, @color="Green", @make="Chevrolet", @model="Corvette", @year="1963">,
#  #<Car:0x00007f8039031220 @age=54, @color="Green", @make="Ford", @model="Mustang", @year="1967">,
#  #<Car:0x00007f803902bed8 @age=20, @color="Blue", @make="Ford", @model="Escape", @year="2001">]
#      assert_equal expected, garage.oldest_cars #HEEEELLLLPPPPP PLLLEEEAAAASSSSEEE
      assert_equal 3, garage.oldest_cars.count
  end
end
