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
	$(".selectDelete_btn").click(function(){
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
	
	/* 카테고리별 게시물 보여주기 */
	//1. 텐트 / 타프
	$("#tent").click(function(){
		var pCategoryNo = $(".pCategoryNo");
		var data_pCategoryNo = $(this).attr("data-pCategoryNo");		
		console.log("카테고리 번호: "+pCategoryNo.val());
		console.log("data-카테고리번호: "+data_pCategoryNo);
		
		var product_div = $(".col-lg-4 col-md-6");
		console.log(product_div[0]);
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
	/*
	//2. 메트 / 침낭
	$("#bag").click(function(){
		alert("매트 ");		
	});
	//3. 코펠 / 버너 / 취사
	$("#pot").click(function(){
		alert("코펠");		
	});
	//4. 의자 / 테이블
	$("#chair").click(function(){
		alert("의자");		
	});
	//5. 화로대 / BBQ
	$("#bbq").click(function(){
		alert("화로대");		
	});
	*/
	
	

	
});
	
	/* 카카오톡 공유하기 api */
 	function sendLink(pNo) {
	Kakao.init('8078df641ea1c47f0e710ebba7a5f5e7'); // 초기화
    Kakao.Link.sendDefault({
	
        objectType: 'feed',
        content: {
            title: document.title,
            description: "캠핑 렌트 사이트 : CarMing",
            imageUrl: 'https://postfiles.pstatic.net/MjAyMTAxMjFfNDgg/MDAxNjExMjE5MDc4MjE2.jLlgUhy3A2J847CYZ_4Sp4X5FI3S8gz_luJHphBr6ocg.czFVIO2I_A-hEsZD7ucwCMfehhtK-PWhH1QFSqbrUmog.JPEG.ghkdwjdals33/kakaoCarMing.JPG?type=w966',
            link: {
                mobileWebUrl: 'http://localhost:8787/carming/productdetail.do?pNo='+pNo,
                webUrl: 'http://localhost:8787/carming/productdetail.do?pNo='+pNo
            },
        },
        buttons: [
            {
                title: '상품 보기',
                link: {
                    mobileWebUrl: 'http://localhost:8787/carming/productdetail.do?pNo='+pNo,
                    webUrl: 'http://localhost:8787/carming/productdetail.do?pNo='+pNo,
                },
            }
        ],
    })
}

function selView(){
		var sort = document.getElementById("selViewSort").value;
	 	var sel = document.getElementById("selViewNumber").value;
	 	var pCateNo = document.getElementById("pCateNo").value;
		
		location.href="productlist.do?viewNo="+sel+"&pCateNo="+pCateNo+"&sort="+sort;
	}

function selSort(){
		var sort = document.getElementById("selViewSort").value;
		var sel = document.getElementById("selViewNumber").value;
	 	var pCateNo = document.getElementById("pCateNo").value;
		
		location.href="productlist.do?viewNo="+sel+"&pCateNo"+pCateNo+"&orderBy="+sort;
}

