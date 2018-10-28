$(function() {
	$(".add_fields").click(function(){
		$(".btn-primary").prop("disabled", false);
		if ($(".nested-fields").length == 24) {
			$(this).hide();
		}
	})
});