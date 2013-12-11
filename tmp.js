
tryMe = function(method, url, data_div){ 
		inputs = $(data_div).all('input') $.ajax({ type: method,
		url: url,
		data: {
			access_token: 'token'
			param1: 'val2'
		}
		success: function(data){
			$('#update_input').value(data);
		}
})


}
