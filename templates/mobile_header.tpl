<!DOCTYPE html PUBLIC "-//WAPFORUM//DTD XHTML Mobile 1.2//EN" "http://www.openmobilealliance.org/tech/DTD/xhtml-mobile12.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>{if isset($self_title) && $self_title != ''}{$self_title|escape:'html'}{else}{$site_name}{/if}</title>
    <meta name="robots" content="index, follow"/>
    <meta name="revisit-after" content="1 days"/>
    <meta name="keywords" content="{if isset($self_keywords) && $self_keywords != ''}{$self_keywords|escape:'html'}{else}{$meta_keywords}{/if}"/>
    <meta name="description" content="{if isset($self_description) && $self_description != ''}{$self_description|escape:'html'}{else}{$meta_description}{/if}"/>	
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	
	<meta name="apple-touch-fullscreen" content="YES" />
	{if $mobile_appmode eq 'true'}
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes" />	
	{/if}
    <meta name="format-detection" content="telephone=no">
    <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />	

	<link rel="stylesheet" href="{$relative_tpl}/css/iphone.css"/>
	<link rel="apple-touch-icon" href="{$relative_tpl}/images/webapp-icon.png"/>
	<script type="text/javascript" src="{$relative_tpl}/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript">
		var mobile_url 		= '{$mobile_url}.php'
		var curr_page 		= '{$curr_page}'
		var mobile_type 	= '{$mobile_type}'
		var mobile_search 	= '{$mobile_search}'
		var ss				= ''
	</script>	
	<script type="text/javascript" src="{$relative_tpl}/js/mobile.js"></script>
</head>
<body>

<div class="preloader"></div>

<!-- Header -->
<div class="header">
	<div class="logo"></div>
	<div class="form">
		<form onsubmit="return false;">
			<input type="text" value="{$mobile_search}" id="search" name="search" onblur="javascript:if(this.value == '')this.value = ss" onclick="javascript:ss = this.value;if(this.value == 'Search')this.value = ''" autocapitalize="off" />	
		</form>	
	</div>
	<div class="clear"></div>	
</div>

<!-- Navigation -->
<div class="nav">
	<div name="recent" {if $vquery eq 'recent' && $mobile_search eq 'Search'}class="sel"{/if}>Most Recent</div>
	<div name="rated" {if $vquery eq 'rated' && $mobile_search eq 'Search'}class="sel"{/if}>Top Rated</div>
	<div name="popular" {if $vquery eq 'popular' && $mobile_search eq 'Search'}class="sel"{/if}>Most Viewed</div>
	<br class="clear"/>
</div>

<!-- Ajax Container -->
<div id="ajaxed">
