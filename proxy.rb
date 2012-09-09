
class Proxy

  def initialize(target_object)
    @call_counter = Hash.new
    @object = target_object
  end

  def method_missing(meth, *args, &block)
    if @object.respond_to?(meth.to_s)

      update_call_counter(meth)
      @object.__send__(meth, *args, &block)

    else
      super
    end
  end
 
  def respond_to?(meth)
    if @object.respond_to?(meth)
    else
      super
    end
  end 

  def called?(method_name)
    messages.include?(method_name.to_sym)
  end
  
  def messages
    @call_counter.keys
  end

  def number_of_times_called(meth)
    if @call_counter[meth.to_sym]
      @call_counter[meth.to_sym]
    else
      0
    end
  end

  protected

  def update_call_counter(meth)
    if @call_counter[meth.to_sym].nil?
      @call_counter[meth.to_sym] = 1
    else
      @call_counter[meth.to_sym] += 1
    end 
  end

end
