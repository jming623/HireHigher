window.onload = function() {
        var menuHolder = document.querySelector("#header-menuholder");
        var menu = document.querySelector(".nav-links");

        menuHolder.addEventListener('click', () => {
             menu.classList.toggle('active')
        });
}