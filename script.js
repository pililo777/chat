$(document).ready(function(){

	$('.chat_head').click(function(){
		$('.chat_body').slideToggle('slow');
	});
	$('.msg_head').click(function(){
		$('.msg_wrap').slideToggle('slow');
	});
	
	$('.close').click(function(){
		$('.msg_box').hide();
	});


 //    $('.user').live('click', function(){
 //    		$('.msg_wrap').show();
	// 		$('.msg_box').show();
	// });


	$(document).on('click', '.user', function (e) {

		$('#cstream').empty();

		var userChat = e.currentTarget.innerText;
		$('#nombreAmigo').text(userChat);
		var formData = { name: userChat};

		$.ajax({
			type: 'POST',
			url: 'chatM.php?rq=getIdByName',
			data: formData,
			dataType: 'json',
			success: function(rsp){
				// $('#user2').val() = rsp.msg;
				$('#user2').val(rsp.msg);
				//console.log(rsp.msg);
			}
		});


		formData = {myid : $('#user1').val(), fid : $('#user2').val() };

		$.ajax({
			type: 'POST',
			url: 'chatM.php?rq=newChat',
			data: formData,
			dataType: 'json',
			success: function(rsp){
				// $('#user2').val() = rsp.msg;
				//console.log(rsp.msg);
			}
		});


		$('.msg_wrap').show();
		$('.msg_box').show();
	   	e.preventDefault();

	   	// $.post("chat.php", { fid: $('#user2').val(), myid:$('#user1').val() });

	});
	
	// $('.user').click(function(){
	// 	$('.msg_wrap').show();
	// 	$('.msg_box').show();
	// });
	
	// $('textarea').keypress(
 //    function(e){
 //        if (e.keyCode == 13) {
 //        	//alert('vaciamos el textarea');
 //            var msg = $(this).val();
	// 		// $(this).val('');
	// 		if(msg!='')
	// 		// $('<div class="msg_b">'+msg+'</div>').insertBefore('.msg_push');
	// 		$('.msg_body').scrollTop($('.msg_body')[0].scrollHeight+200);
	// 		// alert('enviamos el mensaje');
	// 		// sendMsg();
 //        }
 //    });
	
});