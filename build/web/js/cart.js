/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


const increaseButton = document.querySelectorAll('.increase');
const decreaseButton = document.querySelectorAll('.decrease');
const quantity = document.getElementsByName('quantity');
const shipOption = document.querySelector("select");
let shipPrice = 0;
increaseButton.forEach((item, index) => {
    item.addEventListener("click", (event) => {
        let sum = 0;

        quantity.forEach((item, index) => {
            const price = document.getElementsByName('price')[index];
            sum += parseFloat(item.value) * parseInt(price.textContent);
        });
        event.preventDefault();
        const section = item.closest('section');
        const decreaseb = decreaseButton[index];
        decreaseb.removeAttribute('disabled');
        const quantityInput = document.getElementsByName('quantity')[index];
        quantityInput.value++;
        const price = document.getElementsByName('price')[index];
        sum += parseFloat(price.textContent);

        document.getElementById("total-price").innerHTML = "Price: " + sum + " VND";
    });
});
decreaseButton.forEach((item, index) => {
    item.addEventListener("click", (event) => {
        let sum = 0;

        quantity.forEach((item, index) => {
            const price = document.getElementsByName('price')[index];
            sum += parseFloat(item.value) * parseInt(price.textContent);
        });
        event.preventDefault();
        const quantityInput = document.getElementsByName('quantity')[index];
        if (quantityInput.value > 1) {
            quantityInput.value--;
            const price = document.getElementsByName('price')[index];
            sum -= parseFloat(price.textContent);
            document.getElementById("total-price").innerHTML = "Price: " + sum + " VND";
        } else {
            item.setAttribute('disabled', true);
        }
    });
});
shipOption.addEventListener("change", () => {
    let sum = 0;

    quantity.forEach((item, index) => {
        const price = document.getElementsByName('price')[index];
        sum += parseFloat(item.value) * parseInt(price.textContent);
    });
    if (shipOption.value == 1) {
        shipPrice = 40;
    }
    if (shipOption.value == 2) {
        shipPrice = 30;
    }
    if (shipOption.value == 3) {
        shipPrice = 20;
    }
    document.getElementById("result").innerHTML = sum + shipPrice + " VND";
})