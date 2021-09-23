# frozen_string_literal: true

require 'test/unit'
require 'ostruct'

class UserNotifier
  def call(user, message, sender)
    sender.send(user.contact, message)
  end
end

class Sender
  def self.send(receiver, message)
    # do some coool stuff here
    "sending #{message} to #{receiver}"
  end
end

class EmailSender < Sender
end

class SmsSender < Sender
end

# notifier.call(user, "Hello World", SmsSender)

class TestUserNotifier < Test::Unit::TestCase
  def setup
    @notifier = UserNotifier.new
    @user = OpenStruct.new
  end

  def test_using_email
    @user.contact = 'test@test.com'
    assert_equal @notifier.call(@user, 'Hello World', EmailSender), 'sending Hello World to test@test.com'
  end

  def test_using_sms
    @user.contact = '07900 000000'
    assert_equal @notifier.call(@user, 'Hello World', SmsSender), 'sending Hello World to 07900 000000'
  end
end
