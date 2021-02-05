//가입항목 확인용 변수
var regist_chk = true;

$(document).ready(function(){
	
	
	var memid_input = $('input[name=memid]');
	var mempw_input = $('input[name=mempw]');
	var mempwchk_input = $('input[name=mempwchk');
	var memname_input = $('input[name=memname]');
	var memnick_input = $('input[name=memnick]');
	var membirth_input = $('input[name=membirth]');
	
	
	
	//생일입력창 max 년월일 입력
	membirth_input.prop('max', function(){
        return new Date().toJSON().split('T')[0];
    });
	
	//생일입력창 현재 년월일 읿력
	membirth_input.prop('value', function(){
        return new Date().toJSON().split('T')[0];
    });
	
	// 정규식
	var email_regul = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var pass_regul = /^(?=.*[0-9])(?=.*[a-zA-Z]).{6,13}$/;
	var name_regul = /^[가-힝a-zA-Z]{2,}$/;
	
	//실시간 이메일 형식 검사
	memid_input.keyup(function(){
		if(check(email_regul, memid_input)){
			$('#memid_error').hide();
		}else{
			$('#memid_error').show();
		}
	});
	
	//실시간 비밀번호 형식 검사
	mempw_input.keyup(function(){
		if(check(pass_regul, mempw_input)){
			$('#mempw_error').hide();
			//실시간 비밀번호 확인 검사
			mempwchk_input.keyup(function(){
				if(mempw_input.val() != mempwchk_input.val()){
					$('#mempwchk_error').show();
					regist_chk = false;
				}else{
					$('#mempwchk_error').hide();
					regist_chk = true;
				}
			});
		}else{
			$('#mempw_error').show();
			$('#mempwchk_error').show();
		}
	});
	
	
	
	//실시간 이름 형식 검사
	memname_input.keyup(function(){
		if(check(name_regul, memname_input)){
			$('#memname_error').hide();
		} else {
			$('#memname_error').show();
		}
		
	});
	
	//네이버에서 가져온 정보라면 기본 체크를 true로 지정
	if(memid_input.prop("readonly")){
		regist_chk = true;
	}

	
});

//가입항목에 빈칸인 칸이 있으면 경고창을 띄우고 해당 칸에 에러를 보여준뒤 false 리턴
function regist_empty() {
	
	var memid_input = $('input[name=memid]');
	var mempw_input = $('input[name=mempw]');
	var mempwchk_input = $('input[name=mempwchk');
	var memname_input = $('input[name=memname]');
	var memnick_input = $('input[name=memnick]');
	var memzip_input = $('input[name=memzip]');
	var memphone_input = $('input[name=memphone]');
	var membirth_input = $('input[name=membirth]');
	//로드 문제 때문에 성별 값은 미리 집어넣는걸로
	
	if(
			memid_input.val().trim()=="" || 
			mempw_input.val().trim()=="" ||
			mempwchk_input.val().trim()=="" ||
			memname_input.val().trim()=="" ||
			memnick_input.val().trim()=="" ||
			memzip_input.val().trim()=="" ||
			memphone_input.val().trim()=="" ||
			$('input[name=memgender]:checked').val()==null){
		
		regist_chk = false;
		alert("가입항목을 제대로 입력해주세요");
	}
	
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