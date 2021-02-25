class Owner
  attr_reader :name,
              :occupation
  def initialize(name, occupation)
    @name = name
    @occupation = occupation
  end
end