# frozen_string_literal: true

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

  attr_reader :form

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

  private

  attr_reader :notifier

end

class Form
end

class TipForm < Form
  def initialize(amount:, discount_percentage:, tip_percentage:)
    @amount = amount
    @discount_percentage = discount_percentage
    @tip_percentage = tip_percentage
  end

  attr_reader :amount, :discount_percentage, :tip_percentage
end

class Notifier
  def call
    throw NotImplementedError
  end
end

class SmsNotifier < Notifier
  def call(text:)
    text
  end
end
