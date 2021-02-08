//가입항목 확인용 변수
var regist_chk = true;

var sel_file;

$(document).ready(function(){
	
	
	var membirth_input = $('input[name=membirth]');
	
	//생일입력창 max 년월일 입력
	membirth_input.prop('max', function(){
        return new Date().toJSON().split('T')[0];
    });
	
	//이미지 미리보기
	$("#photofile").on("change", handleImgFileSelect);
	
	
});

//가입항목에 빈칸인 칸이 있으면 경고창을 띄우고 해당 칸에 에러를 보여준뒤 false 리턴
function empty_change() {
	

	var memnick_input = $('input[name=memnick]');
	var memzip_input = $('input[name=memzip]');
	var memphone_input = $('input[name=memphone]');
	var membirth_input = $('input[name=membirth]');
	
	if(
			memnick_input.val().trim()=="" ||
			memzip_input.val().trim()=="" ||
			memphone_input.val().trim()==""){
		
		regist_chk = false;
		alert("수정사항에 빈 칸을 채워주세요.");
	}
	
	return regist_chk;
}; // end submit()


function handleImgFileSelect(e) {
	$("#thumbnail").empty(); 
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
			$("#thumbnail").attr("src", e.target.result);
			$("#thumbnail").attr("width", "200px");
			$("#thumbnail").attr("height", "250px");
		}
		reader.readAsDataURL(f);
	});
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

