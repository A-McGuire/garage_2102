
require 'minitest/autorun'
require 'minitest/pride'
require './lib/car'
require './lib/owner'

class OwnerTest < MiniTest::Test

 def test_it_exists_with_attributes
    owner_1 = Owner.new('Regina George', 'Heiress')

    assert_instance_of Owner, owner_1
    
    assert_equal "Regina George", owner_1.name
    assert_equal "Heiress", owner_1.occupation
  end
  
  def test_no_cars
    owner_1 = Owner.new('Regina George', 'Heiress')
    
    assert_equal [], owner_1.cars
  end
  
  def test_buy_car
    owner_1 = Owner.new('Regina George', 'Heiress')

    owner_1.buy('1967 Green Ford Mustang')
    assert_equal 1, owner_1.cars.count #todo refactor for greater accuracy
  end
  
  def test_buy_more_cars
    owner_1 = Owner.new('Regina George', 'Heiress')

    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Silver BMW 3-Series')
    
    assert_equal 2, owner_1.cars.count #todo
  end
  
  def test_buy_vintage_car
    owner_1 = Owner.new('Regina George', 'Heiress')
    
    owner_1.buy('1967 Green Ford Mustang')
    owner_1.buy('2001 Silver BMW 3-Series')
    owner_1.buy('1963 Red Chevrolet Corvette')
    
    assert_equal 2, owner_1.vintage_cars.count #todo 
  end
end

