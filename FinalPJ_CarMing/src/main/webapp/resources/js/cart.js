$(document).ready(function(){
	
	$(document).ajaxStart(function(){console.log("ajaxStart");});
	//장바구니 담기
	$("#insertCart_btn").click(function(){
		var cAmount = $("#qty").val();
		var pAmount = $("#pAmount").val();
		var startDate = $("#startDate").val();
		var endDate = $("#endDate").val();
		var pNo = $("#pNo").val();
		var pCategoryNo = $("#pCategoryNo").val();
		/*var memNo = $("#memNo").val();*/
		/*alert("멤버no"+memNo);*/
		var data = {
					cAmount : cAmount,
					pAmount : pAmount,
					startDate : startDate,
					endDate : endDate,
					pNo : pNo,
					pCategoryNo : pCategoryNo
		};
		
		if(startDate == ""){
			alert("렌트 대여일(시작일)을 선택하세요.");
			return;
		} else if(endDate == ""){
			alert("렌트 대여일(반납일)을 선택하세요.");
			return;
		} else {
			var confirm_val = confirm("장바구니에 담겠습니까?");
			
			if(confirm_val){
					$.ajax({
					url: "cart.do",
					type: "post",
					data: data,
					success: function(result){
						if(result == 1){
							alert("장바구니에 담겼습니다.");
							return false;
						} else{
							alert("회원만 사용할 수 있습니다.");
							$("#qty").val("1");
						}
					},
					error: function(){
						alert("장바구니 담기에 실패하였습니다.");
					}
				});		
			} else{
				return false;
			}
	 	}
	});
	
	//리뷰 등록 시 제약조건
	$("#insertreview").click(function(){
		if($("#message").val() == ""){
			alert("리뷰를 작성해주세요.");
			return false;
		} else if($("#starvalue").val() == 0 || $("#starvalue").val() == null || $("#starvalue").val() == ""){
			alert("평점을 매겨주세요.");
			return false;
		} else{
			$("#insertreview").submit();
		}
	});
	
	//렌트 시작일(max) 설정
	$('input[name=startDate]').prop('min', function(){
		return new Date().toJSON().split('T')[0];
	});
	
	//렌트 시작일 (min) 설정
	$('input[name=endDate]').prop('min', function(){
		var eDate = new Date();
		//렌트 시작일 다음날로 최소날짜 설정
		eDate.setDate(eDate.getDate()+1);
		return eDate.toJSON().split('T')[0];
	});
});


//리뷰 평점 기능 구현
var locked = 0;

function show(star){
    if(locked){
        return;
    }
    var i;
    var image;
    var el;
    
    for(i=1; i<=star; i++){
        image = 'image'+i;
        el = document.getElementById(image).src = "resources/img/star.png";
    }
}
function noshow(star){
    if(locked){
        return;
    }
    var i;
    var image;
    var el;
    
    for(i=1; i<=star; i++){
        image = 'image'+i;
        el = document.getElementById(image).src = "resources/img/nonstar.png";
    }
}
function lock(star){
    show(star);
    locked = 1;
    for(i=5; i>=star; i--){
    	image = 'image'+i;
    	el = document.getElementById(image).src = "resources/img/nonstar.png";
    }
}
function mark(star){
    lock(star);
    for(i=1; i<=star; i++){
    	image = 'image'+i;
    	el = document.getElementById(image).src = "resources/img/star.png";
    }
    document.getElementById("starvalue").value = star;
}
