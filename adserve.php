<?php
define('_VALID', true);
//require 'include/dbconfig.php';
require 'include/config.local.php';

$db=mysql_connect ($DBHOST,$DBUSER,$DBPASSWORD);
mysql_select_db ($DBNAME);
mysql_query("SET NAMES 'utf8'"); 


$now=time();

$sql = "SELECT * from nuevo__htmlad where active='1' AND expire>'".$now."' ORDER BY RAND() LIMIT 1";

$rs=@mysql_query($sql);

if ( @mysql_affected_rows()==1) {

	 $ad=@mysql_fetch_array($rs);

	$pic1=$config['BASE_URL'].'/nuevo/images/adclose.png';
	$pic2=$config['BASE_URL'].'/nuevo/images/adclose2.png';
	$ad['ad_content'] = preg_replace(array('/\r/', '/\n/'), '', $ad['ad_content']);


	if(strlen($ad['back_color'])!=6) $ad['back_color']='transparent'; else $ad['back_color']='#'.$ad['back_color'];
	if(strlen($ad['progress_color'])!=6) $ad['progress_color']='990000';

	$box_width = $ad["ad_width"]; $box_height=$ad["ad_height"];

   $code='';	

  $code='<div id="nuevoa" style="visibility: hidden; position:absolute;z-index:1010;">';
  

  $code.='<div id="acnt">';

   if($ad['back_color']!='transparent') {
		$code.='<div id="acenter" align="center" style="display:block; width:'.$ad['ad_width'].'px;background-color:'.$ad['back_color'].';padding:12px;">';
   } else {
		$code.='<div id="acenter" align="center" style="display:block; width:'.$ad['ad_width'].'px;background-color:'.$ad['back_color'].';">';
   }

   $code.='<div id="anuevo" style="display:none;">'.$ad['ad_content'].'</div>';
   if($ad['ad_method']=='timeout' && $ad['ad_type']!='pause' && $ad['ad_type']!='midroll') {
	   
		$code.='<div id="countdiv" style="text-align:center;margin-top:4px;">';
		$code.='<div id="nv_progress" style="width:0%;height:5px;display:block;background:#'.$ad['progress_color'].';"></div>';
		$code.='</div>';
   }   
   
   $code.='</div></div>';

   if($ad['ad_closepic']!='small') $img=$pic1; else $img=$pic2;
   if($img==$pic1) {$pic=1;$pic_size=35;} else {$pic=2;$pic_size=15;}

   if($pic==1) {
	$top_offset=-16;
	$right_offset=-16;
   } else {
	$top_offset=-8;
	$right_offset=-8;   
   }
   
   if($ad['back_color']!='transparent') {
	  //$right_offset=$right_offset-24;
   }

	$top_offset=$top_offset; //+$ad['ad_closeoffset'];
	$right_offset=$right_offset; //+$ad['ad_closeoffset'];

   $code.= '<div id="aclose" onclick="javascript:aclose();return false;" ';
   $code.= 'style="background-image:url('.$img.');';
   if($ad['ad_method']=='timeout' && ($ad['ad_type']=='before_pause' || $ad['ad_type']=='before')) { $code.=' display:none;'; }
   $code.= ' position:absolute;z-index:999; right:'.$right_offset.'px;top:'.$top_offset.'px;cursor:pointer;height:'.$pic_size.'px;width:'.$pic_size.'px;"></div>';


   $code=$code.'</div>';  

   $onpause=1;$onload=0; $amidroll=0; 
   switch ( $ad['ad_type'] ) {
	  case 'before_pause':  $onpause=1; $onload=1; break; 
	  case 'before': $onpause=0; $onload=1;  break;
	  case 'midroll': $onpause=1; $onload=0;  break;
   }


   $code.='<script type="text/javascript">';

    $code.= "var nv = {delay:".intval($ad['close_delaytype']).",midroll_start:".intval($ad['midroll_start']).",close_delay:".intval($ad['close_delay']).",type:'".$ad['ad_type']."',method:'".$ad['ad_method']."',timeout:".intval($ad['ad_timer']).",close_bg:'".$pic1."',displayonpause:".$onpause.",displayonload:".$onload."};";
	$code.="</script>";

    echo '<script type="text/javascript" src="'.$config['BASE_URL'].'/nuevo/js/anyhtm.js"></script>';
	echo $code;

}
?>