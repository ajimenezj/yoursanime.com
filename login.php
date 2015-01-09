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
require('language/' .$_SESSION['language']. '/login.lang.php');

$username = ( isset($_POST['username']) ) ? mysql_real_escape_string($_POST['username']) : NULL;
$password = ( isset($_POST['password']) ) ? mysql_real_escape_string($_POST['password']) : NULL;

if ( isset($_POST['action_login']) ) {
	if ( $username == '' ) {
		$err = $lang['login.username_empty'];
	} elseif( $password == '' ) {
		$err = $lang['login.password_empty'];
    }
	
    if ( $err == '' ) {
        $sql    = "SELECT * FROM signup WHERE username = '" .$username. "' AND pwd = '" .md5($password) . "' LIMIT 1";
    	$rs     = $conn->execute($sql);        
        if ( $conn->Affected_Rows() < 1 ) {
            $err = $lang['login.failed'];
        } else {
            if ( $rs->fields['account_status'] == 'Inactive' ) {
                $err = $lang['login.not_active'];
            }
        }
		
		if ( $err == '' ) {
            if ( $config['enable_package'] == 'yes' ) {
                  $sql = "select * from subscriber where UID=".$rs->fields['UID'];
                  $rs1 = $conn->execute($sql);
                  if ( strtotime($rs1->fields['expired_time']) < strtotime(date("Y-m-d H:i:s")) ) {
                      header("Location: renew_account.php?uid=".base64_encode($rs->fields['UID']));
                      die();
                  }
            }

            $sql    = "update signup set logintime = '" .time(). "' WHERE username = '" .$username. "' LIMIT 1";
            $conn->execute($sql);
			
            $username                   = $rs->fields['username'];
            $password                   = $rs->fields['password'];
            
			$_SESSION['myUID'] 		    = intval($rs->fields['UID']);
			$_SESSION['UID']		    = intval($rs->fields['UID']);
			$_SESSION['EMAIL']		    = $rs->fields['email'];
			$_SESSION['USERNAME']		= $username;
			$_SESSION['EMAILVERIFIED']	= $rs->fields['emailverified'];
			
            if ( isset($_POST['login_remember']) ) {
                require_once $config['BASE_DIR']. '/classes/remember.class.php';
                CRemember::set($username, $password);
            }
            
            login_data('last_5users');
			
			$redirect = ( isset($_SESSION['redirect']) && $_SESSION['redirect'] != '' ) ? $_SESSION['redirect'] : $config['BASE_URL'];
			$_SESSION['redirect'] = NULL;
			
//			session_write_close();
            header('Location: ' .$redirect);
			die();
    	}
    }
}

$script=$_SERVER['SCRIPT_FILENAME'];
include('seo.php');
STemplate::assign('err',$err);
STemplate::assign('msg',$msg);
STemplate::assign('head_bottom',"homelinks.tpl");
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('login.tpl');
STemplate::display('footer.tpl');
STemplate::gzip_encode();
?>
