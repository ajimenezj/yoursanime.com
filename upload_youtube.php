<?php
require 'include/config.php';
require 'include/function.php';
require 'classes/youtube.class.php';
require 'classes/curl.class.php';
require 'language/' .$_SESSION['language']. '/upload_youtube.lang.php';

// can be download or embed!
$grab_method = 'embed';

chk_member_login();
isMailVerified();

$uid            = mysql_real_escape_string($_SESSION['UID']);
$upload_page    = 'first';
$youtube_url    = NULL;
$video          = array('title' => '', 'desc' => '', 'tags' => '', 'chlist' => array(), 'type' => 'public', 'comment' => '', 'embed' => '');
$VID            = NULL;

if ( isset($_POST['submit_upload_youtube']) ) {
    $url    = trim($_POST['youtube_url']);
    if ( $url == '' ) {
        $err = $lang['upload_youtube.url_empty'];
    } elseif ( !strstr($url, 'youtube.com/watch?v=') ) {
        $err = $lang['upload_youtube.url_invalid'];
    }
    
    if ( $err == '' ) {
        $youtube_url    = $url;
        $youtube        = new YoutubeRipper($youtube_url);
        $youtube_id     = $youtube->getVideoID();
        if ( !$youtube_id ) {
            $err = $lang['upload_youtube.id_failed'];
        } else {
            $youtube_details = $youtube->getVideoDetails($youtube_id);
            if ( !$youtube_details ) {
                $err = $lang['upload_youtube.details_failed'];
            } else {
                $video['title'] = $youtube_details['title'];
                $video['desc']  = $youtube_details['desc'];
                $video['tags']  = str_replace(',', ' ', $youtube_details['keywords']);
                $active = ( $config['approve'] == 1 ) ? "active = '0'" : "active = '1'";
                $sql    = "INSERT INTO video SET UID = '" .$uid. "', title = '" .mysql_real_escape_string($video['title']). "',
                                                 description = '" .mysql_real_escape_string($video['desc']). "',
                                                 keyword = '" .mysql_real_escape_string($video['tags']). "',
                                                 addtime = '" .time(). "', adddate = '" .date('Y-m-d'). "', vkey = '" .mt_rand(). "',
                                                 type = 'public', " .$active;
                $conn->execute($sql);
                $VID    = mysql_insert_id();
                if ( !$youtube->getVideoThumbs($youtube_id, $VID) ) {
                    $err = $lang['upload_youtube.thumbs_failed'];
                    delete_video($VID);
                } else {
                    include('classes/grabber.functions.php');
                    if ( $grab_method == 'download' ) {
                    	$tube  = new youtube();
                    	$link = $tube->get($youtube_url);
                    	$youtube_video_url = $link;
                    	
                    }
                    if ( !$youtube_video_url and $grab_method == 'download' ) {
                        $err = $lang['upload_youtube.flvurl_failed'];
                        delete_video($VID);
                    } else {
                        $space      = NULL;
                        $embed_code = NULL;
                        if ( $grab_method == 'download' ) {
                            if ( !$youtube->getVideoFLV($youtube_video_url, $VID) ) {
                                $err = $lang['upload_youtube.flv_failed'];
                                delete_video($VID);
                            } else {
                                $space = filesize($config['FLVDO_DIR']. '/' .$VID. '.flv');
                            }
                        } else {
                            $embed_code = $youtube->getVideoEmbed($youtube_id);
                            if ( !$embed_code ) {
                                $err = $lang['upload_youtube.embed_failed'];
                                delete_video($VID);
                            }
                        }
                        
                        if ( $err == '' ) {
                            $vkey   = substr(md5($VID), 11, 20);
                            $sql    = "UPDATE video SET flvdoname = '" .$VID. ".flv', duration = '" .$youtube_details['duration']. "',
                                                        space = '" .$space. "', vkey = '" .$vkey. "', embed_code = '" .$embed_code. "'
                                       WHERE VID = '" .$VID. "' LIMIT 1;";
                            $conn->execute($sql);
                            send_subscribed_mail($_SESSION['UID'], $_SESSION['USERNAME'], $_SESSION['EMAIL'], $VID, $video['title'], $vkey);
                            
                            if( $config['enable_package'] == 'yes' ) {
                                $sql = "UPDATE subscriber SET used_space=used_space+$space, used_bw=used_bw+$space, total_video=total_video+1
                                        WHERE UID = '" .$uid. "' LIMIT 1;";
                                $conn->execute($sql);
                            }
                            
                            $upload_page = 'second';
                        }                        
                    }
                }      
            }            
        }
    }
}

