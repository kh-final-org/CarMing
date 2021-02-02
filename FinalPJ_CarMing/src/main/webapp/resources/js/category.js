/*상품 모두체크 구문*/

$(document).ready(function(){
	$(document).ajaxStart(function () { console.log("start"); });

	$("#allCheck").click(function(){
		var chk = $("#allCheck").prop("checked");
		if(chk){
			$(".chBox").prop("checked", true);
		} else{
			$(".chBox").prop("checked", false);
		}
	});
	
	/*개별상품을 체크했을 시 모두선택 체크박스 해제 구문*/
	$(".chBox").click(function(){
		$("#allCheck").prop("checked", false);
	});
	
	
	/*삭제 기능 구현(ajax로)*/
	$("#selectDelete_btn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val){
			var checkArr = new Array();
			
			$("input[class='chBox']:checked").each(function(){
				checkArr.push($(this).attr("data-pNo"));
			});

			$.ajax({
				url: "productdelete.do",
				type: "post",
				data: {chbox: checkArr},
				success: function(result){
					if(result == 1){
						location.href="productlist.do";
					} else{
						alert("삭제 실패");
					}
				}
			});
		}
	});
	
	$(".delete_btn").click(function(){
		/*confirm메소드를 이용해 삭제 여부를 알림창을 띄어준다.*/
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val){
			var checkArr = new Array();
			
			checkArr.push($(this).attr("data-pNo"));

			$.ajax({
				url: "productdelete.do",
				type: "post",
				data: {chbox : checkArr},
				success: function(result){
					if(result == 1){
						alert("제품삭제에 성공하였습니다!")
						location.href = "category.jsp";
					} else{
						alert("삭제 실패");
						location.href = "productlist.do";
					}
				}
			});
		}
	});
	
});


