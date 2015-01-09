  <div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='menu.my_videos'}</h1>
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
				<form action="{seourl rewrite="video/edit/`$answers[i].VID`" url="my_vdo_edit.php?VID=`$answers[i].VID`"}" method="post" name="removeVideoForm" id="removeVideoForm">
			  <div class="videoViews">
         <input type="hidden" value="{$answers[i].VID}" name="VID" />
         <input type="hidden" value="Edit Video" name="Edit Video" />
         <input type="image" src="{$imgurl}/btn_edit.gif" alt="Edit Video"/>
				</div>
				</form>
				<form action="{seourl rewrite='my_videos' url='my_video.php'}" method="post" name="removeVideoForm" id="removeVideoForm">
				<div class="videoViews">
				 <input type="hidden" value="1" name="action_removevideo" />
         <input type="hidden" value="{$answers[i].VID}" name="VID" />
         <input type="hidden" value="Remove Video" name="remove_video" />
         <input type="image" src="{$imgurl}/btn_remove.gif" onclick="return confirm('Are you sure you want to remove this video?');" alt="Remove Video" />
				</div>
				</form>
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