if ( isset($_POST['submit_update_video']) ) {
    $upload_page    = 'second';
    $VID            = ( isset($_POST['VID']) && is_numeric($_POST['VID']) ) ? trim($_POST['VID']) : NULL;    
    $title          = $filterObj->process(trim($_POST['video_title']));
    $desc           = $filterObj->process(trim($_POST['video_desc']));
    $tags           = $filterObj->process(trim($_POST['video_keywords']));
    $chlist         = $_POST['video_chlist'];
    $video['type']  = $filterObj->process(trim($_POST['video_type']));
    
    if ( strlen($title) < 3 ) {
        $err = $lang['upload_youtube.title_length'];
    } else {
        $video['title'] = $title;
    }
    
    if ( strlen($desc) < 3 ) {
        $err = $lang['upload_youtube.desc_length'];
    } else {
        $video['desc'] = $desc;
    }
    
    if ( strlen($tags) < 3 ) {
        $err = $lang['upload_youtube.tags_empty'];
    } else {
        $video['tags'] = $tags;
    }
    
    if ( count($chlist)<1 || count($chlist)>3 ) {
        $err = $lang['upload_youtube.chlist_empty'];
    } else {
        $video['chlist'] = $chlist;
    }
    
    if ( !$VID ) {
        $err = $lang['upload_youtube.failed'];
    }
    
    if ( $err == '' ) {
        $sql = "UPDATE video SET title = '" .mysql_real_escape_string($title). "', description = '" .mysql_real_escape_string($desc). "',
                                 keyword = '" .mysql_real_escape_string($tags). "', type = '" .mysql_real_escape_string($video['type']). "',
                                 channel = '0|" .mysql_real_escape_string(implode('|', $chlist)). "|0'
                WHERE VID = '" .mysql_real_escape_string($VID). "' LIMIT 1;";
        $conn->execute($sql);
        $success = $lang['upload_youtube.success'];
        $upload_page = 'success';
        STemplate::assign('success', $success);
    }
}

function delete_video( $VID ) {
    if ( !$VID ) {
        return true;
    }

    global $conn, $config;
    
    $sql = "DELETE FROM video WHERE VID = '" .mysql_real_escape_string($VID). "'";
    $conn->execute($sql);
    
    $flv_path = $config['FLVDO_DIR']. '/' .$VID. '.flv';
    if ( file_exists($flv_path) ) {
        @chmod($flv_path, 0777);
        @unlink($flv_path);
    }
    
    $thumbs = array($config['TMB_DIR']. '/' .$VID. '.jpg', $config['TMB_DIR']. '/1_' .$VID. '.jpg',
                    $config['TMB_DIR']. '/2_' .$VID. '.jpg', $config['TMB_DIR']. '/3_' .$VID. '.jpg');
    foreach ( $thumbs as $thumb ) {
        if ( file_exists($thumb) ) {
            @chmod($thumb, 0777);
            @unlink($thumb);
        }
    }
}

STemplate::assign('err', $err);
STemplate::assign('msg', $msg);
STemplate::assign('youtube_url', $youtube_url);
STemplate::assign('upload_page', $upload_page);
STemplate::assign('video', $video);
STemplate::assign('VID', $VID);
STemplate::assign('head_bottom', 'upload.tpl');
STemplate::display('head1.tpl');
STemplate::display('err_msg.tpl');
STemplate::display('upload_youtube.tpl');
STemplate::display('footer.tpl');
STemplate::gzip_encode();
?>
