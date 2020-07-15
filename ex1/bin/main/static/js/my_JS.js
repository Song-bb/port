

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

//togle(detail_page)

$(document).ready(function(){
    $('.QNA_show').click(function(){
        $(this).next('.QNA_hide').toggle();
    });
});


//togle(myReview)

$(document).ready(function(){
    $('.show').click(function(){
        $(this).next('.hide').toggle();
    });
});



//review popup

function reviewPop() { 
	window.open(
		"myCart", "a", 
		"width=600, height=800, left=200, top=0"
	); 
}