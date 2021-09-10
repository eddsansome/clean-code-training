# frozen_string_literal: true

class Tipper
  TAX_RATE = 0.05

  def initialize(amount:, tip_percentage:, discount_percentage: 0)
    @amount = amount
    @discount_percentage = discount_percentage
    @tip_percentage = tip_percentage
  end

  def total
    amount + tax - discount + tip
  end

  private

  def tax
    amount * TAX_RATE
  end

  def discount
    amount * (discount_percentage / 100.0)
  end

  def tip
    amount * (tip_percentage / 100.0)
  end

  attr_reader :amount, :discount_percentage, :tip_percentage
end
