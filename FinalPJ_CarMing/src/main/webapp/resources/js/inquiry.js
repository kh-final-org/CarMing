/*이미지 미리보기*/
	var sel_file;
	$(document).ready(function() {
		$("#input_img").on("change", handleImgFileSelect);
	});

	function handleImgFileSelect(e) {
		$("#img").empty(); //empty, remove 구분! remove는 태그 자체를 지운다 오키?
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
				$("#img").attr("width", "90%");
				$("#img").attr("height", "440px");
			}
			reader.readAsDataURL(f);
		})
	}
/*사진 변경*/
 $(document).ready(function(){
	var img = $('input[type=file]');
	

				img.change(function(){
					$('#emptyfile').hide();
					
				var filename = img.val().split('\\').pop();
		        $('#filename').text(filename);
					
				});
		
		
 	});	 
/*폼 안넘어가기*/
function inquiry(){
		
		var category = $('select[name=categoryNo]');
		var content = $('textarea[name=inquiryContent]');
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
				
				if(content.val().trim() != ""){
					$('#emptycontent').hide();
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
					alert("모든 항목을 기입해주세요.");
					return;
					
					
				}
				
				
				if(category.val() != null &&
				content.val() != "" 	&&
				img.val() != null  )	{
					alert("문의주신 내용이 등록되었습니다.");
					$("#target").submit();
				}
					
	
	
};



