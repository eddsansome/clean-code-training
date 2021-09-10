# frozen_string_literal: true

require_relative 'sms_notifier'
require_relative 'tip_form'

class TipsProcessor
  TAX = 0.05

  def initialize(form:, notifier: SmsNotifier.new)
    @form = form
    @notifier = notifier
  end

  def call
    notifier.call(text: sms_text)
  end

  private

  attr_reader :form, :notifier

  def sms_text
    "You tips have been processed. Total amount is: #{total_amount}"
  end

  def total_amount
    form.amount + tax - discount + tip
  end

  def tax
    form.amount * TAX
  end

  def discount
    form.amount * (form.discount_percentage / 100.0)
  end

  def tip
    form.amount * (form.tip_percentage / 100.0)
  end
end
