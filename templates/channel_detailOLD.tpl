  <div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='channel.top_watched_in'} {$answers[0].name}</h1>
		 </div>
		 <ul>
		 <!-- Video List -->
		 {section name=k loop=$mostview}
		 {insert name=show_rate assign=rate rte=$mostview[k].rate}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$mostview[k].VID`" url="view_video.php?viewkey=`$mostview[k].vkey`" clean=$mostview[k].title}"><img src="{$tmburl}/{$mostview[k].thumb}_{$mostview[k].VID}.jpg" alt="{$mostview[k].title}" id="xrotate_{$mostview[k].VID}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$mostview[k].VID`" url="view_video.php?viewkey=`$mostview[k].vkey`" clean=$mostview[k].title}">{$mostview[k].title|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$mostview[k].viewnumber} {translate item='global.views'}</span></div>
				<div class="videoViews"><a href="{seourl rewrite="users/`$mostview[k].username`" url="uprofile.php?UID=`$mostview[k].UID`"}">{$mostview[k].username|escape:'html'}</a></div>
				<div class="videoViews">{$rate}</div>
			 </div>
			</li>
			{/section}
			<!-- End Video List -->
		 </ul>
		</div>
		<!-- End Main Box -->
		 <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h2 class="mainBoxHeader">		 {translate item='channel.recently_added_in'} {$answers[0].name}</h2>
		 </div>
		 <ul>
		 <!-- Video List -->
		 {section name=j loop=$recadd}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$recadd[j].VID`" url="view_video.php?viewkey=`$recadd[j].vkey`" clean=$recadd[j].title}"><img src="{$tmburl}/{$recadd[j].thumb}_{$recadd[j].VID}.jpg" alt="{$recadd[j].title}" id="rotate_{$recadd[j].VID}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$recadd[j].VID`" url="view_video.php?viewkey=`$recadd[j].vkey`" clean=$recadd[j].title}">{$recadd[j].title|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  {insert name=show_rate assign=rate rte=$recadd[j].rate}
			  <div class="videoViews"><span class="textGlow">{$recadd[j].viewnumber} {translate item='global.views'}</span></div>
				<div class="videoViews"><a href="{seourl rewrite="users/`$recadd[j].username`" url="uprofile.php?UID=`$recadd[j].UID`"}">{$recadd[j].username|escape:'html'}</a></div>
				<div class="videoViews">{$rate}</div>
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
	 
	 <div id="sidebar">
	  <!-- Top Users Box -->
	  <div class="sidebarBox">
		 <div class="sidebarTitle">
		 <h3 class="sidebarBoxHeader">Top Users In Category</h3>
		 </div>
		 <div class="sidebarInfo">
		  <ul>
			<!-- members List -->
			{section name=i loop=$actuser}
			{insert name=get_photo assign=imgid uid=$actuser[i].UID}
      {insert name=id_to_name assign=uname un=$actuser[i].UID}
			<li class="membersList">
			 <span class="membersName"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$actuser[i].UID`"}">{$uname}</a></span>
			 <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$actuser[i].UID`"}">{if $imgid ne ""}<img src="{$tmburl}/1_{$imgid}.jpg" alt="{$uname}" />{else}<img src="{$tmburl}/no_videos_groups.gif" alt="{$uname}" />{/if}</a>
			</li>
			{/section}
			<!-- End members List -->
		  </ul>
		 </div>
		</div>
	 <!-- End Top users Box -->
	 {include file="sidebaradvert.tpl"}
	 </div>
	</div>
<!-- End Page -->

