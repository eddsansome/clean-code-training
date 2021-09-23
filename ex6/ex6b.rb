# frozen_string_literal: true

require 'test/unit'

class AddressStrategy
  def self.starts_with(address)
    address.split(",").first
  end
end

class AddressChecker
  def self.call(*args, &block)
    new(*args, &block).call
  end
  def initialize(address, strategy)
    @address = address
    @strategy = strategy
  end
  def call
    strategy.starts_with(address)
  end
  private
  attr_reader :address, :strategy
end



class TestAddressChecker < Test::Unit::TestCase
  def test_minsk
    assert_equal AddressChecker.call("Minsk, Belarus, The World", AddressStrategy), "Minsk"
  end
  def test_berlin
    assert_equal AddressChecker.call("Berlin, Germany, The World", AddressStrategy), "Berlin"
  end
end
