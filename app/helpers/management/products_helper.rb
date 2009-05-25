module Management::ProductsHelper
  
  def tags_for_autocomplete ru_title, object_name, property_name, collection
    fieldset = "<fieldset><legend>#{ru_title}</legend>"
    fieldset += "<script type=\"text/javascript\" charset=\"utf-8\">
      function collect#{object_name.pluralize.capitalize} (text,li) {			
  			collectInput(text,li,\"#{object_name}\", \"#{object_name.pluralize}\")
  		}
  		</script>"
    #fieldset += text_field_with_auto_complete :country, :title, {:class => "input"}, { :after_update_element => "collectCountries"} <= Original
    fieldset += text_field_with_auto_complete object_name.intern, property_name.intern, {:class => "input"}, { :after_update_element => "collect#{object_name.pluralize.capitalize}"}
    
    #fieldset += "<div id=\"countries_list\">" <= Original
    fieldset += "<div id=\"#{object_name.pluralize}_list\">"
    
    collection.each do |item|
      fieldset += "<div id='#{object_name}_in_list_#{item.id}'>"
      fieldset += "<input type=\"hidden\" name=\"product[#{object_name}_ids][]\" value=\"#{item.id}\">#{item[property_name.intern]} (<a href=\"#\" onclick=\"Element.remove('#{object_name}_in_list_#{item.id}'); return false;\">x</a>)"
      fieldset += "</div>"
    end
    
    fieldset += "</div><p></p>"
    fieldset += "<script type=\"text/javascript\" charset=\"utf-8\">observeInput(\"#{object_name}\", \"#{object_name.pluralize}\", \"#{property_name}\")</script>"
    fieldset += "</fieldset><p></p>"
    
  	fieldset
  end
  
end
