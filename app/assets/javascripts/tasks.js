$(document).ready(function() {
	$(".mark-as-done").on("click", function(){
		if ($(this).val() === false) {
			$(this).val() === true;
		} else {
			$(this).val() === false;
		}
	})

	if ($(".mark-as-done").val() === true) {
		$(this).addClass(checkmark-done);
	}

	$(".btn, .destroy").on("click", function(){
		$(".edit, .form-control, .input-lg").removeData();
	})
	
});
