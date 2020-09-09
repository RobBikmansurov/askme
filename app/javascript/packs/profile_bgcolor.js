//window.addEventListener("load", function () {
document.addEventListener("DOMContentLoaded", function () {
    colorBg = document.getElementById("user_color");
    if (colorBg) {
        colorBg.addEventListener("input", function () {
                document.getElementById("profile").style.backgroundColor = event.target.value;

        }, false);
        element = document.getElementById("profile")
        element.style.backgroundColor = colorBg.value;
        element.style.color = "#FFFFFF";
        colorBg.select()
    }
}, false)
