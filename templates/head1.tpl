<!DOCTYPE html 
     PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
     "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head><meta name="geo.region" content="US" /><meta name="geo.position" content="37.09024;-95.712891" /><meta name="ICBM" content="37.09024, -95.712891" />
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" /><meta name="robots" content="noindex,follow">
<meta name="propeller" content="5de00228e52837613aae7d7fc11f435f">
<title>{if !empty($seotitle)}{$seotitle|escape}{else}{$site_name}{/if}</title><meta name="description" content="{if !empty($seodescription)}{$seodescription|escape}{else}{$meta_description}{/if}" /><meta name="keywords" content="{if !empty($seokeywords)}{$seokeywords|escape}{else}{$meta_keywords}{/if}" />
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
<script type='text/javascript' src='//go.onclasrv.com/apu.php?zoneid=28268'></script>
<script type="text/javascript">
var baseurl = '{$baseurl}/';
var imgurl = '{$baseurl}/images';
</script>
<script src="{$baseurl}/js/jquery-1.2.6.pack.js" type="text/javascript"></script>
<script src="{$baseurl}/js/jquery-clipshare-0.1.js" type="text/javascript"></script>
{if $rotating_thumbs == '1'}
<script src="{$baseurl}/js/jquery.rotator-0.1.js" type="text/javascript"></script>
{/if}
<script src="{$baseurl}/ajax/cpaint2.inc.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="{$baseurl}/css/anylinkmenu.css" />
<link rel="alternate" type="application/rss+xml" title="RSS - 20 newest videos" href="rss/new/" />
<link rel="alternate" type="application/rss+xml" title="RSS - 20 most viewed videos" href="rss/views/" />
<link rel="alternate" type="application/rss+xml" title="RSS - 20 most commented videos" href="rss/comments/" />

<script type="text/javascript" src="{$baseurl}/js/menucontents.js"></script>
<script type="text/javascript" src="{$baseurl}/js/anylinkmenu.js"></script>

{if $pollinganel ne 'Disable'}
<script src="{$baseurl}/js/myjavascript.js" type="text/javascript"></script>
<script src="{$baseurl}/js/myjavascriptfx.js" type="text/javascript"></script>
<script src="{$baseurl}/js/indexonly.js" type="text/javascript"></script>
<script src="{$baseurl}/js/myjavascriptajax.js" type="text/javascript"></script>
{/if}

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
{insert name=additional_data }
</head>
<body>
{insert name=select_language assign=select_language current=$smarty.session.language}
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
		 <li class="topNavHome"><a href="{seourl rewrite='' url='index.php'}">{translate item='menu.home'}</a></li>
		 <li><a href="{seourl rewrite='categories' url='channels.php'}">{translate item='menu.channels'}</a></li>
		 <li><a href="{seourl rewrite='videos' url='video.php?next=watch'}">{translate item='menu.videos'}</a></li>
		 <li><a href="{seourl rewrite='community' url='members.php'}">{translate item='menu.community'}</a></li>
		 <li><a href='#'>Forums</a></li>
		 <li><a href="{seourl rewrite='usergroups' url='groups.php'}" {$groupcurrent}>{translate item='menu.groups'}</a></li>
		 <li><a href="{seourl rewrite='userfriends' url='friends.php'}">{translate item='menu.friends'}</a></li>
		 <li><a href="{seourl rewrite='contact' url='contact.php'}">Cont&aacute;ctanos</a></li>
		</ul>
		<ul id="rightNavigation">
                 {if $smarty.session.USERNAME ne ''}
                 <li><a href="{seourl rewrite='logout' url='logout.php'}">{translate item='global.logout'}</a></li>
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
                 <li><a href="{seourl rewrite='signup' url='signup.php'}">{translate item='global.signup'}</a></li>
		 <li><a href="{seourl rewrite='login' url='login.php'}">{translate item='global.login'}</a></li>
                 {/if} 
		 <li class="rightNavUpload"><a href="{seourl rewrite='upload' url='upload.php'}" title="Upload A Video Today!">{translate item='menu.upload}</a></li>
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
		{if $multilanguage == '1'}   
{$select_language}
    <form name="language_form" method="post" action="" id="language_form">
    <input name="session_language" type="hidden" value="{$smarty.session.language}" />
    </form>
    {/if}
	 </div>
	</div>
<!-- End Of Header -->
