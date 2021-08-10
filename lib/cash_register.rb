require "pry"

class CashRegister
  attr_accessor :total, :discount, :items, :transaction_history

  def initialize(discount = 0)
    @total = 0
    @discount = discount.to_f
    @items = []
    @transaction_history = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      self.items << title
    end
    self.transaction_history << price * quantity
    self.total = self.transaction_history.sum
  end

  def apply_discount
    return "There is no discount to apply." if self.discount.zero?

    self.total = self.total * (1 - (self.discount / 100))
    "After the discount, the total comes to $#{self.total.to_i}."
  end

  def void_last_transaction
    self.transaction_history.pop
    self.items.pop
    self.total = transaction_history.sum
  end
end
