class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    # NOTE: This was a bit hard to figure out but I guess you just have to know
    # ahead of time that you really need to use this entire transaction later on
    # in order to use it properly:
    self.last_transaction = quantity * price
    self.total += self.last_transaction

    if quantity > 0
      quantity.times do
        |i| self.items << title
      end
    else
      self.items << title
    end

  end

  def apply_discount()
    # Original attempt:
    # self.total = self.total * discount
    if self.discount != 0
      discount_percent_version = (100.0 - self.discount.to_f) / 100
      self.total = (self.total * discount_percent_version).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction()
    self.total -= self.last_transaction
  end

end
