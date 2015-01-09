<?php
/**************************************************************************************************
| Software Name        : ClipShare - Video Sharing Community Script
| Software Author      : Clip-Share.Com / ScriptXperts.Com
| Website              : http://www.clip-share.com
| E-mail               : office@clip-share.com
|**************************************************************************************************
| This source file is subject to the ClipShare End-User License Agreement, available online at:
| http://www.clip-share.com/video-sharing-script-eula.html
| By using this software, you acknowledge having read this Agreement and agree to be bound thereby.
|**************************************************************************************************
| Copyright (c) 2006-2007 Clip-Share.com. All rights reserved.
|**************************************************************************************************/

require('include/config.php');
require('include/function.php');
require('language/' .$_SESSION['language']. '/channels.lang.php');

$sql        = "SELECT * from channel";
$rs         = $conn->Execute($sql);
$channels   = $rs->getrows();

$script=$_SERVER['SCRIPT_FILENAME'];
include('seo.php');
STemplate::assign('err', $err);
STemplate::assign('msg', $msg);
STemplate::assign('answers', $channels);
STemplate::assign('head_bottom',"videolinks.tpl");
STemplate::display('head_seo.tpl');
STemplate::display('search.tpl');
STemplate::assign('meta_title','Full Anime Videos | YoursAnime');
STemplate::assign('meta_description','Selection of the best anime naruto, fairy tail, bleach, one piece, dragon ball');
STemplate::assign('meta_keywords','naruto, bleach, one piece, fairy tail, anime, watch online anime, watch online series');
STemplate::assign('recadd', array('a','b','c','d','e','f','g','h','i','k','l','m','n','o','p','q','r'));
STemplate::display('channels.tpl');
STemplate::display('footer.tpl');
STemplate::gzip_encode();
?>