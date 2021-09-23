require 'test/unit'
require_relative 'ex3'

class TestExercise3Form < Test::Unit::TestCase
  def setup
    @form = TipForm.new(amount: 100, discount_percentage: 10, tip_percentage: 10)
  end

  def test_useless
    assert_equal form.amount, 100
    assert_equal form.discount_percentage, 10
    assert_equal form.tip_percentage, 10
  end

  private

  attr_reader :form
end

class TestExercise3TipProcessor < Test::Unit::TestCase
  def setup
    @tip_processor = TipsProcessor.new(form: TipForm.new(amount: 100, discount_percentage: 10, tip_percentage: 10))
  end

  def test_amount
    assert_equal @tip_processor.call, 'You tips have been processed. Total amount is: 105.0'
  end
end
