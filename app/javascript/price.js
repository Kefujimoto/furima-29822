window.addEventListener('load', function(){

  const itemprice =document.getElementById("item-price");

  const charge = document.getElementById("add-tax-price");
  
  const benefit = document.getElementById("profit");

  itemprice.addEventListener('input', function(){

  const total = itemprice.value;  
  
  const charge2 = Math.floor(total * 0.1);

  const benefit2 = Math.floor(total * 0.9);

  charge.innerHTML = charge2

  benefit.innerHTML = benefit2
  
  })
})