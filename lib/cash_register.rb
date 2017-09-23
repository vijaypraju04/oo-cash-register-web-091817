class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction, :last_item
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = [];
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    i = 0
    while i < quantity
    @items << title
    i += 1
    end
    self.last_transaction = price * quantity
    self.last_item = title
  end

  def apply_discount
    if discount != 0
    self.total = (total * ((100.0 - discount.to_f)/100)).to_i
    "After the discount, the total comes to $#{self.total}."
    else
    "There is no discount to apply."
  end
end

  def void_last_transaction
    self.total -= self.last_transaction
    self.items.slice(-1)
end
end

cashregister = CashRegister.new(15)
cashregister.add_item("Banana", 3, 5)
cashregister.add_item("Apple", 5, 2)
