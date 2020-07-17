

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
		"myReview_write", "a", 
		"width=600, height=800, left=200, top=0"
	); 
}



// 주문조회 popup
function order_select_Pop() { 
	window.name = "parentForm";
	openWin = window.open("personal_que_select_order_nb", "childForm", "width=605, height=605, left=200, top=0"); 
}



