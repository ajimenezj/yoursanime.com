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
require('language/' .$_SESSION['language']. '/index.lang.php');

$active = ( $config['approve'] == 1 ) ? " AND active = '1'" : NULL;
$approv = ( $config['approve'] == 1 ) ? " AND v.active = '1'" : NULL;
$mydate = date('Y-m-d');
$sql    = "SELECT * FROM poll_question WHERE start_date <= '" .$mydate. "' AND end_date >= '" .$mydate. "'";
$rs     = $conn->execute($sql);
if ( $conn->Affected_Rows() == 1 ) {
    $x      = $rs->getarray();
    $list   = explode('|', $x['0']['poll_answer']);
    STemplate::assign('poll_id', $x['0']['poll_id']);
    STemplate::assign('poll_qty', $x['0']['poll_qty']);
    STemplate::assign('list', $list);
}

$type           = ( isset($_REQUEST['type']) && $_REQUEST['type'] == 'avatar' ) ? 'avatar' : NULL;
$sql_add        = ( $type ) ? " AND photo != ''" : NULL;

$sql            = "SELECT * FROM signup WHERE account_status = 'Active'" .$sql_add. " ORDER BY addtime DESC LIMIT 10";
$rs             = $conn->execute($sql);
$users			= $rs->getrows();
STemplate::assign('answersUsers',$users);


$sql                = "SELECT count(*) AS total_videos FROM video WHERE type = 'public'" .$active;
$ars                = $conn->execute($sql);
$total              = $ars->fields['total_videos'];
$grandtotalpublic   = $total;
$sql                = "SELECT count(*) AS total_videos FROM video WHERE type = 'private'" .$active;
$ars                = $conn->execute($sql);
$total              = $ars->fields['total_videos'];
$grandtotalprivate  = $total;
$sql                = "SELECT count(*) AS total_members FROM signup";
$ars                = $conn->execute($sql);
$total              = $ars->fields['total_members'];
$grandtotaluser     = $total;
$sql                = "SELECT sum(viewnumber) AS total_views FROM video";
$ars                = $conn->execute($sql);
$grandtotalviews    = $ars->fields['total_views'];
$sql                = "SELECT keyword FROM video WHERE type = 'public'" .$active. " ORDER BY viewnumber DESC LIMIT 5";
$tagshome           = cloudTags($sql);
$limit              = $config['items_per_front_page'];
$sql                = "SELECT v.*, s.username FROM video AS v, signup AS s
                       WHERE v.type = 'public' AND v.featured = 'yes' AND v.UID = s.UID" .$approv. " ORDER BY v.addtime DESC LIMIT " .$limit;
$rs                 = $conn->execute($sql);
$featuredvideos     = $rs->getrows();
$sql                = "SELECT v.*, s.username FROM video AS v, signup AS s
                       WHERE v.type = 'public' AND v.UID = s.UID" .$approv. " ORDER BY v.rate DESC LIMIT " .$limit;
$rs                 = $conn->execute($sql);
$topratedvideos     = $rs->getrows();
$sql                = "SELECT v.*, s.username FROM video AS v, signup AS s
                       WHERE v.type = 'public' AND v.UID = s.UID" .$approv. " ORDER BY v.viewnumber DESC LIMIT " .$limit;
$rs                 = $conn->execute($sql);
$mostviewedvideos   = $rs->getrows();
$sql                = "SELECT * FROM video WHERE type = 'public' " .$active. "AND viewtime <> '0000-00-00 00:00:00' ORDER BY viewtime DESC LIMIT 8";
$rs                 = $conn->execute($sql);
$viewedvideos       = $rs->getrows();

$sql = "SELECT * from video where type='public' $active ORDER BY VID DESC LIMIT 15 "; 
$rs = $conn->Execute($sql); 
$footerLatestVideo = $rs->getrows();

if( $config['enable_package'] == 'yes' && isset($_SESSION['UID']) ) {
        $sql    = "SELECT * FROM subscriber WHERE UID = '" .mysql_real_escape_string($_SESSION['UID']). "' LIMIT 1";
        $rs     = $conn->execute($sql);
        $u_info = $rs->getrows();
        STemplate::assign('u_info', $u_info['0']);
        $rs->movefirst();

        $sql    = "SELECT * FROM package WHERE pack_id = " .$rs->fields['pack_id'];
        $rs     = $conn->execute($sql);
        $pack   = $rs->getrows();
        STemplate::assign('pack', $pack['0']);
}

STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('tagshome', $tagshome);
STemplate::assign('grandtotalpublic',$grandtotalpublic+0);
STemplate::assign('grandtotalprivate',$grandtotalprivate+0); 
STemplate::assign('grandtotaluser',$grandtotaluser+0); 
STemplate::assign('vviews', number_format($grandtotalviews,0,',','.')); 
STemplate::assign('answers', $featuredvideos);
STemplate::assign('answersTopRated', $topratedvideos);
STemplate::assign('answersMostVideo', $mostviewedvideos);
STemplate::assign('answersWatchedVideo', $viewedvideos);
STemplate::assign('footerLatestVideo',$footerLatestVideo); 
STemplate::assign('carousel', true);
STemplate::assign('head_bottom', 'homelinks.tpl');
STemplate::display('head1homePage.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
STemplate::display('index.tpl');
STemplate::display('right.tpl');
STemplate::display('footer.tpl');
STemplate::gzip_encode();
?>
