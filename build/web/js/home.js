/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function loadMore() {
    var amount = document.getElementsByClassName("count").length;
    $.ajax({
        url: "/Assignment/loadMore",
        type: "get", //send it through get method
        data: {
            exits: amount
        },
        success: function (data) {
            var row = document.getElementById("content");
            row.innerHTML += data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}

function searchByName(param) {
    var txtSearch = param.value;
    $.ajax({
        url: "/Assignment/search",
        type: "get", //send it through get method
        data: {
            txt: txtSearch
        },
        success: function (data) {
            var row = document.getElementById("content");
            row.innerHTML = data;
        },
        error: function (xhr) {
            //Do Something to handle error
        }
    });
}