<?php
include './coneccion.php';
$json = '';
$myid = '';
$fid = '';

if(isset($_GET['rq'])):
	switch($_GET['rq']):

		case 'newChat':
		//marcamos como no leidos los 10 ultimos mensajes desde myid a fid
			$myid = $_POST['myid'];
			$fid =  $_POST['fid'];
			$mensaje = '';
			$qur = mysql_query("select * from chat where `usuario_recibe`='$myid' && `usuario_envia`='$fid' && `estado`=0 order by id desc  limit 5 "); 
			$num_registros = mysql_num_rows($qur);

			// echo $num_registros;
			// lee solo un registro porue tiene limit 1 

			while($rw = mysql_fetch_array($qur)){
				//$json= array('estado' => 1, 'msg' => '<div>'.$rw['texto'].'</div>', 'lid' => $rw['id'], 'fecha'=> $rw['fecha']);
				$mensaje=$rw['texto'];
				$up = mysql_query("UPDATE `chat` SET  `estado` = '1' WHERE `usuario_recibe`='$myid' && `usuario_envia`='$fid' && `texto`='$mensaje'  "); 
			}


		break;


		case 'getIdByName':
			
			$name =  $_POST['name'];

			if(empty($name)){

			}else{
				$qur = mysql_query("select id from usuarios where `nombre`= '$name' ");  
				if(mysql_num_rows($qur) > 0){
					$row = mysql_fetch_array($qur);
					$json = array('estado' => 1, 'msg' => $row['id']);
				}

				// if(mysql_num_rows($qur) > 0){
				// 	$json = array('estado' => 1);
				// }else{
				// 	$json = array('estado' => 0);
				// }
			
			}

		break;

		case 'getFriends':
			// $myid = $_POST['myid'];
			$fid = $_POST['fid'];
			// $lid = $_POST['lid'];
			if(empty($fid)){

			}else{
				//print_r($_POST);
				$qur = mysql_query("select nombre from usuarios where `id`= $fid ");    //'$fid'
				if(mysql_num_rows($qur) > 0){
					$row = mysql_fetch_array($qur);
					$json = array('estado' => 1, 'msg' => $row['nombre']);
				}

				// if(mysql_num_rows($qur) > 0){
				// 	$json = array('estado' => 1);
				// }else{
				// 	$json = array('estado' => 0);
				// }
			
			}

		break;

		case 'getFriendsChatBox':
			// $myid = $_POST['myid'];
			$fid = 1; //   $_POST['fid'];
			$cuenta = 0;
			// $json = array();

			// $lid = $_POST['lid'];
			if(empty($fid)){

			}else{
				//print_r($_POST);
				$qur = mysql_query("select nombre from usuarios ");    //'$fid'
				$msg = '';
				if(mysql_num_rows($qur) > 0){
					// $row = mysql_fetch_array($qur);
					while($row = mysql_fetch_array($qur) )  {

						$msg =  $msg.'<div class="user">'.$row['nombre'].'</div>';
						//$cuenta = $cuenta + 1;
					}

					$json = array('estado' => 1, 'msg' => $msg);


				}

				// if(mysql_num_rows($qur) > 0){
				// 	$json = array('estado' => 1);
				// }else{
				// 	$json = array('estado' => 0);
				// }
			
			}

		break;

		case 'new':
			$msg = $_POST['msg'];

			$myid = $_POST['myid'];
			$fid = $_POST['fid'];


			if(empty($msg)){
				//$json = array('estado' => 0, 'msg'=> 'Enter your message!.');
			}else{
				$qur = mysql_query('insert into chat set `usuario_recibe`="'.$fid.'", `usuario_envia`="'.$myid.'", `texto`="'.$msg.'", `estado`="1"');
				if($qur){
					$qurGet = mysql_query("select * from chat where id='".mysql_insert_id()."'");
					while($row = mysql_fetch_array($qurGet)){
						$json = array('estado' => 1, 'msg' => $row['texto'], 'lid' => mysql_insert_id(), 'fecha' => $row['fecha']);
					}
				}else{
					$json = array('estado' => 0, 'texto'=> 'Unable usuario_recibe process request.');
				}
			}
		break;
		case 'msg':
			$myid = $_POST['myid'];
			$fid = $_POST['fid'];
			$lid = $_POST['lid'];
			if(empty($myid)){

			}else{
				//print_r($_POST);
				$qur = mysql_query("select * from chat where `usuario_recibe`='$myid' && `usuario_envia`='$fid' && `estado`=1");
				if(mysql_num_rows($qur) > 0){
					$json = array('estado' => 1);
				}else{
					$json = array('estado' => 0);
				}
			}
		break;
		case 'NewMsg':
			$myid = $_POST['myid'];
			$fid =  $_POST['fid'];
			$mensaje = '';
			$qur = mysql_query("select * from chat where (`usuario_recibe`='$myid' && `usuario_envia`='$fid')  && `estado`=1 order by id asc  limit 1 "); 
			$num_registros = mysql_num_rows($qur);

			// echo $num_registros;
			// lee solo un registro porue tiene limit 1 

			while($rw = mysql_fetch_array($qur)){
				$json= array('estado' => 1, 'msg' => '<div>'.$rw['texto'].'</div>', 'lid' => $rw['id'], 'fecha'=> $rw['fecha']);
				$mensaje=$rw['texto'];
			}
			// update estado
			
			$up = mysql_query("UPDATE `chat` SET  `estado` = '0' WHERE (`usuario_recibe`='$myid' && `usuario_envia`='$fid')  && `texto`='$mensaje'  "); //
			//$up = mysql_query("UPDATE `chat` SET  `estado` = '0' WHERE `usuario_recibe`='$fid' && `usuario_envia`='$myid' && `texto`='$mensaje'  "); //

		break;
	endswitch;
endif;

@mysql_close($conn);
header('Content-type: application/json');
echo json_encode($json);
?>


