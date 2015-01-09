  <div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 {insert name=id_to_name assign=uname un=$UID}
		 <h1 class="mainBoxHeader">{$gname} {translate item='global.videos'}</h1>
		 <span class="moreLink">{translate item='global.videos'} {$start_num} - {$end_num} {translate item='global.of'} {$total}</span>
		 </div>
		 <ul>
		 {if $total gt "0"}
		 <!-- Video List -->
		 {section name=i loop=$answers}
		 {insert name=comment_count assign=commentcount vid=$answers[i].VID}
		  <li class="mainList">
			  <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}"><img src="{$tmburl}/{$answers[i].thumb}_{$answers[i].VID}.jpg" id="rotate_{$answers[i].VID}" alt="{$answers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}">{$answers[i].title|truncate:40|escape:'html'}</a>
			 </div>
			  <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answers[i].viewnumber} {translate item='global.views'}</span></div>
				{insert name=id_to_name assign=uname un=$answers[i].UID}
				<div class="videoViews"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$answers[i].UID`"}">{$uname}</a></div>
				<div class="videoViews">{if $answers[i].ratedby gt "0"}
        {insert name=show_rate assign=vrate rte=$answers[i].rate}
        {$vrate}
        {else}
        not yet rated
        {/if}
				</div>
			 </div>
			</li>
			{/section}
			<!-- End Video List -->
			{else}
			<p class="notFound">{translate item='global.video_not_found'}</p>
			{/if}
		 </ul>
		 <ul id="pagination-flickr">
       {$page_link}
     </ul> 
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}