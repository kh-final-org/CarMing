function delete_empty(){
	var mempwchk_input = $('input[name=mempwchk');
	
	if(mempwchk_input.val().trim()=="" || mempwchk_input.val().trim()==null){
		regist_chk = false;
		alert("비밀번호를 입력하지 않았습니다.");
	}
	
	return regist_chk;
}