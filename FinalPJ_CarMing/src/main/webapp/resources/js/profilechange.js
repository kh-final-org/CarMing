//가입항목 확인용 변수
var regist_chk = true;

var sel_file;

//닉네임 중복확인용 변수
var nickduplcheck_profile = false;

var user_memnick = $('input[name=memnick]').val();

$(document).ready(function(){
	
	
	var phone_regul = /^[0-9]{10,11}$/;
	var memphone_input = $('input[name=memphone]');
	var membirth_input = $('input[name=membirth]');
	var memnick_input = $('input[name=memnick]');
	
	//생일입력창 max 년월일 입력
	membirth_input.prop('max', function(){
        return new Date().toJSON().split('T')[0];
    });
	
	//이미지 미리보기
	$("#input_img").on("change", handleImgFileSelect);
	
	//실시간 전화번호 형식 검사
	memphone_input.keyup(function(){
		if(check(phone_regul, memphone_input)){
			$('#memphone_error').hide();
		} else {
			$('#memphone_error').show();
		}
	});
	
	memnick_input.keyup(function(){
		if(user_memnick!=memnick_input.val()){
			nickduplcheckprofile=false;
		}else{
			$('#memnick_error').hide();
			$('#nick_dupl_good').hide();
			$('#nick_dupl_bad').hide();
		}
	});
	
	
});

//가입항목에 빈칸인 칸이 있으면 경고창을 띄우고 해당 칸에 에러를 보여준뒤 false 리턴
function empty_change() {
	
	var phone_regul = /^[0-9]{10,11}$/;

	var memnick_input = $('input[name=memnick]');
	var memzip_input = $('input[name=memzip]');
	var memphone_input = $('input[name=memphone]');
	var membirth_input = $('input[name=membirth]');
	
	if(
		memnick_input.val().trim()=="" ||
		memzip_input.val().trim()=="" ||
		memphone_input.val().trim()==""){
		
		alert("상세주소를 제외한 수정사항 항목을 빠짐없이 입력해주세요");
		return false;
	}
	
	if(user_memnick != memnick_input.val()){
		if(nickduplcheck_profile==false){
			alert("닉네임 중복확인이 완료되지 않았습니다.");
			return false;
		}
	}
	
	if(	check(phone_regul, memphone_input))	
		{	
		}else{
			regist_chk = false;
			alert("전화번호 항목을 제대로 입력해주세요")
			return false;
		}
	alert("수정된 프로필이 저장되었습니다.");
	
	return regist_chk;
}; // end submit()


//정규식과 해당 태그를 입력받아 검사
function check(regul, content){
    if (regul.test(content.val()) && (content.val().search(/\s/) == -1)) {
    	regist_chk = true;
        return true;
    }else{
    	regist_chk = false;
    	return false;
    }
    
}



function handleImgFileSelect(e) {
	$("#img").empty(); 
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	
	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			return;
		}
		sel_file = f;

		var reader = new FileReader();
		reader.onload = function(e) {
			$("#img").attr("src", e.target.result);
			$("#img").attr("width", "200px");
			$("#img").attr("height", "250px");
		}
		reader.readAsDataURL(f);
	})
}

function nickdupl(){
	
	var memnick_input = $('input[name=memnick]');
	var nick = memnick_input.val();
	
	if(memnick_input.val().trim()==""){
		$('#memnick_error').show();
	}else if(user_memnick==memnick_input.val()){
		$('#memnick_error').hide();
		$('#nick_dupl_good').hide();
		$('#nick_dupl_bad').hide();
		alert("현재 계정에서 사용중입니다.");
	}else{
		$('#memnick_error').hide();
		$.ajax({
			type : 'post',
			url : 'nickdupltest.do',
			data : {
				nick:nick
				},
			dataType :'json',
			success:function(msg){
				if(msg.check==true){
					$('#nick_dupl_good').show();
					$('#nick_dupl_bad').hide();
					nickduplcheck_profile = true;
				}else{
					$('#nick_dupl_good').hide();
					$('#nick_dupl_bad').show();
					nickduplcheck_profile = false;
				}
			},
			error:function(){
				console.error("닉네임 아약스 통신관련 오류");
				alert("닉네임을 다시 한번 확인해주세요.");
			}
		});
	}
}

//파일명 추출 (???)
$(document).ready(function(){
	var img = $('#input_img');

		var filename = img.val().split('\\').pop();
	    $('#filename').text(filename); 
});

//다음api 주소팝업창
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            
            }
            
            addr += extraAddr;
                          
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $('input[name=memzip]').attr('value',data.zonecode);
            $('input[name=memaddr]').attr('value',addr);
            // 커서를 상세주소 필드로 이동한다.
            $('input[name=memaddr2]').focus();

        }
    }).open();
}

