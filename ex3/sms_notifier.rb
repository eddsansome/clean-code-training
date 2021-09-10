class Notifier
  def call
    throw NotImplementedError
  end
end

class SmsNotifier < Notifier
  def call(text:)
    # make some funky network call
    text
  end
end
