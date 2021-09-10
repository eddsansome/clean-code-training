class ObjectUnderTest
  def initialize(obj:, got:, want:)
    @object = obj
    @got = object.public_send(got[:method], *got[:args])
    @want = want
  end
  attr_reader :object, :got, :want
end
