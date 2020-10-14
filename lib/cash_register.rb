require"pry"
class CashRegister
  attr_accessor :total, :discount, :items, :last_perchase
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += price * quantity
    quantity.times { @items << title}
    self.last_perchase = price * quantity 
  end

  def apply_discount
    # binding.pry
    if discount != 0
      self.total = (@total.to_f - (@total.to_f * (@discount.to_f / 100.0))).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_perchase
  end
end

