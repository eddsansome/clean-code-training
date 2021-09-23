class Params
  def initialize(obj)
    @params = obj
  end

  def require(sym)
    raise "require #{sym}" unless @params.keys.include?(sym)

    self
  end

  def permit(*args)
    new_hash = {}
    args.each do |arg|
      new_hash[arg] = @params[arg]
    end
    new_hash
  end

  private

  attr_reader :params
end

class ApplicationController
  def initialize(params)
    @params = params
  end

  private

  def render(template)
    "rendering #{template}"
  end

  def redirect_to(path)
    "redirected to user #{path}"
  end
  attr_reader :params
end

class User
  def initialize(data)
    @attributes = data
  end

  def save
    true
  end
  attr_reader :attributes
end
