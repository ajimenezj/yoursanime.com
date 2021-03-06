  <div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 {insert name=id_to_name assign=uname un=$UID}
		 <h1 class="mainBoxHeader">{translate item='ffavorites.my_friends_favorites'}</h1>
		 <span class="moreLink">{translate item='global.videos'} {$start_num} - {$end_num} {translate item='global.of'} {$total}</span>
		 </div>
		 <ul>
		 <!-- Video List -->
		 {if $total gt "0"}
		 {section name=i loop=$answers}
		 {insert name=comment_count assign=commentcount vid=$answers[i].VID}
		  <li class="mainList">
			  <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}" title="{$answers[i].description|truncate:160|escape:'html'}"><img src="{$tmburl}/{$answers[i].thumb}_{$answers[i].VID}.jpg" id="rotate_{$answers[i].VID}" alt="{$answers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}">{$answers[i].title|truncate:55|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="innerViews"><span class="textGlow">{$answers[i].viewnumber}</span> {translate item='global.views'}</div>
				<div class="innerViews"> {insert name=show_rate assign=vrate rte=$answers[i].rate}{$vrate}
        </div>
				</div>
			</li>
			{/section}
			{else}
			<p class="notFound">{translate item='global.video_not_found'}</p>
			{/if}
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