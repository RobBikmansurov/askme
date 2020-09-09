// Этот код добавляет обработчик события выдвигания формы при клике на кнопку
// «Задать вопрос», которая видна только, когда страница открыта в маленьком
// окне.

document.addEventListener("DOMContentLoaded", function () {
    let askButton = document.getElementById("ask-button");
    if (askButton) {
        askButton.addEventListener("click", (event) => {
            document.getElementById("ask-form").style.display = "block";
            askButton.style.display = 'none';
            event.preventDefault(); // остановить дальнейшую обработку события
        }, false)
    }
})
