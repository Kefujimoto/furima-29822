window.addEventListener('load', function(){
  const itemprice = document.getElementById("item-price")
  const charge = document.getElementById("add-tax-price")
  const benefit = document.getElementById("profit")

  itemprice.addEventListener('oninput', function(){
    
  const allprice = itemprice.text_field;

  const charge = allprice * 0.1;

  const benefit = allprice * 0.9;

  })
})