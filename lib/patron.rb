class Patron

  attr_reader :name, :spending_money, :interests

  def initialize(name, money)

    @name = name
    @spending_money = money
    @interests = []
  end

  def add_interests(interest)
    @interests << interest
  end 

end
