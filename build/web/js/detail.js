/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const decreaseButton = document.getElementById('decrease');
const increaseButton = document.getElementById('increase');
const quantityInput = document.getElementById('qty');
const price = document.getElementById('price-p');
increaseButton.addEventListener("click", function (event) {
    event.preventDefault();
    if (quantityInput.value < 1000) {
        quantityInput.value++;
        decreaseButton.removeAttribute('disabled');

        document.getElementById("price-quant").innerHTML = quantityInput.value * price.value;

    } else {
        increaseButton.setAttribute('disabled', true);
    }
});
decreaseButton.addEventListener("click", function (event) {
    event.preventDefault();
    if (quantityInput.value > 1) {
        quantityInput.value--;
        increaseButton.removeAttribute('disabled');

        document.getElementById("price-quant").innerHTML = quantityInput.value * price.value;
    } else {
        decreaseButton.setAttribute('disabled', true);
    }
});
quantityInput.addEventListener('change', () => {
    if(quantityInput.value <1){
        alert('Please enter a quantity greater than or equal to 1.');
    }
    if (quantityInput.value == 1) {
        decreaseButton.setAttribute('disabled', true);
        increaseButton.removeAttribute('disabled');
    } else if (quantityInput.value == 1000) {
        increaseButton.setAttribute('disabled', true);
        decreaseButton.removeAttribute('disabled');
    } else {
        decreaseButton.removeAttribute('disabled');
        increaseButton.removeAttribute('disabled');
    }
});

