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
