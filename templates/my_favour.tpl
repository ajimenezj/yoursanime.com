  <div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='my_favour.my_favorites'}</h1>
		 <span class="moreLink">{translate item='global.videos'} {$start_num} -{$end_num} {translate item='global.of'} {$total}</span>
		 </div>
		 <ul>
		 {if $total gt "0"}
		 <!-- Video List -->
		 {section name=i loop=$answers}
		 {insert name=comment_count assign=commentcount vid=$answers[i].VID}
		  <li class="innerList">
			  <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}"><img src="{$tmburl}/{$answers[i].thumb}_{$answers[i].VID}.jpg" id="rotate_{$answers[i].VID}" alt="{$answers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}">{$answers[i].title|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answers[i].viewnumber}</span> {translate item='global.views'}</div>
				<div class="videoViews"><span class="textGlow">{$commentcount}</span> {translate item='global.comments'}</div>
				</div>
			  <div class="videoInfo">
			  <div class="videoViews">
         {if $smarty.session.UID ne ""}
                        <form name="USERFAVOUR" method="post" action="{seourl rewrite='my_favorites' url='my_favour.php'}">
                        <input type="hidden" name="rvid" value="{$answers[i].VID}">
                        <input type="hidden" name="removfavour" value="Remove Favorite">
                        <input type="image" src="{$imgurl}/btn_remove.gif" onclick="return confirm('Are you sure you want to remove this favorite video?');" alt="Remove Video" />
           </form>
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