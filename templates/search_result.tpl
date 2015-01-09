<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='global.search_videos'}</h1>
		 <span class="midLink"><a href="{seourl rewrite="search/`$viewtype`/`$page`/?sort=addate&search_type=`$smarty.request.search_type`&search_id=`$smarty.request.search_id`" url="search_result.php?viewtype=`$viewtype`&page=`$page`&search_type=`$smarty.request.search_type`&search_id=`$smarty.request.search_id`&sort=addate"}">Date Added</a> -  
	    <a href="{seourl rewrite="search/`$viewtype`/`$page`/?sort=title&search_type=`$smarty.request.search_type`&search_id=`$smarty.request.search_id`" url="search_result.php?viewtype=`$viewtype`&page=`$page`&search_type=`$smarty.request.search_type`&search_id=`$smarty.request.search_id`&sort=title"}">Title</a> - 
	    <a href="{seourl rewrite="search/`$viewtype`/`$page`/?sort=viewnum&search_type=`$smarty.request.search_type`&search_id=`$smarty.request.search_id`" url="search_result.php?viewtype=`$viewtype`&page=`$page`&search_type=`$smarty.request.search_type`&search_id=`$smarty.request.search_id`&sort=viewnum"}">Views</a> - 
	    <a href="{seourl rewrite="search/`$viewtype`/`$page`/?sort=rate&search_type=`$smarty.request.search_type`&search_id=`$smarty.request.search_id`" url="search_result.php?viewtype=`$viewtype`&page=`$page`&search_type=`$smarty.request.search_type`&search_id=`$smarty.request.search_id`&sort=rate"}">Rating</a></span>
		 <span class="moreLink">{translate item='search_result.result_videos'} {$start_num} - {$end_num} {translate item='global.of'} {$total}</span>
		 </div>
		 <ul>
		 <!-- Video List -->
		 {section name=i loop=$answers}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}"><img src="{$tmburl}/{$answers[i].thumb}_{$answers[i].VID}.jpg" id="rotate_{$answers[i].VID}" alt="{$answers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}">
			 {$answers[i].title|truncate:40|escape:'html'|highlight1:$smarty.request.search_id}
			 </a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answers[i].viewnumber} {translate item='global.views'}</span></div>
				{insert name=id_to_name assign=uname un=$answers[i].UID}
				<div class="videoViews"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$answers[i].UID`"}">{$uname}</a></div>
				<div class="videoViews">{if $answers[i].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$answers[i].rate}
        {$rate}
        {else}
        not yet rated
        {/if}
				</div>
			 </div>
			</li>
			{/section}
			<!-- End Video List -->
		 </ul>
		 <ul id="pagination-flickr">
      	{$page_link}
</ul> 
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}