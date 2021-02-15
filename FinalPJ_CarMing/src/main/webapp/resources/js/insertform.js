$(function(){
	$("#btn-register").click(function(){
		var sel_pCategory = $("#category option:selected").val();
		var sel_pName = $("#input-form").val();
		var sel_prFile = $("input[name=prFile]").val();
		var sel_prFile2 = $("input[name=prFile2]").val();
		var sel_prFile3 = $("input[name=prFile3]").val();
		var sel_prDesc = $("input[name=prDesc]").val()
		var sel_pPrice = $("input[name=pPrice]").val();
		var sel_pAmount = $("input[name=pAmount]").val();
		
		if(sel_pCategory == 0){
			alert("카테고리를 선택해주세요.");
			return false;
		} else if(sel_pName == ""){
			alert("제품명을 기입해주세요.");
			return false;
		} else if(sel_prFile == null || sel_prFile == ""){
			alert("파일(대표 이미지1)을 선택해주세요.");
			return false;
		} else if(sel_prFile2 == null || sel_prFile2 == ""){
			alert("파일(대표 이미지2)을 선택해주세요.");
			return false;
		} else if(sel_prFile3 == null || sel_prFile3 == ""){
			alert("파일(대표 이미지3)을 선택해주세요.");
			return false;
		} else if(sel_prDesc == null || sel_prDesc == ""){
			alert("파일(제품 상세 이미지)을 선택해주세요.");
			return false;
		} else if(sel_pPrice == null || sel_pPrice == ""){
			alert("제품 가격을 기입해주세요.");
			return false;
		} else if(sel_pAmount == null || sel_pAmount == ""){
			alert("제품 수량을 기입해주세요.");
			return false;
		} else{
			$(this).submit();
		}		
	});

}); 