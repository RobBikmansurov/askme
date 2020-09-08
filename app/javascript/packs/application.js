/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// yarn add @rails/ujs
require("@rails/ujs").start()

// Этот код добавляет обработчик события выдвигания формы при клике на кнопку
// «Задать вопрос», которая видна только, когда страница открыта в маленьком
// окне.
//$(function(){
//    $('#ask-button').click(function(){
//        $('#ask-form').slideToggle(300);
//        return false;
//    });
//});

var formBGColor = 0;
window.addEventListener("load", colorizer, false);

function colorizer() {
    colorBg = document.getElementById("user_color");
    if (colorBg) {
        colorBg.addEventListener("input", updateColorBg, false);
        element = document.getElementById("profile")
        element.style.backgroundColor = colorBg.value;
        element.style.color = "#FFFFFF";
        colorBg.select()
    }
}

function updateColorBg(event) {
    document.getElementById("profile").style.backgroundColor = event.target.value;
}

document.addEventListener('DOMContentLoaded', function () {
    let askButton = document.getElementById('ask-button');
    if (askButton) {
        askButton.addEventListener('click', (event) => {
            document.getElementById('ask-form').style.display = 'block';
            event.preventDefault(); // остановить дальнейшую обработку события
        }, false)
    }
})
