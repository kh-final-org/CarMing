  //다음 도로명 주소 
var width = 500;	//팝업의 너비
var height = 600;	//팝업의 높이
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            width: width,
            height: height,
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
    
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
    
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
               /* document.getElementById("sample4_jibunAddress").value = data.jibunAddress;*/
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                /*if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }*/
    
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
    
                } /*else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                }*/ else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open({
            left: (window.screen.width/2) - (width/2),
            top: (window.screen.heigth/2) - (height/2)
        });
    }
		/* 동의 버튼 미클릭 시 동의 체크 구문 생성 */
        function agree_btn(e){
            if(e.checked==true){
                document.getElementById("agree_alert").style.display = "none";
            } else{
                document.getElementById("agree_alert").style.display = "block";
            }
           
        }

// 소현 노트북에서 잘됨
window.onload = function() {
	/* 배송 메모 select에서 직접 입력 클릭 시 배송 메모 영역 생성 */
   		$("#custom_memo").change(function(){
    	var custom_option = $("#custom_memo option:selected").val();

        if(custom_option == 6){
        		$("#custom_memo_area").show();
        	} else{
                $("#custom_memo_area").hide();
            }
        });

	/* 배송지 변경 클릭 시 우편번호찾기 버튼 생성*/
      $("#change_addr").click(function(){
         var confirm_val = confirm("배송지를 변경하시겠습니까?");
         
         if(confirm_val){
            $("#addr_btn").show();
            return false;
         } else{ss
            $("#addr_btn").hide();
         }
      });

	/* 결제 수단 체크 시 버튼 생성 */
		$("#pay_go").click(function(){
			
			var cNoArr = new Array();
			
			$(".licartNo").each(function(){
				cNoArr.push($(this).children().attr("data-cartNo"));
			});
			console.log("카트번호"+cNoArr);
			var addr = $("#sample4_detailAddress").val();
			console.log("주소: "+addr);
			var totalPrice = $("#totalPrice").val();
			console.log("가격: "+totalPrice);
			var pay_option = $("#pay_option option:selected").val();
			
			var dto = {
				"pay_option": pay_option,
				"cNoArr": cNoArr,
				"totalPrice": totalPrice,
				"addr": addr
			}
			/* 약간동의 체크안할 시 알림창  */
			if($("#f-option4").is(':checked') == false){
				alert("모든 약관에 동의하셔야 결제를 진행할 수 있습니다.");
				return;
			} else if(pay_option == 'method'){
				alert("결제 수단을 선택해주세요.");
				return;				
			} else if(custom_memo == 1){
				alert("배송 메모를 선택해주세요.");
				return;
			} else{
				alert("컨트롤러로 넘기기 전 알림창");
				if(pay_option == 'kakaopay'){
					alert("결제 수단: "+pay_option);
					$("#formId").attr("action", "kakaopay.do").submit();
				} else if(pay_option == 'inicis'){
					alert("결제 수단: "+pay_option);
					$("#formId").attr("action", "inicispay.do").submit();
				}
			}
			
		
		});
	
};

/*function toKakaopay(dto){
	alert(dto);
	$.ajax({				
		url: 'kakao.do',
		type: 'post',
		data: dto,
		success: function(){
			alert("카카오페이지 전환 성공");
		}
	});
}*/

   

