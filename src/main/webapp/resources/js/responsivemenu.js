window.onload = function() {
        var menuHolder = document.querySelector("#header-menuholder");
        var menu = document.querySelector(".nav-links");

        menuHolder.addEventListener('click', () => {
             menu.classList.toggle('active')
        });
        
        var sidebarToggle = document.querySelector("#sidebar-toggle");
    	var wrapper = document.querySelector("#sidebar-div-wrapper");

    	sidebarToggle.addEventListener('click', () => {
        wrapper.classList.toggle('active')
    })
}