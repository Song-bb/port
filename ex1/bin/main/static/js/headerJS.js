

// header_nav scroll
window.onscroll = function() {myFunction()};
    var header = document.getElementById("header_nav_wrap");
    var sticky = header.offsetTop;

    function myFunction() {
    if (window.pageYOffset > sticky) {
        header.classList.add("sticky");
    } else {
        header.classList.remove("sticky");
    }
}