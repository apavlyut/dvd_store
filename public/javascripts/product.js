
function collectInput(text, li, singular, plural) {
	$(plural+"_list").insert("<div id='"+singular+"_in_list_"+li.id+"'><input type=hidden name='product["+singular+"_ids][]' value='"+li.id+"'>"+text.value+"(<a href=# onclick=\"Element.remove('"+singular+"_in_list_"+li.id+"'); return false;\">x</a>)</div>", plural+"_list");
	text.value = ""
}


function observeInput(singular, plural, property_name) {
	$(singular+"_"+property_name).observe('keypress', function(event){
	    if(event.keyCode == Event.KEY_RETURN) {
			text = $(singular+"_"+property_name).value
			if (text != "") {
	        	Event.stop(event);
				rand_id = Math.random()*10;
				$(plural+"_list").insert("<div id='"+singular+"_in_list_"+rand_id+"'><input type=hidden name='new_"+plural+"[]' value='"+text+"'>"+text+"(<a href=# onclick=\"Element.remove('"+singular+"_in_list_"+rand_id+"'); return false;\">x</a>)</div>", plural+"_list");
				$(singular+"_"+property_name).value = ""
				}
			else {
				alert("Пошел нахуй");
				Event.stop(event);
			}
	    }
	});
}

function captureProducer(text, li) {
	$("product_producer_id").value = li.id;
}

function captureFilmStudio(text, li) {
	$("product_film_studio_id").value = li.id;
}

