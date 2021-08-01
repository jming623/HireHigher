 window.onload = function(){

    var sidebarToggle = document.querySelector("#sidebar-toggle");
    var wrapper = document.querySelector("#sidebar-div-wrapper");

    sidebarToggle.addEventListener('click', () => {
         wrapper.classList.toggle('active')
    })

}