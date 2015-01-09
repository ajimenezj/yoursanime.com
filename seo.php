<?php
$parts=explode("/",$script);
$seopage=$parts[count($parts)-1];
$seopage=str_replace('.php','',$seopage);

$sql="select * from seo where page = '".$seopage."' LIMIT 1";
$rs=$conn->execute($sql);
$seo=$rs->getrows();

$seotitle = $seo[0]['title'];
$seodescription = $seo[0]['description'];
$seokeywords = $seo[0]['keywords'];


if($seopage=='uvideos' || $seopage=='uprofile' || $seopage=='uplaylist' || $seopage=='ugroups' || $seopage=='ufriends' || $seopage=='ufavour') {
	$seotitle=$username." ".$seotitle;
	$seodescription=$username." ".$seodescription;
}

if($seopage=='search_result') {
	$seotitle=$search_id." - ".$seotitle;
}

if($seopage=='channel_detail') {
	$seotitle=$chname." - ".$seotitle;
}

if(isset($page)) {
	if($page>1) {
		$seotitle = $seotitle." - page ".$page;
		$seodescription = $seodescription." - page ".$page;
	}
}

STemplate::assign('seotitle',$seotitle);
STemplate::assign('seodescription',$seodescription);
STemplate::assign('seokeywords',$seokeywords);

?>
