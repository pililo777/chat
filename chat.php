<?php

	if(isset($_POST['myid']) ){ //&& isset($_POST['fid'])
		$myid = $_POST['myid'];
		$fid = $_POST['fid'];
		
		
		// if($myid=="1") {  
		// 	$fid  = "2"; 
		// }
		// else $fid = "1";

	}
	else{
		$myid = 'no se pudo obtener myid';
		$fid = ' no existe fid ';
	}

?>

<!DOCTYPE html>
<html>



<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Chat</title>
<script src="jquery.min.js"></script>
<script src="moment.min.js"></script>
<script src="livestamp.js"></script>
<script src='https://cdn.rawgit.com/admsev/jquery-play-sound/master/jquery.playSound.js'></script>
<!-- <link rel="stylesheet" type="text/css" href="style.css"> -->


 <link href="styleChat.css" rel="stylesheet">
 <script src="script.js"></script>

 <script type="text/javascript">

// copiado de:
// https://jsbin.com/ziwod/2/edit?html,js,output
// request permission on page load
document.addEventListener('DOMContentLoaded', function () {
     if (Notification.permission !== "granted") {
         Notification.requestPermission( function(status) { if (status !== 'granted') 
    	    alert ('no estan permitidas las notificaciones');
       });
     }
     //else 
});

function notifyMe(mensaje) {
  if (!Notification) {
    alert('Este navegador no permite notifaciones.'); 
    return;
  }

  if (Notification.permission !== "granted") {
    //Notification.requestPermission();
    	Notification.requestPermission( function(status) { if (status !== 'granted') 
    	alert ('no estan permitidas las notificaciones');
    	});
    }
  else {
    var notification = new Notification('Nuevo mensaje:', {
      icon: 'http://cdn.sstatic.net/stackexchange/img/logos/so/so-icon.png',
      body: $(mensaje).text(),
    });

    notification.onclick = function () {
      window.open("http://stackoverflow.com/a/13328397/1269037");      
    };
    
  }

}



 	// $(function() {
//     $("form textarea").keypress(function (e) {
//         if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
//         	// alert('has apretado enter');
//             //$('input[type=submit] .default').click();
//              $('#sb-mt').click();
//             return false;
//         } else {
//             return true;
//         }
//     });
// });

$(document).keyup(function(e){

	if(e.keyCode == 13){

		if($('#msenger textarea').val().trim() == ""){
			//alert('esta vacio');
			$('#msenger textarea').val('');
		}else{
			
			// $('#msenger textarea').attr('readonly', 'readonly');
			// $('#sb-mt').attr('disabled', 'disabled');	// Disable submit button
			sendMsg();
		}		
	}
});	

$(document).ready(function() {
	getFriendName();
	getFriendsChatBox();



    $('#msg-min').focus();
	$('#msenger').submit(function(e){
		// $('#msenger textarea').attr('readonly', 'readonly');
		// $('#sb-mt').attr('disabled', 'disabled');	// Disable submit button
		sendMsg();
		e.preventDefault();	
	});
});

function sendMsg(){
	var texto = $('#msg-min').val();
	//console.log('enviaremos:'+texto);
	// alert('entramos a enviar el mensaje');
	$.ajax({
		type: 'POST',
		url: 'chatM.php?rq=new',
		data: $('#msenger').serialize(),
		dataType: 'json',
		success: function(rsp){
				console.log('recibido:'+rsp.msg);
				$('#msenger textarea').removeAttr('readonly');
				$('#sb-mt').removeAttr('disabled');	// Enable submit button
				if(parseInt(rsp.estado) == 0){
					alert('el estado es cero'+rsp.msg);
				}else if(parseInt(rsp.estado) == 1){
					$('#msenger textarea').val('');
					$('#msenger textarea').focus();
					// $design = '<div>'+rsp.msg+'<span class="fecha-'+rsp.lid+'"></span></div>';
					$design = '<div class="float-fix">'+
									'<div class="m-rply">'+
										'<div class="msg-bg">'+
											'<div class="msg_b">'+
												rsp.msg+
												'<div class="">'+
													'<div class="msg-fecha fecha-'+rsp.lid+'"></div>'+
													'<div class="myrply-i"></div>'+
												'</div>'+
											'</div>'+
										'</div>'+
									'</div>'+
								'</div>';
					$('#cstream').append($design);

					$('.fecha-'+rsp.lid).livestamp();
					$('#dataHelper').attr('last-id', rsp.lid);
					$('#chat').scrollTop($('#cstream').height());
					$('.msg_body').scrollTop($('.msg_body')[0].scrollHeight+100);
					// añadimos para hacer scroll de los mensajes al final
					 

					 $('#cstream').animate({scrollTop: $('#cstream').prop("scrollHeight")}, 500);


				}
			},

		error: function(rsp){
			alert ('ha habido un error'+rsp.responseText);
		}

		});
}
function checkStatus(){
	
	// $myid = '<?php echo $myid; ?>';
	// $fid = '<?php echo $fid; ?>';
	$myid = $('#user1').val();
	$fid = $('#user2').val();



	$.ajax({
		type: 'post',
		url: 'chatM.php?rq=msg',
		data: {fid: $fid, myid: $myid, lid: $('#dataHelper').attr('last-id')},
		dataType: 'json',
		cache: false,
		success: function(rsp){
				if(parseInt(rsp.estado) == 0){
					return false;
				}else if(parseInt(rsp.estado) == 1){
					getMsg();
				}
			}
		});	
}

