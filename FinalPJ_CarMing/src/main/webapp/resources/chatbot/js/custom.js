$(document).ready(function(){
	// chat_icon 클릭시 발생 이벤트
	$('.chat_icon').click(function(event) {
		// chat_box 에 active를 toggle로 추가/삭제
		$('.chat_box').toggleClass('active');
	});

	// 	
	$('.conv-form-wrapper').convform({selectInputStyle: 'disable'});
})