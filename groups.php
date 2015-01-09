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
require('classes/pagination.class.php');
require('language/' .$_SESSION['language']. '/groups.lang.php');

$category   = 'Feautured';
$page       = ( isset($_GET['page']) && is_numeric($_GET['page']) ) ? $_GET['page'] : NULL;
$chid       = ( isset($_REQUEST['chid']) && is_numeric($_REQUEST['chid']) ) ? $_REQUEST['chid'] : NULL;
$b          = ( isset($_REQUEST['b']) && strlen($_REQUEST['b']) == 2 ) ? $_REQUEST['b'] : 'ra';

$distinct   = NULL;
if ( $chid ) {
    $sql_select     = "SELECT count(GID) AS total_groups FROM group_own WHERE channel LIKE '%" .mysql_real_escape_string($chid). "%'";
    $sql            = "SELECT * FROM group_own WHERE channel LIKE '%" .mysql_real_escape_string($chid). "%'";
} else {
    switch ( $b ) {
        case 'ra':
            $category   = translate('groups.recently_added');
            $sql_count  = "SELECT count(GID) AS total_groups FROM group_own ORDER BY gcrtime DESC";
            $sql        = "SELECT * FROM group_own ORDER BY gcrtime DESC";
            break;
        case 'mm':
            $category   = translate('groups.most_members');
            $sql_count  = "SELECT DISTINCT count(GID) AS total_groups FROM group_mem GROUP BY GID";
            $sql        = "SELECT DISTINCT *, count(MID) AS total FROM group_mem AS m, group_own AS o WHERE m.GID = o.GID GROUP BY m.GID ORDER BY total DESC";
            break;
        case 'mv':
            $category   = translate('groups.most_videos');
            $sql_count  = "SELECT DISTINCT count(GID) AS total_groups FROM group_vdo GROUP BY GID";
            $sql        = "SELECT DISTINCT *, count(VID) AS total FROM group_vdo AS v, group_own AS o WHERE v.GID = o.GID GROUP BY v.GID ORDER BY total DESC";
            break;
        case 'mt':
            $category   = translate('groups.most_topics');
            $sql_count  = "SELECT count(DISTINCT(GID)) AS total_groups FROM group_tps";
            $sql        = "SELECT DISTINCT *, count(o.GID) AS total FROM group_tps AS t, group_own AS o WHERE t.GID = o.GID GROUP BY t.GID ORDER BY total DESC";
            break;
        default:
            $category   = translate('groups.featured');
            $sql_count  = "SELECT count(GID) AS total_groups FROM group_own WHERE featured = 'yes' ORDER BY gname";
            $sql        = "SELECT * FROM group_own WHERE featured = 'yes' ORDER BY gname";
            break;
    }
}

$ars            = $conn->execute($sql_count);
$total          = $ars->fields['total_groups'];
$pagination     = new Pagination(ceil($config['items_per_page']/2));
$limit          = $pagination->getLimit($total);
$sql            = $sql. " LIMIT " .$limit;
$rs             = $conn->execute($sql);
$groups         = $rs->getrows();
$pagination_url = $config['BASE_URL']. '/usergroups/' .$b. '/{#PAGE#}';
$page_link      = $pagination->getPagination($pagination_url);
$start_num      = $pagination->getStartItem();
$end_num        = $pagination->getEndItem();

$script=$_SERVER['SCRIPT_FILENAME'];
include('seo.php');
STemplate::assign('err', $err);
STemplate::assign('msg', $msg);
STemplate::assign('catgy', $category);
STemplate::assign('page', $page);
STemplate::assign('start_num', $start_num);
STemplate::assign('end_num', $end_num);
STemplate::assign('page_link', $page_link);
STemplate::assign('total', $total);
STemplate::assign('answers', $groups);
STemplate::assign('head_bottom', 'grouplinks.tpl');
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
STemplate::display('groups.tpl');
STemplate::display('footer.tpl');
STemplate::gzip_encode();
?>