// Check for latest message
setInterval(function(){checkStatus();}, 200);
// obtener nombre para la ventana del chat
function getFriendName(){
	$fid = '<?php echo $fid;?>';
	$.ajax({
		type: 'post',
		url: 'chatM.php?rq=getFriends',
		data:  {fid: $fid},
		dataType: 'json',
		success: function(rsp){
			if(parseInt(rsp.estado) == 0){
				//no se encontró el friend

			}else if(parseInt(rsp.estado) == 1){
				// en rsp.nombre tenemos el nombre del amigo
				// console.log (rsp.msg);
				$('#nombreAmigo').text(rsp.msg);

			}
		},
		error: function(rsp){
			console.log(rsp.responseText);
		}



	})
}

//obtener nombres para el chatBox
function getFriendsChatBox(){
	$fid = '<?php echo $fid;?>';
	$.ajax({
		type: 'post',
		url: 'chatM.php?rq=getFriendsChatBox',
		data:  {fid: $fid},
		dataType: 'json',
		success: function(rsp){
			// console.log(rsp.msg);
			if(parseInt(rsp.estado) == 0){
				//no se encontró el friend

			}else if(parseInt(rsp.estado) == 1){
				// en rsp.nombre tenemos el nombre del amigo
				// console.log (rsp.msg);
				$('.chat_body').html(rsp.msg);

			}
		},
		error: function(rsp){
			console.log(rsp.responseText);
		}



	})
}

// 
function getMsg(){
	// $fid = '<?php echo $fid; ?>';
	// $myid = '<?php echo $myid; ?>';

	$myid = $('#user1').val();
	$fid = $('#user2').val();

	$.ajax({
		type: 'post',
		url: 'chatM.php?rq=NewMsg',
		data:  {fid: $fid, myid: $myid},
		dataType: 'json',
		success: function(rsp){
				console.log(rsp.msg);
				if(parseInt(rsp.estado) == 0){
					//alert(rsp.msg);
				}else if(parseInt(rsp.estado) == 1){
					$design = '<div class="float-fix">'+
									'<div class="f-rply">'+
										'<div class="msg-bg">'+
											'<div class="msg_a">'+
												rsp.msg+
												'<div class="">'+
													'<div class="msg-fecha fecha-'+rsp.lid+'"></div>'+
													'<div class="myrply-f"></div>'+
												'</div>'+
											'</div>'+
										'</div>'+
									'</div>'+
								'</div>';
					$('#cstream').append($design);
					$('#chat').scrollTop ($('#cstream').height());
					$('.fecha-'+rsp.lid).livestamp();
					$('#dataHelper').attr('last-id', rsp.lid);	
					$('.msg_body').scrollTop($('.msg_body')[0].scrollHeight+100);
					$.playSound("nuevomsg")
					notifyMe(rsp.msg);
				}
			},
		error: function(rsp){
			alert (rsp.responseText);
		}



	});
}
 </script>

</head>

<body>

	<!-- chat amigos -->
	<!-- <div class="chat_box">
  		<div class="chat_head"> Chat Box</div>
  		<div class="chat_body"> 
      		<div class="user"> Evelyn</div>
  		</div>
    </div -->

   <!--  -->

	  	<div class="chat_box">
	    	<div class="chat_head"> Chat Box <?php echo $myid; ?></div>
	    	<div class="chat_body"> 
	    		<div class="user"> <?php echo $fid; ?></div>
	       		<div class="user"> Evelyn</div>
	    	</div>
	    </div>

	  	<div class="msg_box" style="right:290px">
		    	<div class="msg_head"> 
		    		<span id="nombreAmigo">Amigo <?php echo $fid; ?></span> 
		    	 	<div class="close">x</div>
		    	</div>

		    	<div class="msg_wrap">
		    		<div class="msg_body">

		    			<div class="chat" id="chat">
				        	<div class="stream" id="cstream"></div>
				       	</div>
				       	<div class="msg_push"></div>

		    		</div>
		    	  <div class="msg_footer">
		    	  	<form method="POST" id="msenger" action="">
			            <input type="hidden" name="myid" id="user1" value="<?php echo $myid; ?> ">
			            <input type="hidden" name="fid" id="user2" value="<?php echo $fid; ?> ">
			            <textarea name="msg" id="msg-min"></textarea>
			            <input class="botonsubmit" type="submit" value="Enviar" id="sb-mt">
		           </form>

		    	  </div>

		      </div>
		 </div>


    <!-- chat historico mensajes -->
<!-- 	<div class="container" style="background: #fff; ">
      <div class="chat" id="chat">
        <div class="stream" id="cstream">
      </div>
     </div> -->

	    <!-- chat form actual -->
	    <div class="msg">
	        <!--  <form method="post" id="msenger" action="chat.php">
	            <textarea name="msg" id="msg-min"></textarea>
	            <input type="hidden" name="myid" value="<?php echo $myid;?>">
	            <input type="hidden" name="fid" value="<?php echo $fid;?>">
	            <input type="submit" value="Send" id="sb-mt">
	          </form> -->
	    </div>
	    <div id="dataHelper" last-id=""></div>

    </div>

</body>
</html>




