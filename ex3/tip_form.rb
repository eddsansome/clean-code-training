class Form; end

class TipForm < Form
  def initialize(amount:, discount_percentage:, tip_percentage:)
    @amount = amount
    @discount_percentage = discount_percentage
    @tip_percentage = tip_percentage
  end

  attr_reader :amount, :discount_percentage, :tip_percentage
end
