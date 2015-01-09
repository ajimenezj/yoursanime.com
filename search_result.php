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

$t1=time();
require('include/config.php');
require('include/function.php');
require('classes/pagination.class.php');
require('language/' .$_SESSION['language']. '/search_result.lang.php');

$active		    = ( $config['approve'] == 1 ) ? " AND active = '1'" : NULL;
$search_id 	    = ( isset($_REQUEST['search_id']) ) ? mysql_real_escape_string($filterObj->process($_REQUEST['search_id'])) : NULL;
$search_type	= ( isset($_REQUEST['search_type']) ) ? $_REQUEST['search_type'] : 'videos';
$search_key	    = ( isset($_REQUEST['search_key']) ) ? mysql_real_escape_string($filterObj->process($_REQUEST['search_key'])) : NULL;
$sort		    = ( isset($_REQUEST['sort']) && strlen($_REQUEST['sort']) <= 7 ) ? $_REQUEST['sort'] : NULL;
$page           = ( isset($_GET['page']) && is_numeric($_GET['page']) ) ? trim($_GET['page']) : 1;
$viewtype       = ( isset($_REQUEST['viewtype']) && $_REQUEST['viewtype'] == 'detailed' ) ? 'detailed' : 'basic';

switch ( $sort ) {
    case 'addate':
        $sortby = " ORDER BY adddate DESC";
        break;
    case 'viewnum':
        $sortby = " ORDER BY viewnumber DESC";
        break;
    case 'rate':
        $sortby = " ORDER BY (ratedby*rate) DESC";
        break;
   case 'title':
        $sortby = " ORDER BY title";
	default:
        $sortby = " ORDER BY relevance DESC";
}

if ( $search_id == '' && $search_key == '' ) {
        $err = $lang['search_result.query_empty'];
}

