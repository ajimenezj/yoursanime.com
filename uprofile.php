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
require('language/' .$_SESSION['language']. '/uvideos.lang.php');

$UID        = NULL;
$username   = NULL;
$active     = ( $config['approve'] == 1 ) ? " AND active = '1'" : NULL;
$type       = ( isset($_REQUEST['type']) && $_REQUEST['type'] == 'private' ) ? 'private' : 'public';
if ( isset($_REQUEST['username']) ) {
	$username   = trim($_REQUEST['username']);
    $sql        = "SELECT UID FROM signup WHERE username = '" .mysql_real_escape_string($username). "' LIMIT 1";
	$us         = $conn->execute($sql);
	if ( $conn->Affected_Rows() == 1 )
		$UID = $us->fields['UID'];
}

if ( isset($_REQUEST['UID']) && is_numeric($_REQUEST['UID']) ) {
	$UID    = trim($_REQUEST['UID']);
	$sql    = "SELECT UID FROM signup WHERE UID = '" .mysql_real_escape_string($UID). "' LIMIT 1;";
	$us     = $conn->execute($sql);
	if ( $conn->Affected_Rows() != 1 )
		$UID = NULL;
}

/************************** User personal stuff ******************************/

if ( !$UID )
	$err = $lang['uprofile.exists'];

$r_uid = $UID;
$s_uid = @mysql_real_escape_string($_SESSION['UID']);

if ( isset($_REQUEST['subscribe']) ) {
    if ( !$s_uid ) {
        $err = $lang['uprofile.subscribe_login'];
    } elseif ( $s_uid == $r_uid ) {
        $err = $lang['uprofile.subscribe_self'];
    } else {
	    if ( $_REQUEST['subscribe'] == 'on' ) {
    	    if ( isset($_REQUEST['info']) && $_REQUEST['info'] == 'i' ) {
		        $sql = " INSERT into subscribe_video set subscribe_to ='" .$r_uid. "', subscribe_from ='" .$s_uid. "', status='on' ";
                $conn->execute( $sql );
    	    } else {
		        $sql = " UPDATE subscribe_video set status='on' where subscribe_to ='" .$r_uid. "' and subscribe_from ='" .$s_uid. "'";
                $conn->execute( $sql );
            }
            $msg = $lang['uprofile.subscribe_on'];
	    } else if ( $_REQUEST['subscribe'] == 'off') {
		    $sql = " UPDATE subscribe_video set status='off' where subscribe_to ='" .$r_uid. "'and subscribe_from ='" .$s_uid. "'";
    	    $conn->execute( $sql );
            $msg = $lang['uprofile.subscribe_off'];
	    }
    }
}

$sql    = "select * from signup WHERE UID='" .$r_uid. "' LIMIT 1;";
$rs     = $conn->execute($sql);
if ( $conn->Affected_Rows() == 1 ) {
        $user_exists    = true;  
        $sql            = "update signup set profile_viewed=profile_viewed+1 WHERE UID='" .$r_uid. "' limit 1";
        $conn->execute($sql);
        STemplate::assign('profileage', birthday($rs->fields['bdate']));
        $users          = $rs->getrows();
        $sql            = "select * from video WHERE UID='" .$r_uid. "' $active order by VID desc limit 1";
        $rs             = $conn->execute($sql);
        $vdo            = $rs->getrows();
}

function birthday ($birthday){
    list($year,$month,$day) = explode("-",$birthday);
    $year_diff  = date("Y") - $year;
    $month_diff = date("m") - $month;
    $day_diff   = date("d") - $day;
    if ($day_diff < 0 || $month_diff < 0)
      $year_diff--;
    return $year_diff;
}




/************************** User personal stuff ******************************/


$total      = 0;
$videos     = array();
$page_link  = NULL;
$start_num  = NULL;
$end_num    = NULL;
if ( $err == '' ) {
    $sql            = "SELECT * FROM video WHERE UID = '" .mysql_real_escape_string($UID). "' AND type = '" .mysql_real_escape_string($type). "'" .$active. " LIMIT 8";
    $rs             = $conn->execute($sql);
    $videos         = $rs->getrows();
    $sql            = "SELECT * FROM video AS v, favourite AS f WHERE f.UID = '" .$UID. "' AND f.VID = v.VID" .$active. " LIMIT 8";
	$rs             = $conn->execute($sql);
	$fvideos        = $rs->getrows();
	$sql            = "SELECT * FROM video AS v, playlist AS f WHERE f.UID = '" .$UID. "' AND f.VID = v.VID" .$active. " LIMIT 4";
	$rs             = $conn->execute($sql);
	$pvideos        = $rs->getrows();
	$sql			= "SELECT * FROM friends WHERE UID='" .$UID. "' and friends_status='Confirmed' limit 8";
	$rs				= $conn->execute($sql);
	$friends		= $rs->getrows();
	
	// TOTAL Count for playlist
	$sql_count      = "SELECT count(v.VID) AS total_videos FROM video AS v, playlist AS f WHERE f.UID = '" .mysql_real_escape_string($UID). "' AND f.VID = v.VID" .$active;
	$ars            = $conn->execute($sql_count);
	$ptotal         = $ars->fields['total_videos'];
	// TOTAL count for videos
	$sql_count      = "SELECT count(VID) AS total_videos FROM video WHERE UID = '" .mysql_real_escape_string($UID). "' AND type = '" .mysql_real_escape_string($type). "'" .$active;
    $ars            = $conn->execute($sql_count);
    $vtotal         = $ars->fields['total_videos'];
    // TOTAL count for favourite
    $sql_count      = "SELECT count(v.VID) AS total_videos FROM video AS v, favourite AS f WHERE f.UID = '" .mysql_real_escape_string($UID). "' AND f.VID = v.VID" .$active;
	$ars            = $conn->execute($sql_count);
	$ftotal          = $ars->fields['total_videos'];
	// TOTAL count for friends
	$sql 			= "SELECT count(*) as total from friends WHERE UID='" .$UID. "' and friends_status='Confirmed' limit " .$config['total_per_ini'];
	$ars 			= $conn->Execute($sql);
	$frtotal 			= ( $ars->fields['total']<=$config['total_per_ini'] ) ? $ars->fields['total'] : $config['total_per_ini'];

}

$script=$_SERVER['SCRIPT_FILENAME'];
include('seo.php');
STemplate::assign('UID', $UID);
STemplate::assign('err', $err);
STemplate::assign('msg', $msg);
STemplate::assign('type', $type);
STemplate::assign('answers', $videos);
STemplate::assign('fanswers', $fvideos);
STemplate::assign('panswers', $pvideos);
STemplate::assign('friends', $friends);
STemplate::assign('uanswers',$users);
STemplate::assign('ptotal',$ptotal);
STemplate::assign('vtotal',$vtotal);
STemplate::assign('frtotal',$frtotal);
STemplate::assign('ftotal',$ftotal);
STemplate::assign('head_bottom_add',"viewuserlinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
if ( isset($user_exists) )
	STemplate::display('uprofile.tpl');
STemplate::display('footer.tpl');
STemplate::gzip_encode();
?>

