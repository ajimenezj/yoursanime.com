<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>{$site_name}</title>
<meta name="description" content="Clipshare Adult" />
<meta name="keywords" content="Clipshare Adult" />
<link rel="stylesheet" href="{$baseurl}/css/style.css" type="text/css" media="screen" />
<!--[if lte IE 6]>
<link rel="stylesheet" href="{$baseurl}/css/ie6.css" type="text/css" media="screen" />
<![endif]-->
<!--[if lte IE 7]>
<link rel="stylesheet" href="{$baseurl}/css/tabs_ie.css" type="text/css" media="projection, screen" />
<![endif]-->
<link rel="stylesheet" href="{$baseurl}/css/jquery.tabs.css" type="text/css" media="print, projection, screen" />
<script type="text/javascript" src="{$baseurl}/js/jquery.js"></script>
<script src="{$baseurl}/js/jquery.tabs.pack.js" type="text/javascript"></script>

<script src="{$baseurl}/ajax/cpaint2.inc.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="{$baseurl}/css/anylinkmenu.css" />
<link rel="alternate" type="application/rss+xml" title="RSS - 20 newest videos" href="rss/new/" />
<link rel="alternate" type="application/rss+xml" title="RSS - 20 most viewed videos" href="rss/views/" />
<link rel="alternate" type="application/rss+xml" title="RSS - 20 most commented videos" href="rss/comments/" />

<script type="text/javascript" src="{$baseurl}/js/menucontents.js"></script>
<script type="text/javascript" src="{$baseurl}/js/anylinkmenu.js"></script>

{if $upload_page eq 'upload'}
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="-1">
<meta name="robots" content="index,nofollow">
{/if}
<link href="{$baseurl}/css/upload-progress.css" rel="stylesheet" type="text/css">

{php}
 function insert_additional_data(){
	global $config,$conn,$users;	
	if (!$conn) {
	$conn = &ADONewConnection($DBTYPE);
if ( !$conn->Connect($DBHOST, $DBUSER, $DBPASSWORD, $DBNAME) ) {
    echo 'Could not connect to mysql! Please check your database settings!';
    die();
}
$conn->execute("SET NAMES 'utf8'");
	}
			
//stats end                               
            if (@$_SESSION["UID"] != ""){
                $sql="SELECT * from signup WHERE UID='".$_SESSION["UID"]."'";
                $rs = $conn->Execute($sql);
                $users = $rs->getrows();
            }
 }
 
{/php}

{if $upload_page eq 'upload'}
<script language="javascript" type="text/javascript">
	var path_to_link_script = "{$UBR_path_to_link_script}";
	var path_to_set_progress_script = "{$UBR_path_to_set_progress_script}";
	var path_to_get_progress_script = "{$UBR_path_to_get_progress_script}";
	var path_to_upload_script = "{$UBR_path_to_upload_script}";
	var multi_configs_enabled = "{$UBR_multi_configs_enabled}";
	var config_file = "{$UBR_config_file}";
	var check_allow_extensions_on_client = "{$UBR_check_allow_extensions_on_client}";
	var check_disallow_extensions_on_client = "{$UBR_check_disallow_extensions_on_client}";
	var allow_extensions = /{$UBR_allow_extensions}$/i;
	var disallow_extensions = /{$UBR_disallow_extensions}$/i;
	var check_file_name_format = "{$UBR_check_file_name_format}";
	var check_null_file_count = "{$UBR_check_null_file_count}";
	var check_duplicate_file_count = "{$UBR_check_duplicate_file_count}";
	var max_upload_slots = "{$UBR_max_upload_slots}";
	var cedric_progress_bar = "{$UBR_cedric_progress_bar}";
	var cedric_hold_to_sync = "{$UBR_cedric_hold_to_sync}";
	var progress_bar_width = "{$UBR_progress_bar_width}";
	var show_percent_complete = "{$UBR_show_percent_complete}";
	var show_files_uploaded = "{$UBR_show_files_uploaded}";
	var show_current_position = "{$UBR_show_current_position}";
	var show_elapsed_time = "{$UBR_show_elapsed_time}";
	var show_est_time_left = "{$UBR_show_est_time_left}";
	var show_est_speed = "{$UBR_show_est_speed}";
</script>
<script language="javascript" type="text/javascript" src="{$baseurl}/js/{$UBR_path_to_js_script}"></script>
{/if}

{insert name=additional_data }
</head>
<body {if $upload_page eq 'upload'}onLoad="iniFilePage()"{/if}>
<!-- Header -->
 <div id="wrapper">
  <div id="header">
	 <div id="logo">
	 <a href="{$baseurl}/"><img src="{$imgurl}/logo.png" alt="{$site_name}" /></a>
	 </div>
	 <div id="search">
		<div id="searchBox">
    <form action="{seourl rewrite='search/' url='search_result.php'}" method="get" name="searchForm" id="searchForm">
				 <div class="searchBox2">
          <input type="text" name="search_id" value="{$smarty.request.search_id|escape:'html'}" tabindex="1" />
         </div>
				 <div class="searchButton">
         <button type="submit"><span>Search</span></button>
         </div>
		</form>
		</div>
	 </div>
	 <div id="mainNavigation">
	  <ul id="topNavigation">
		 <li class="topNavHome"><a href="{seourl rewrite='' url='index.php'}">Home</a></li>
		 <li><a href="{seourl rewrite='categories' url='channels.php'}">Categories</a></li>
		 <li><a href="{seourl rewrite='videos' url='video.php?next=watch'}">Videos</a></li>
		 <li><a href="{seourl rewrite='community' url='members.php'}">Community</a></li>
		 <li><a href="{seourl rewrite='userfriends' url='friends.php'}">Friends</a></li>
		</ul>
		<ul id="rightNavigation">
                 {if $smarty.session.USERNAME ne ''}
                 <li><a href="{seourl rewrite='logout' url='logout.php'}">Log Out</a></li>
                 <li>{insert name="msg_count" assign=total_msg}
                 <a href="{seourl rewrite='mail/inbox' url='inbox.php'}"> 
    	         {if $total_msg eq ""}
        	 {assign var=mailIcon value="tpl_icon_message.gif"}
                 {else}
        	 {assign var=mailIcon value="tpl_icon_new_message.gif"}
    	         {/if}
                 <img src="{$imgurl}/{$mailIcon}" border="0" /> 
                 {$total_msg}
                 </a>
                 </li>
                 {else}
                 <li><a href="{seourl rewrite='signup' url='signup.php'}">SignUp</a></li>
		 <li><a href="{seourl rewrite='login' url='login.php'}">LogIn</a></li>
                 {/if} 
		 <li class="rightNavUpload"><a href="{seourl rewrite='upload' url='upload.php'}" title="Upload A Video Today!">Upload</a></li>
		</ul>
	</div>
	<div id="smallNavigation">
		{if $head_bottom ne ""}
		<ul id="bottomNavigation">
      {include file = head_bottom/$head_bottom}
			</ul>
       {else}
		
      {include file = head_bottom/blank.tpl}
      {/if}
       {if $head_bottom_add ne ""}
			 <ul id="bottomNavigation">
      {include file = head_bottom/$head_bottom_add}
			</ul>
      {/if}
                {if $smarty.session.USERNAME ne ''}
		<ul id="language">
		<li><a href="#" class="menuanchorclass myownclass" rel="anylinkmenu1">Member Links</a></li>                                                  
		</ul>
    {/if}
	 </div>
	</div>
<!-- End Of Header -->