function ajaxlogin(){
		var memid= $("#memid").val().trim();
		var mempw= $("#mempw").val().trim();
		console.log(memid+"/"+mempw);
		

		
		var loginVal = {
				"memid":memid,
				"mempw":mempw
		};
		if(memid==null|| memid=="" ||mempw==null||mempw==""){
			alert("아이디와 비밀번호를 제대로 입력해주세요.");
		}else{
			$.ajax({
				type:"post",
				url : "ajaxlogin.do",
				data : JSON.stringify(loginVal),
				contentType : "application/json",
				dataType : "json",
				success:function(msg){
					if(msg.check==true){
						alert("로그인 성공!");		

						location.href="home.do";
					}else{
						alert("아이디 혹은 비밀번호가 틀렸습니다.");
					}
				},
				error:function(){
					console.error("로그인 아약스 통신관련 오류 or 비밀번호 오류");
					alert("아이디 혹은 비밀번호가 틀렸습니다.");
				}

		});
	}
}