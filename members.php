<?php
require('include/config.php');
require('include/function.php');
require('classes/pagination.class.php');
require('language/' .$_SESSION['language']. '/members.lang.php');

$placement      = NULL;
$page           = ( isset($_REQUEST['page']) && is_numeric($_REQUEST['page']) ) ? $_REQUEST['page'] : 1;
$type           = ( isset($_REQUEST['type']) && $_REQUEST['type'] == 'avatar' ) ? 'avatar' : NULL;
$sql_add        = ( $type ) ? " AND photo != ''" : NULL;
$sql_count      = "SELECT count(UID) as total_users FROM signup WHERE account_status = 'Active'" .$sql_add;
$ars            = $conn->execute($sql_count);
$total          = $ars->fields['total_users'];
$pagination     = new Pagination($config['items_per_page']);
$limit          = $pagination->getLimit($total);
$sql            = "SELECT * FROM signup WHERE account_status = 'Active'" .$sql_add. " ORDER BY UID DESC LIMIT " .$limit;
$rs             = $conn->execute($sql);
$users          = $rs->getrows();
$start_num      = $pagination->getStartItem();
$end_num        = $pagination->getEndItem();
$pagination_add = ( $type ) ? 'avatar/' : NULL;
$pagination_url = $config['BASE_URL']. '/community/' .$pagination_add. '{#PAGE#}';
$page_link      = $pagination->getPagination($pagination_url);

$script=$_SERVER['SCRIPT_FILENAME'];
include('seo.php');
STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('page',$page);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('placement',$placement);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
STemplate::assign('answers',$users);
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('members.tpl');
STemplate::display('footer.tpl');
STemplate::gzip_encode();
?>
