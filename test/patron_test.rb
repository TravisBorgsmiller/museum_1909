require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/exhibit'
require './lib/patron'

class PatronTest < Minitest::Test

  def test_does_patron_exist

    bob = Patron.new("Bob", 20)
    assert_instance_of Patron, bob
  end

  def test_does_patron_initialize

    bob = Patron.new("Bob", 20)
    assert_equal "Bob", bob.name
    assert_equal 20, bob.spending_money
  end

  def test_does_add_interests

    bob = Patron.new("Bob", 20)
    assert_equal [], bob.interests
    bob.add_interests("Dead Sea Scrolls")
    assert_equal ["Dead Sea Scrolls"], bob.interests
    bob.add_interests("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], bob.interests
  end

end
