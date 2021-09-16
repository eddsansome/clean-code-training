# frozen_string_literal: true

require 'test/unit'

# https://en.wikipedia.org/wiki/De_Morgan%27s_laws
# not (A or B) = (not A) and (not B)
# not (A and B) = (not A) or (not B)

class PhoneNumberFormatValidator # < ActiveModel::Validator
  PHONE_REGEX = /^[0-9]{9}$/

  def self.validate(record)
    if record.phone_number.nil? || (record.phone_number =~ PHONE_REGEX).nil?
      record.errors[:phone_number] << "invalid phone number format"
    end
  end
end

  class PhoneRecord
    def initialize(pn)
      @phone_number = pn
    end
    def errors
      @errors ||= {phone_number: []}
    end
    attr_reader :phone_number

  end
class TestPhoneNumber < Test::Unit::TestCase

  def setup
    @pn = PhoneNumberFormatValidator
  end

  def test_validator_for_nil
    record = PhoneRecord.new(nil)
    @pn.validate(record)
    assert_equal record.errors, {phone_number: ["invalid phone number format"]}
  end
  def test_validator_for_invalid_number
    record = PhoneRecord.new("hello")
    @pn.validate(record)
    assert_equal record.errors, {phone_number: ["invalid phone number format"]}
  end
  def test_validator_for_valid_number
    record = PhoneRecord.new('123456789')
    @pn.validate(record)
    assert_equal record.errors, {phone_number: []}
  end

end
