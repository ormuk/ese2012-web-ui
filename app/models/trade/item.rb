class Item
  attr_accessor :name, :price, :owner, :state
  attr_reader :id
  @@items = []
  @@item_count = 0

  def initialize(name, price)
    self.name = name
    self.price = price
    self.state = :inactive
    @@items << self unless @@items.include? self
    @id = @@item_count
    @@item_count += 1
  end

  def to_s
    "#{self.name} (#{self.price}) with state #{self.state} owned by #{self.owner.name}"
  end

  def self.by_id id
    @@items.detect {|item| item.id == id}
  end

end