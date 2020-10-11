window.addEventListener('load', function(){

  const itemprice = new FormData(document.getElementById("item-price"));
  const charge = document.getElementById("add-tax-price");
  const benefit = document.getElementById("profit");

  itemprice.addEventListener('oninput', function(){
    
  const total = itemprice.item-price;

  charge = total * 0.1;

  benefit = total * 0.9;
  
  add-tax-price.insertAdjacentHTML("afterend", HTML);
  profit.insertAdjacentHTML("afterend", HTML);
  })
})