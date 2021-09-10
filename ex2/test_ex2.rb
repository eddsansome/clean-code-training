require 'minitest/autorun'
require_relative 'ex2'
require_relative '../eddspec/eddspec'

class TestExercise2 < Minitest::Test
  include TableTest
  def setup
    @test_cases = [
      ObjectUnderTest.new(obj: Tipper.new(amount: 100, discount_percentage: 10, tip_percentage: 10),
                          got: { method: :total, args: [] },
                          want: 105)
    ]
  end
end
