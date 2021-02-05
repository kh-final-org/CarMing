//가입항목 확인용 변수
var regist_chk = true;

$(document).ready(function(){
	
	
	var beforemempw_input = $('input[name=beforemempw]');
	var newmempw_input = $('input[name=newmempw]');
	var newmempwchk_input = $('input[name=newmempwchk');
	
	
	
	// 정규식
	var pass_regul = /^(?=.*[0-9])(?=.*[a-zA-Z]).{6,13}$/;
	
	//실시간 비밀번호 형식 검사
	newmempw_input.keyup(function(){
		if(check(pass_regul, newmempw_input)){
			$('#mempw_error').hide();
			//실시간 비밀번호 확인 검사
			newmempwchk_input.keyup(function(){
				if(newmempw_input.val() != newmempwchk_input.val()){
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
	
	
	
	
	
});

//가입항목에 빈칸인 칸이 있으면 경고창을 띄우고 해당 칸에 에러를 보여준뒤 false 리턴
function empty_password() {
	
	var beforemempw_input = $('input[name=beforemempw]');
	var newmempw_input = $('input[name=newmempw]');
	var newmempwchk_input = $('input[name=newmempwchk');
	
	if(
			beforemempw_input.val().trim()=="" || 
			newmempw_input.val().trim()=="" ||
			newmempwchk_input.val().trim()==""){
		regist_chk = false;
		alert("비밀번호 변경사항을 제대로 입력해주세요.");
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
