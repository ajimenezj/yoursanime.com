<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader"> {translate item='menu.groups'}</h1>
		 <span class="moreLink">{translate item='menu.groups'} {$start_num}-{$end_num} {translate item='global.of'} {$total}</span>
		 </div>
		 <ul>
		 <!-- Video List -->
		  {section name=i loop=$answers}
   {insert name=group_img assign=groupimg gid=$answers[i].GID tbl=group_vdo}
      {insert name=group_info_count assign=gmemcount tbl=group_mem gid=$answers[i].GID  query="and approved='yes'"}
      {insert name=group_info_count assign=gvdocount tbl=group_vdo gid=$answers[i].GID  query="and approved='yes'"}
      {insert name=group_info_count assign=gtpscount tbl=group_tps gid=$answers[i].GID  query="and approved='yes'"}
      { insert name=gid_to_gurl assign=gurl gid=$answers[i].GID}
		  <li class="wideList">
			 <div class="wideThumb">
			 <a href="{seourl rewrite="group/`$answers[i].gurl`" url="groups_home.php?urlkey=`$answers[i].gurl`"}">
			 {if $groupimg eq ""}
			 <img src="{$imgurl}/no_videos_groups.gif" alt="{$answers[i].gurl}" />
			 {else}
			 <img src="{$baseurl}/thumb/1_{$groupimg}.jpg" alt="{$answers[i].gurl}" />
			 {/if}
			 </a>
			 </div>
			 <div class="wideTitle">
			  <a href="{seourl rewrite="group/`$answers[i].gurl`" url="groups_home.php?urlkey=`$answers[i].gurl`"}">
        {$answers[i].gname}
        </a>
			 </div>
			 <div class="wideInfo">
			  <div class="wideViews">{$answers[i].gdescn|truncate:90}</div>
				<div class="wideViews"><span class="textGlow">{translate item='global.status'}:</span> {$answers[i].type}
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
 {include file="sidebar.tpl"}
