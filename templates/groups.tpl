<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='menu.groups'} {$catgy}</h1>
		 <span class="moreLink">{translate item='menu.groups'} {$start_num} - {$end_num} {translate item='global.of'} {$total}</span>
		 </div>
		 <ul>
		 <!-- Video List -->
		  {section name=i loop=$answers}
        {insert name=group_img assign=groupimg gid=$answers[i].GID tbl=group_vdo}
        {insert name=group_info_count assign=gmemcount tbl=group_mem gid=$answers[i].GID query="and approved='yes'"}
        {insert name=group_info_count assign=gvdocount tbl=group_vdo gid=$answers[i].GID query="and approved='yes'"}
        {insert name=group_info_count assign=gtpscount tbl=group_tps gid=$answers[i].GID query="and approved='yes'"}
        {insert name=gid_to_gurl assign=gurl gid=$answers[i].GID}
		  <li class="wideList">
			 <div class="wideThumb">
			 <a href="{seourl rewrite="group/`$gurl`" url="groups_home.php?urlkey=`$gurl`"}">
			 {if $groupimg eq ""}
			 <img src="{$imgurl}/no_videos_groups.gif" alt="{$answers[i].gname}" />
			 {else}
			 <img src="{$baseurl}/thumb/1_{$groupimg}.jpg" alt="{$answers[i].gname}" />
			 {/if}
			 </a>
			 </div>
			 <div class="wideTitle">
			  <a href="{seourl rewrite="group/`$gurl`" url="groups_home.php?urlkey=`$gurl`"}">
        {$answers[i].gname}
        </a>
			 </div>
			 <div class="wideInfo">
			  <div class="wideViews">{$answers[i].gdescn|truncate:90}</div>
				<div class="wideViews"><a href="{seourl rewrite="group/`$gurl`/videos/`$answers[i].GID`" url="gvideos.php?urlkey=`$gurl`&gid=`$answers[i].GID`"}">{$gvdocount}</a> <span class="textGlow">Videos</span>
                <a href="{seourl rewrite="group/`$gurl`" url="groups_home.php?urlkey=`$gurl`"}">{$gtpscount}</a> <span class="textGlow">Topics</span>
                <a href="{seourl rewrite="group/`$gurl`/members/`$answers[i].GID`" url="gmembers.php?urlkey=`$gurl`&gid=`$answers[i].GID`"}">{$gmemcount}</a> <span class="textGlow">Members</span>
								</div>
			 </div>
			</li>
			{/section}
			<!-- End Video List -->
		 </ul>
		 <ul id="pagination-flickr">
      	{$page_ink}
</ul> 
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
 <div id="sidebar">
	 <!-- Group Options Box -->
	  <div class="sidebarBox">
		 <div class="sidebarTitle">
		 <h3 class="sidebarBoxHeader">{translate item='global.browse_groups'}</h3>
		 </div>
		 <div class="sidebarInfo">
		  <ul>
			<!-- Group Options List -->
			<li class="optionLink"><a href="{seourl rewrite='usergroups/fr' url='groups.php?b=fr'}">{translate item='groups.featured'}</a></li>
      <li class="optionLink"><a href="{seourl rewrite='usergroups/ra' url='groups.php?b=ra'}">{translate item='groups.recently_added'}</a></li>
      <li class="optionLink"><a href="{seourl rewrite='usergroups/mm' url='groups.php?b=mm'}">{translate item='groups.most_members'}</a></li>
      <li class="optionLink"><a href="{seourl rewrite='usergroups/mv' url='groups.php?b=mv'}">{translate item='groups.most_videos'}</a></li>
      <li class="optionLink"><a href="{seourl rewrite='usergroups/mt' url='groups.php?b=mt'}">{translate item='groups.most_topics'}</a></li>
			<li class="optionLinkGlow"><a href="{seourl rewrite='create/group' url='create_group.php'}">Create Group</a></li>
			<!-- Group Options List -->
		  </ul>
		 </div>
		</div>
	 <!-- End Group Options Box -->
	 </div>
	</div>
<!-- End Page -->