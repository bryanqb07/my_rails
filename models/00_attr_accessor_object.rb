class AttrAccessorObject
  def self.my_attr_accessor(*names)
    names.each do |name|
      ivar = "@#{name}"
      define_method(name) do 
        instance_variable_get(ivar)
      end
      define_method("#{name}=") do |val|
        instance_variable_set(ivar, val)
      end
    end
  end
end
