module Deppkind      
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def deppkind_auto_complete_for(object, method, other_class_name = nil, kind = nil, options = {} )
      define_method("auto_complete_for_#{object}_#{method}") do

        find_options = { 
          :conditions => [ "LOWER(#{method}) LIKE LOWER(?)", '%' + params[object][method].downcase + '%' ], 
          :order => "#{method} ASC",
          :limit => 10 }.merge!(options)

        if other_class_name
          class_object = other_class_name
        else
          class_object = object
        end  

        @items = class_object.to_s.camelize.constantize.find(:all, find_options)
        
        render :inline => "<%= auto_complete_result @items, '#{method}' %>"
      end
    end
  end
  
end