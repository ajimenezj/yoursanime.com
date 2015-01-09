<?php
$text_dir = 0;
$test_language = $config['BASE_DIR'].'/language/' .$_SESSION['language']. '/comments.lang.php';
if(file_exists($test_language)) { 
	require($test_language);
    if($_SESSION['language']=='il_IL') $text_dir=1;
} 
else { require($config['BASE_DIR'].'/language/en_US/comments.lang.php'); } 
STemplate::assign('text_dir', $text_dir);	



$sql = "select * from comments_settings WHERE ID = '1' LIMIT 1";
$rs = $conn->execute($sql);
$res = $rs->getrows($rs);
STemplate::assign('comm_set', $res['0']);	
if(isset($_SESSION['USERNAME'])) {
if($_SESSION['USERNAME'] == $res['0']['moderator']) {
   STemplate::assign('moderator', '1');	
}
}
$limit = $res['0']['per_page'];

	$sql="select count(*) as ccount from comments WHERE VID = '".mysql_real_escape_string($video['0']['VID'])."'";
	$rs=$conn->execute($sql);
	$total_comments = $rs->fields['ccount'];
    
	$sql="select * from comments WHERE VID = '".mysql_real_escape_string($video['0']['VID'])."' AND reply_id < 1 ORDER by addtime desc LIMIT ".$limit;



	$rs=$conn->execute($sql);
	$coms=$rs->getrows();



	$comments=array();

	foreach($coms as $com) {
		$sql="select photo, username from signup WHERE UID = '".mysql_real_escape_string($com['UID'])."'";
		$ph=$conn->execute($sql);
		$com['photo'] = $ph->fields['photo'];
		$com['username'] = $ph->fields['username'];
		$com['COMRP'] = $com['COMID'];
		$comments[] = $com;
		$sql="select * from comments WHERE reply_id = '".mysql_real_escape_string($com['COMID'])."' ORDER by addtime asc";
		$rp=$conn->execute($sql);
		$rep=$rp->getrows();
		foreach($rep as $rp) {
			$sql="select photo, username from signup WHERE UID = '".mysql_real_escape_string($rp['UID'])."'";
			$ph=$conn->execute($sql);
			$rp['photo'] = $ph->fields['photo'];
			$rp['username'] = $ph->fields['username'];
			$rp['COMRP'] = $com['COMID'];
			$comments[] = $rp;
		}
	}

STemplate::assign('limit_comments',$limit);
STemplate::assign('count_comments',count($comments));
STemplate::assign('total_comments',$total_comments);
STemplate::assign('comments',$comments);
?>
