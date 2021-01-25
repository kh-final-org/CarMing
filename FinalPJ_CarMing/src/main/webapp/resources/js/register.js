function law_check(){
		
		if ($("input:checkbox[name='agree']").is(":checked") == true){
			
			location.href="registerform2.do"
			
			}else{

			alert("약관에 동의해 주세요.");

		}
}