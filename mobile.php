<?php
/**
 * iPhone / iPod - Mobile Webapp Module Version 2.0
 * Clip-share Version 4.1.5+
 * 09-17-2011
 */

define('_MOBILE', true);
require 'include/config.php';
require 'include/function.php';
require 'include/function_mobile.php';

// Init
$errors = '';
$messages = '';

// Loaded from ajax
$ajax = ((isset($_GET['mode']) && $_GET['mode'] == 'ajax')) ? true : false;

// Common params
$max = $config['mobile_view_limit'];
$pg = ((isset($_GET['page'])) && $_GET['page'] >= 1) ? $_GET['page'] : '1';
$type = (isset($_GET['type'])) ? mysql_real_escape_string($_GET['type']) : $config['mobile_default_type'];
$search = (isset($_GET['search'])) ? mysql_real_escape_string($_GET['search']) : '';

// Get Page	Value
if($pg == '1'){
$start = "0"; $pg = '1';}
else{$start = (($pg-1) * $max);}
if($start < 1){$start = 0;}
$limit = "LIMIT ".$start.", ".$max;

// Public field from database
$public = "type = 'public'";

// Work Out Video Type
switch($type){
	case 'recent': 		$condition = $public." "."ORDER BY addtime DESC"; break;
	case 'rated': 		$condition = $public." "."ORDER BY rate DESC"; break;
	case 'popular': 	$condition = $public." "."ORDER BY viewnumber DESC"; break;
}

// Work Out Search
$where = ''; 
if($search != ''){
	$where .= "(title like '%".$search ."%' ";	
	$where .= "OR description like '%".$search ."%' ";
	$where .= "OR keyword like '%".$search ."%') AND ".$public." ORDER BY VID DESC";	
}else{
	$where = $condition;
}

// Hard Coded Where Results
$static = "iphone = '1' AND type = 'public' AND active = '1'";

// Count All Videos
$sql = "SELECT COUNT(VID) AS ct FROM video WHERE ".$static." AND ".$where;
$res = $conn->execute($sql);
$count = $res->fields['ct'];

// Total Pages
$pages = ceil($count/$max);
$tpaging = '';

// Get Paging Links
if($pg == 1){
	$tpaging 	.= "<span>".$pg."</span>";
	if($pages > 1){
		$tpaging 	.= "<span id='next' class='right' onclick='javascript:newPage(\"videos\",\"page\",".($pg+1).");'></span>";
	}
}elseif($pg > 1 && $pg < $pages){
	$tpaging 	.= "<span id='prev' class='left' onclick='javascript:newPage(\"videos\",\"page\",".($pg-1).");'></span>";
	$tpaging 	.= "<span>".$pg."</span>";
	$tpaging 	.= "<span id='next' class='right' onclick='javascript:newPage(\"videos\",\"page\",".($pg+1).");'></span>";
}elseif($pg == $pages){
	$tpaging 	.= "<span id='prev' class='left' onclick='javascript:newPage(\"videos\",\"page\",".($pg-1).");'></span>";
	$tpaging 	.= "<span>".$pg."</span>";
}

// Get Videos Data
$sql        = "SELECT * FROM video WHERE ".$static." AND ".$where. " " .$limit;
$rs         = $conn->execute($sql);
$videos     = $rs->getrows();
$search 	= ($search != '') ? $search : 'Search';

// Assign Page Content Data
STemplate::assign('videos', $videos);
STemplate::assign('tpaging', $tpaging);
STemplate::assign('curr_page', $pg);
STemplate::assign('curr_count', $count);
STemplate::assign('top_page', $pages);
STemplate::assign('mobile_type', $type);
STemplate::assign('mobile_search', $search);
STemplate::assign('vquery', $type);

// Videos Folder
STemplate::assign('ipodvideo', $config['IPODVDO_URL']);


// Assign Mobile Meta Data
STemplate::assign('self_title', $config['mobile_meta_title']);
STemplate::assign('self_description', $config['mobile_meta_desc']);
STemplate::assign('self_keywords', $config['mobile_meta_keywords']);

// Appmode Flag
STemplate::assign('mobile_appmode', $config['mobile_appmode']);
STemplate::assign('mobile_url', $config['MOBILE_URL']);

// Display Mobile Pages
if(!$ajax){STemplate::display('mobile_header.tpl');}
STemplate::display('mobile_videos.tpl');
if(!$ajax){STemplate::display('mobile_footer.tpl');}
//if(!$ajax){STemplate::gzip_encode();}


?>
