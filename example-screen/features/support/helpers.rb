module Helpers

  def page klass
    klass.new
  end
  
end

World(Helpers)
