$(function(){
		$('#loginChk').hide();
	});
	
	function login(){
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
						location.href="home.do";
						history.back();
					}else{
						alert("아이디 혹은 비밀번호가 틀렸습니다.");
					}
				},
				error:function(){
					alert("통신 실패");
				}

		});
	}
}