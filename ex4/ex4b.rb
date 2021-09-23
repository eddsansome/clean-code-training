require 'test/unit'

# https://en.wikipedia.org/wiki/De_Morgan%27s_laws
# not (A or B) = (not A) and (not B)
# not (A and B) = (not A) or (not B)

# < ActiveModel::Validator
class PhoneNumberFormatValidator
  def self.validate(record)
    record.errors[:phone_number] << 'invalid phone number format' unless record.valid?
  end
end

class PhoneRecord
  PHONE_REGEX = /^[0-9]{9}$/
  def initialize(pn)
    @phone_number = pn
  end

  def valid?
    return false if (phone_number =~ PHONE_REGEX).nil?

    true
  end

  def errors
    @errors ||= { phone_number: [] }
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
    assert_equal record.errors, { phone_number: ['invalid phone number format'] }
  end

  def test_validator_for_invalid_number
    record = PhoneRecord.new('hello')
    @pn.validate(record)
    assert_equal record.errors, { phone_number: ['invalid phone number format'] }
  end

  def test_validator_for_valid_number
    record = PhoneRecord.new('123456789')
    @pn.validate(record)
    assert_equal record.errors, { phone_number: [] }
  end
end
