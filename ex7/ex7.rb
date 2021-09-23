# frozen_string_literal: true

require 'test/unit'

module Mixin
  class Klass
    def you_method
      something + 3
    end

    private
    def something
      199
    end
  end
end

class TestMixins < Test::Unit::TestCase

  def setup
    @klass = Mixin::Klass.new
  end

  def test_behaviour
    assert_equal @klass.you_method, 202
  end
end
