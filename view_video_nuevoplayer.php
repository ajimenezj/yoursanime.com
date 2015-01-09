<?php
//***********************************************
//*		NuevoLab NUEVOPLAYER ver. 8  			*
//*												*
//*		http://www.nuevolab.com					*
//*		email: support@nuevolab.com				*
//*												*
//***********************************************
$sql="select player_width, player_height from nuevo__player";
$prs = $conn->execute($sql);
$nvp = $prs->getrows();
$nuevo['player_width'] = $nvp['0']['player_width'];
$nuevo['player_height'] = $nvp['0']['player_height'];

$nuevo['embed_width'] = $nvp['1']['player_width'];
$nuevo['embed_height'] = $nvp['1']['player_height'];


STemplate::assign('nuevo', $nuevo);


$isyoutube=false;
if(strlen($video[0]['embed_code'])>0) {
   if (strpos($video[0]['embed_code'],"youtube.com")>0) { $isyoutube =true; STemplate::assign('isyoutube', '1');}
}

if($video[0]['embed_code']=='' || $isyoutube) {
	$sql="select * from nuevo__player WHERE ID = '2' LIMIT 1";
	$rs=$conn->execute($sql);
	$width = $rs->fields['player_width'];
	$height = $rs->fields['player_height'];

	$embedcode = '<object width="'.$width.'" height="'.$height.'" data="'.$config['BASE_URL'].'/nuevo/player.swf" type="application/x-shockwave-flash"><param name="movie" value="'.$config['BASE_URL'].'/nuevo/player.swf"><param name="flashvars" value="config='.$config['BASE_URL'].'/nuevo/econfig.php?key='.$video['0']['vkey'].'"><param name="allowscriptaccess" value="always"><param name="allowfullscreen" value="true"><param value="transparent" name="wmode"><param name="bgcolor" value="#000000"></object>';

	STemplate::assign('embedcode', $embedcode);

}

if(file_exists('adserve.php')) STemplate::assign('anyad', '1');

STemplate::assign('vid',$vinfo['0']['VID']);

?>
