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
	
	/* 카테고리별 게시물 보여주기 */
	//1. 텐트 / 타프
	$("#tent").click(function(){
		
		var pCategoryNo = $(".pCategoryNo");
		var data_pCategoryNo = $(this).attr("data-pCategoryNo");		
		console.log("카테고리 번호: "+pCategoryNo);
		console.log("data-카테고리번호: "+data_pCategoryNo);
		
		var product_div = $(".col-lg-4 col-md-6");
		
		for(i=0; i<product_div.length; i++){
			cNo = pCategoryNo[i].val();
			alert(cNo);
			if(cNo == data_pCategoryNo){
				product_div[i].style.display = "";
			} else{
				product_div[i].style.display = "none";
			}
		}
	});
});