require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!
require './lib/exhibit'
require './lib/patron'
require './lib/museum'

class MuseumTest < Minitest::Test

  def test_does_musuem_exist

    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_instance_of Museum, dmns
  end

  def test_does_it_initialize

    dmns = Museum.new("Denver Museum of Nature and Science")
    assert_equal "Denver Museum of Nature and Science", dmns.name
  end

  def test_does_it_add_exhibits

    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    assert_equal [], dmns.exhibits
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    assert_equal [gems_and_minerals, dead_sea_scrolls, imax], dmns.exhibits
  end

  def test_does_museum_recommend_exhibits

    dmns = Museum.new("Denver Museum of Nature and Science")
    bob = Patron.new("Bob", 20)
    assert_equal [], dmns.recommend_exhibits(bob)
    bob.add_interests("Dead Sea Scrolls")
    bob.add_interests("Gems and Minerals")
    assert_equal ["Dead Sea Scrolls", "Gems and Minerals"], dmns.recommend_exhibits(bob)
    sally = Patron.new("Sally", 20)
    assert_equal [], dmns.recommend_exhibits(sally)
    sally.add_interests("IMAX")
    assert_equal ["IMAX"], dmns.recommend_exhibits(sally)
  end

  def test_does_museum_admit_patrons

    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    assert_equal [], dmns.patrons
    bob = Patron.new("Bob", 20)
    bob.add_interests("Dead Sea Scrolls")
    bob.add_interests("Gems and Minerals")
    sally = Patron.new("Sally", 20)
    sally.add_interests("Dead Sea Scrolls")
    dmns.admit(bob)
    dmns.admit(sally)
    assert_equal [bob, sally], dmns.patrons
  end

  def test_does_museum_return_patrons_by_exhibit_interest

    dmns = Museum.new("Denver Museum of Nature and Science")
    gems_and_minerals = Exhibit.new("Gems and Minerals", 0)
    dead_sea_scrolls = Exhibit.new("Dead Sea Scrolls", 10)
    imax = Exhibit.new("IMAX", 15)
    dmns.add_exhibit(gems_and_minerals)
    dmns.add_exhibit(dead_sea_scrolls)
    dmns.add_exhibit(imax)
    bob = Patron.new("Bob", 20)
    bob.add_interests("Dead Sea Scrolls")
    bob.add_interests("Gems and Minerals")
    sally = Patron.new("Sally", 20)
    sally.add_interests("Dead Sea Scrolls")
    dmns.admit(bob)
    dmns.admit(sally)
    assert_equal {"Gems and Minerals" => [bob], "Dead Sea Scrolls" => [bob, sally], "IMAX" => []}, dmns.patrons_by_exhibit_interest
  end

end
