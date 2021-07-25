# frozen_string_literal: true

module Mixin
  def you_method
    InnerClass.new.call + 3
  end

  class InnerClass
    def call
      199
    end
end
