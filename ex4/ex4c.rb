# frozen_string_literal: true

require 'test/unit'
require 'ostruct'

class Benefit
  def initialize(employee)
    @employee = employee
  end

  def rate
    return 0.5 if employee.on_vacation && employee.length_of_vacation > 1

    1
  end

  private

  attr_reader :employee
end

class TestBenefit < Test::Unit::TestCase
  def setup
    @employee = OpenStruct.new
    @employee.on_vacation = true
  end

  def test_rate_with_long_holiday
    @employee.length_of_vacation = 3
    benefit = Benefit.new(@employee)
    assert_equal 0.5, benefit.rate
  end

  def test_rate_with_short_holiday
    @employee.length_of_vacation = 0.5
    benefit = Benefit.new(@employee)
    assert_equal 1, benefit.rate
  end

  def test_rate_with_no_holiday
    @employee.on_vacation = false
    benefit = Benefit.new(@employee)
    assert_equal 1, benefit.rate
  end
end
