function calc() {
  const price = document.getElementById("item-price");

  price.addEventListener("keyup", (e) => {
    const taxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");
    tax = Math.floor(price.value / 10);

    taxPrice.innerHTML = tax;
    profit.innerHTML = price.value - tax;
  });
}

window.addEventListener("load", calc);
