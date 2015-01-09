<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='video.watch_videos'}</h1>
		 <span class="moreLink">{translate item='global.videos'} {$start_num} - {$end_num} {translate item='global.of'} {$total}</span>
		 </div>
		 <ul>
		 
		 
		 <!-- Video List -->
		 {section name=i loop=$answers}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}"><img src="{$tmburl}/{$answers[i].thumb}_{$answers[i].VID}.jpg" id="rotate_{$answers[i].VID}" alt="{$answers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}">{$answers[i].title|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answers[i].viewnumber} {translate item='global.views'}</span></div>
				<div class="videoViews"><a href="{seourl rewrite="users/`$answers[i].username`" url="uprofile.php?UID=`$answers[i].UID`"}">{$answers[i].username|escape:'html'}</a></div>
				<div class="videoViews">
        {insert name=show_rate assign=rate rte=$answers[i].rate}
        {$rate}
				</div>
			 </div>
			</li>
			{/section}
			<!-- End Video List -->
		 </ul>
		 <ul id="pagination-flickr">
 {php}    
    function insert_removeTag($array){
    	$tag = $array["tag"];
        $text = $array["text"];
        return str_replace($tag," ",$text);
    }
{/php}
        {insert name=removeTag assign=pageLink tag="<BR>" text=$page_link}
        {insert name=removeTag assign=pageLink tag="&nbsp;" text=$pageLink}
      	{$pageLink}
</ul> 
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}