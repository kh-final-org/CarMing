$(document).ready(function(){
	$(document).ajaxStart(function(){console.log("ajaxStart");});
	$("#insertCart_btn").click(function(){
		var cAmount = $("#sst").val();
		var pAmount = $("#pAmount").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		var pNo = $("#pNo").val();
		var pCategoryNo = $("#pCategoryNo").val();

		var data = {
					cAmount : cAmount,
					pAmount : pAmount,
					startDate : startDate,
					endDate : endDate,
					pNo : pNo,
					pCategoryNo : pCategoryNo
		};
		
		$.ajax({
			url: "cart.do",
			type: "post",
			data: data,
			success: function(result){
				if(result == 1){
					alert("장바구니에 담겼습니다.");
					location.href = "cartlist.do";
					$("#sst").val("1");
				} else{
					alert("회원만 사용할 수 있습니다.");
					$("#sst").val("1");
				}
			},
			error: function(){
				alert("장바구니 담기에 실패하였습니다.");
			}
		});		
	});
	
	$("#endDate").datepicker({minDate: 0});
});