$searching  = false;
$total      = 0;
$start_num  = NULL;
$end_num    = NULL;
$videos     = array();
$ch         = NULL;
if ( $err == '' ) {
    if ( $search_type == 'search_users' ) {
        $sql    = "SELECT UID, username FROM signup WHERE username LIKE '%" .$search_id. "%' LIMIT 1";
        $rs     = $conn->execute($sql);
        if ( $conn->Affected_Rows() ) {
            $uid        = $rs->fields['UID'];
            $username   = $rs->fields['username'];
            $URL        = seo_url('users/' .$username, 'uprofile.php?UID=' .$uid);
            session_write_close();
            header('Location: ' .$URL);
            die();
        } else {
            $err = $lang['search_result.nothing'];
        }
    } elseif ( $search_type == 'search_groups' ) {
        session_write_close();
        $URL = $config['BASE_URL']. '/search_group.php?search_type=' .$search_type. '&search_id=' .$search_id;
        header('Location: ' .$URL);
        die();
        } elseif ( $search_type == 'related' ) {
        $searching  = true;

        $sql="select VID, title, keyword from video where vkey='$search_key'";
        $rs=$conn->execute($sql);
        $rel_title=$rs->fields['title'];
		$rel_keyword=$rs->fields['keyword'];
		$rel_vid=$rs->fields['VID'];


		$term = ""; $term = mysql_escape_string( $rel_title." ". $rel_keyword);
		$term = strtolower($term); $term = ereg_replace("[ \t\n\r]+", " ", $term);
		$terms=explode(" ",$term); $terms=array_unique($terms);
		$term="+"; $k=0;
		foreach($terms as $tm) { 
			if(strlen($tm)>1) { 
				if($k>0) $term.="~".$tm." "; else $term.=$tm." "; $k=$k+1; 
				if($k>8) break;
			} 
		}
		$term=rtrim($term); $term=addslashes($term);

		$sql= "SELECT count(VID) as vcount from video WHERE MATCH (title,description,keyword) against ('$term'  IN BOOLEAN MODE) AND VID <> ".$rel_vid." AND active = '1'".$where;
		
		$rs = $conn->Execute($sql); $total=$rs->fields['vcount'];

		$sql1= "SELECT count(VID) as vcount from video WHERE MATCH (title,description,keyword) against ('$term'  IN BOOLEAN MODE) AND VID <> ".$rel_vid.$where." AND active = '1' ORDER BY relevance DESC";

		$sql = "SELECT *, ( (1.3 * (MATCH(title) AGAINST ('$term' IN BOOLEAN MODE))) + (0.6 * (MATCH(description) AGAINST ('$term' IN BOOLEAN MODE))) + (0.3 * (MATCH(keyword) AGAINST ('$term' IN BOOLEAN MODE))) ) AS relevance FROM video WHERE ( MATCH(title,description,keyword) AGAINST ('$term' IN BOOLEAN MODE) ) HAVING relevance > 0 AND VID <> ".$rel_vid." AND active='1' ORDER BY relevance DESC";	

	} 
	
	else 
	{

        $searching  = true;
		$normal=0; $where = "";
		$exp = explode(" ",$search_id);

			
			//foreach($stopwords as $w) {
				//if(strtolower($search_id)==$w) $search_id="";
			//}	
				
			$term = ""; $terms=explode(" ",$search_id);
			foreach ($terms as $trm) {
				if(strlen($trm)>1) $term.="+".$trm." ";
			}
			$term=addslashes(rtrim($term));

			$sql= "SELECT count(VID) as vcount from video WHERE MATCH (title,description,keyword) against ('$term'  IN BOOLEAN MODE) AND active = '1'".$where;

			$rs = $conn->Execute($sql);
			$total=$rs->fields['vcount'];

			$sql = "SELECT *, ( (1.3 * (MATCH(title) AGAINST ('$term' IN BOOLEAN MODE))) + (0.6 * (MATCH(description) AGAINST ('$term' IN BOOLEAN MODE))) + (0.3 * (MATCH(keyword) AGAINST ('$term' IN BOOLEAN MODE))) ) AS relevance FROM video WHERE ( MATCH(title,description,keyword) AGAINST ('$term' IN BOOLEAN MODE) ) HAVING relevance > 0".$where." AND active='1' ".$sortby;
	
	}
    
    if ( $searching && $total>0) {
        $pagination     = new Pagination($config['items_per_page']);
        $limit          = $pagination->getLimit($total);
        $sql            = $sql. " LIMIT " .$limit;
        $rs             = $conn->execute($sql);
        $videos         = $rs->getrows();
		if(count($videos) == 0) {
			$sql            = $sql1. " LIMIT " .$limit;
			$rs             = $conn->execute($sql);
			$videos         = $rs->getrows();
		}
        $pagination_url = $config['BASE_URL']. '/search/{#PAGE#}/?sort=' .$sort. '&search_type=' .$search_type. '&search_id=' .$search_id. '&search_key=' .$search_key;
        $page_link      = $pagination->getPagination($pagination_url);
        $start_num      = $pagination->getStartItem();
        $end_num        = $pagination->getEndItem();    
	    $tags           = group_tags($sql);
	    STemplate::assign('tags',$tags);
        
        if ( $total == 0 ) {
            $err = $lang['search_result.nothing'];
        }
    }
}

$script=$_SERVER['SCRIPT_FILENAME'];
include('seo.php');
STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('ch', $ch);
STemplate::assign('page',$page);
STemplate::assign('viewtype', $viewtype);
STemplate::assign('start_num',$start_num);
STemplate::assign('end_num',$end_num);
STemplate::assign('page_link',$page_link);
STemplate::assign('total',$total);
STemplate::assign('answers',$videos);
STemplate::assign('head_bottom',"homelinks.tpl");
STemplate::display('head_search.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('search.tpl');
$t2=time();
STemplate::assign('ttime',($t2-$t1));
STemplate::display('search_result.tpl');
STemplate::display('footer.tpl');
STemplate::gzip_encode();
?>
