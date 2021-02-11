

/*<!-- 차박명소 등록 체크여부 -->*/
	function YnCheck2(obj) {
		$("#car").empty();
	    var checked = obj.checked;
	
	    if(checked){
	    	var value = obj.value = "Y";
	        var Y = document.createElement("input");
		    Y.setAttribute("name", "carmapchk");
		    Y.setAttribute("type", "text");
		    Y.setAttribute("value", value);
		    
		    document.getElementById("car").appendChild(Y);	
		    
	    }else{
	    	var value = obj.value = "N";
	    	var N = document.createElement("input");
	       	N.setAttribute("name", "carmapchk");
		    N.setAttribute("type", "text");
		    N.setAttribute("value", value);
		    
		    document.getElementById("car").appendChild(N);	
	       	
	    }
	 };

/*<!-- 카테고리 차박이 아닐 경우 '차박 체크박스' 숨기기 -->*/
	function carPlaceChk() {
	    var selectbox, filter, a, txtValue, list;
	    selectbox = document.getElementById("selectbox");
	    filter = selectbox.value
	
	    list = document.getElementsByClassName("chkcarplace-box");
	    
	    for(i=0; i<list.length; i++){
	        a = document.getElementsByClassName("chkcarplace-box")[i];
	        txtValue = a.textContent || a.innerText;
	        
	        
	        if (txtValue.indexOf(filter) > -1) {
	        	list[i].style.display = "";
	        	
	        } else {
	        	list[i].style.display = "none";
	        }
		}
	}

/*빈공간에 작성하라는 문구*/
/*$(document).ready(function(){
	var img = $('#input_img');
	var category = $('#selectbox');
	var content = $('textarea[name=brdcontent]');	
	var place = $('#place');
	
	if(img.val() == ""){
			$('#emptyimg').show();
			console.log(img.val())
		}
		
		img.change(function(){
			$('#emptyimg').hide();
			console.log(img.val())
			
		var filename = img.val().split('\\').pop();
        $('#filename').text(filename);
			
		});
	
		
		if(category.val() == null){
				$('#emptycategory').show();
			}
		
		category.change(function(){
				$('#emptycategory').hide();
				});
			
		if(content.text().trim() == ""){
			$('#emptycontent').show();
		}
		if(content.text().trim() != null){
			content.keyup(function(){
			$('#emptycontent').hide();
			console.log(content.text())
			});
		}
		
});		
	*/	
	

/*폼 안넘어가기*/
/*function inquiry(){
		
		var category = $('select[name=categoryNo]').val();
		var content = $('textarea[name=inquiryContent]');
		var img = $('input[type=file]').val();
		
		
				if(category == null ||
				content.val().trim() == "" 	||
				img == "" ){
					alert(category+"/"+content.val()+"/"+img);
					alert("모든 항목을 작성해 주세요");
					return;
					
					
				}
				
				
				if(category != null &&
				content.val() != "" 	&&
				img != null  )	{
					alert("문의주셔서 감사합니다.");
					$("#target").submit();
				}
					
	
	
};*/

/*지도창 지우기*/
	function myFunction() {
		var x = document.getElementById("location-popup");
			if (x.style.display == "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			} 
		}  

	