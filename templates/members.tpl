  <div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='menu.community'}</h1>
		 <span class="midLink"><a href="{seourl rewrite='community' url='members.php'}">{translate item='members.all'}</a> | <a href="{seourl rewrite='community/avatar' url='members.php?type=avatar'}">{translate item='members.avatar'}</a></span>
		 <span class="moreLink">{translate item='members.show'} {$start_num}-{$end_num} {translate item='global.of'} {$total}</span>
		 </div>
		 <ul>
		 <!-- Members Page List -->
		 {section name=i loop=$answers}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="users/`$answers[i].username`" url="uprofile.php?UID=`$answers[i].UID`"}" title="{$answers[i].username}"><img src="{$baseurl}/photo/{if $answers[i].photo eq ""}nopic.gif{else}{$answers[i].photo}{/if}" alt="member" /></a>
			 </div>
			 <div class="catTitle">
			 <a href="{seourl rewrite="users/`$answers[i].username`" url="uprofile.php?UID=`$answers[i].UID`"}">{$answers[i].username}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews">{insert name=video_count assign=vdocount uid=$answers[i].UID}{$vdocount} {translate item='global.videos'}</div>
				<div class="videoViews">{$answers[i].profile_viewed} {translate item='members.profile_views'}</div>
			 </div>
			</li>
			{/section}
			<!-- End Members Page List -->
		 </ul>
		 <ul id="pagination-flickr">
{$page_link}
</ul> 
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
	{include file="sidebar.tpl"} 