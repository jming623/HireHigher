	$(document).ready(function() {
		$(".main-search-default").click(function() {
			$(".main-search-menu").toggleClass("active");
		});

		$(".main-search-menu li").click(function() {
			var selected = $(this).text();
			$(".main-search-default").text(selected);
		});
	});