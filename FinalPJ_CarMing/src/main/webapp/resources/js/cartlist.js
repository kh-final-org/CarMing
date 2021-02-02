
/* 날짜 데이터 변환 스크립트*/
$(document).ready(function(){

/*
	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();

	//렌트 시작일 날짜 데이터 변환
	var sDate = new Date(startDate);
	var eDate = new Date(endDate);
	
	var sdd = sDate.getDate();
	var smm = sDate.getMonth()+1; //January=0부터 시작
	var syyyy = sDate.getFullYear();
	
	if(sdd < 10){
		sdd = '0'+sdd;
	} 
	if(smm < 10){
		sdd = '0'+smm;
	}
	
	sDate = syyyy+'-'+smm+'-'+sdd;
	document.getElementById("sdatePicker").defaultValue = sDate+"";
	
	//렌트 반납일 날짜 데이터 변환
	var edd = eDate.getDate();
	var emm = eDate.getMonth()+1; //January=0부터 시작
	var eyyyy = eDate.getFullYear();
	
	if(edd < 10){
		edd = '0'+edd;
	} 
	if(emm < 10){
		edd = '0'+emm;
	}
	
	eDate = eyyyy+'-'+emm+'-'+edd;
	document.getElementById("edatePicker").defaultValue = eDate+"";
	alert(sDate);
*/	
	
	/* **************************************************************************************** */
	$("#allCheck").click(function(){
		/* 전체선택 클릭 시 */
		var chk = $("#allCheck").prop("checked");
		
		if(chk){
			$(".chBox").prop("checked", true);
		} else{
			$(".chBox").prop("checked", false);
		}

	});
		
	/* 개별상품을 체크했을 시 모두선택 체크박스 해제*/
	$(".chBox").click(function(){
		$("#allCheck").prop("checked", false);
	});
	
	/* 삭제 기능*/
	$("#selectDelete_btn").click(function(){
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		
		if(confirm_val){
			var checkArr = new Array();
			
			$("input[class='chBox']:checked").each(function(){
				checkArr.push($(this).attr("data-cartNo"));
			});
			
			alert(checkArr);
			
			$.ajax({
				url: "cartdelete.do",
				type: "post",
				data: {chBox : checkArr},
				success: function(result){
					alert("성공은 했나?");
					if(result == 1){
						alert("해당 항목이 삭제되었습니다.");
						location.href = "cartlist.do";
					} else{
						alert("항목을 삭제하는데 실패하였습니다.");
						location.href = "cartlist.do";
					}
				}
			});
		}
		
	});
		
});