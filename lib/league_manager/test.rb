class Test
  attr_accessor :name
  def initialize(attrib, value)
    self.class.send(:attr_accessor, attrib) unless self.public_methods.include? attrib.to_sym
    self.send("#{attrib}=", value)
  end

  def name
    @name || []
  end
end