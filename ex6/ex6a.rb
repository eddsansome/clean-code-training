# frozen_string_literal: true

require 'test/unit'

class Conference
  def self.prepare_for_conference(user_type)
    { attendee: :register, speaker: :wake_up, matz: :make_tea }[user_type]
  end
end

class TestConference < Test::Unit::TestCase
  def test_attendee
    assert_equal Conference.prepare_for_conference(:attendee), :register
  end

  def test_speaker
    assert_equal Conference.prepare_for_conference(:speaker), :wake_up
  end

  def test_matz
    assert_equal Conference.prepare_for_conference(:matz), :make_tea
  end
end
