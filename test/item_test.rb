require "test/unit"
require "../app/models/trade/item"
require "../app/models/trade/user"

class ItemTest < Test::Unit::TestCase

  def test_create_item
    item = Item.new("book", 25)
    assert(item.name == "book")
    assert(item.price == 25)
    assert(item.state == :inactive)
    assert(item.owner.nil?)
  end

  def test_to_s
    item = Item.new("book", 25)
    user = User.new("Peter")
    item.owner = user
    puts item.to_s
    assert(item.to_s == "book (25) with state inactive owned by Peter")
  end

  def test_by_id
    user = User.new("Peter")
    user.add_item(Item.new("book", 25))
    user.add_item(Item.new("book2", 50))
    assert(Item.by_id(user.items[0].id) == user.items[0])
    assert(Item.by_id(user.items[1].id) == user.items[1])
    assert(Item.by_id(user.items[0].id) != user.items[1])
  end

end