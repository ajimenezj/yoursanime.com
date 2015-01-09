<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='global.my_groups'}</h1>
		 <span class="moreLink">{translate item='global.groups'} {$start_num}-{$end_num} {translate item='global.of'} {$total}</span>
		 </div>
		 <ul>
		 <!-- Video List -->
		  {section name=i loop=$answers}
    {insert name=group_img assign=groupimg gid=$answers[i].GID tbl=group_vdo}
    {insert name=time_to_date assign=todate tm=$answers[i].gcrtime}
    {insert name=row_count assign=mcnt gid=$answers[i].GID tbl=group_mem}
    {insert name=row_count assign=vcnt gid=$answers[i].GID tbl=group_vdo}
    {insert name=row_count assign=tcnt gid=$answers[i].GID tbl=group_tps}
    {insert name=check_group_own assign=WONID gid=$answers[i].GID}
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