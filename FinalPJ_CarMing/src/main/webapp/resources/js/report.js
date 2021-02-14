	var sel_file;
	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);
		
	
	});

	function handleImgFileSelect(e) {
		$("#img").empty(); //empty, remove 구분! remove는 태그 자체를 지운다 오키?
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);

		/* if (files.name == null) {
		   resetInputFile();
		} */
		filesArr.forEach(function(f) {
			if (!f.type.match("image.*")) {
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}
			sel_file = f;

			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img").attr("src", e.target.result);
				$("#img").attr("width", "90%");
				$("#img").attr("height", "440px");
			}
			reader.readAsDataURL(f);
		})
	}

	function resetInputFile() {
		$("#img").empty();
	}
	

 $(document).ready(function(){
	var img = $('input[type=file]');
	

		img.change(function(){
				$('#emptyfile').hide();
				
			var filename = img.val().split('\\').pop();
		    $('#filename').text(filename);
				
			});
		
		
 	});	 	

function report(){
		
			var category = $('select[name=categoryNo]');
			var content = $('textarea[name=reportContent]');	
			var img = $('input[type=file]');
			
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
			
			if(img.val() == ""){
				$('#emptyfile').show();
			}
			
			img.change(function(){
				$('#emptyfile').hide();
				
			var filename = img.val().split('\\').pop();
		    $('#filename').text(filename);
				
			});
			
	
		
			if(category.val() == null ||
			content.val().trim() == "" 	||
			img.val() == "" ){
				alert("모든 항목을 작성해 주세요");
				return;
				
				
			}
			
			
			if(category.val() != null &&
			content.val() != "" 	&&
			img.val() != null  )	{
				alert("신고에 적극 대응하겠습니다.");
				$("#target").submit();
			}
					
	
	
};


