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

require 'test/unit'
class TipperTest < Test::Unit::TestCase
  def test_tip_amount
    tipper = Tipper.new(amount: 100, tip_percentage: 10, discount_percentage: 10)
    assert_equal tipper.total, 105.0
  end
end
