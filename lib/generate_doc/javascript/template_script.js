 
toggleResult = function(button) {
  form.find('.result').toggle('slow')
  
  if($(button).html() == 'Hide') {
    $(button).html('Show')
  } else {
    $(button).html('Hide')
  }
}

tryMe = function(method, url, button){
  form = $(button).parent()
  inputs = form.find('input')
  data = {}
  param_url = url
  inputs.each(function(index) {

    if(url.indexOf(':' + $(this).attr('name')) >= 0) {
      url=url.replace(':' + $(this).attr('name'), $(this).val()) 
    } else {
      data[$(this).attr('name')] = $(this).val()
    }
  })
 

  $.ajax({ type: method,
    url: url,
    data: data,
    dataType: 'json', 
    success: function( data, textStatus, jqXHR ){
     
      str = JSON.stringify(data, undefined, 4)
      form.find('.result').show()
      form.find('.requested_url').html(url)
      form.find('.response_box').html(str)
      form.find('.response_headers').html(jqXHR.getAllResponseHeaders())
      form.find('.response_code').html(jqXHR.status)
      
      if(form.find('button[onclick="toggleResult(this)"]').length==0) {
        form.append('<button onclick="toggleResult(this)" type="button">Hide</button>')
      }
    },
    error: function(data) {
      inputs.each(function(index){
        if(param_url.indexOf(':' + $(this).attr('name'))>=0) {
          input_name = 'input[name='+$(this).attr('name')+']'
          form.find(input_name).val('required').css('color', 'red')
        }
      })
      
      inputs.focus(function() {
        if($(this).val()=='required') {
          $(this).animate({color:'red'}, 100, function() {
            $(this).val('').css('color', 'black')
          })
        }
      })
      
    }
  })
  
}
   
