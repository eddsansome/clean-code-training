require 'minitest/autorun'
module TableTest
  def test_cases
    @test_cases.each do |test_case|
      assert_equal test_case.got, test_case.want
    end
  end
end
