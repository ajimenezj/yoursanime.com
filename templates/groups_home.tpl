 
	<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader"> Group <a href="{seourl rewrite="group/`$smarty.request.urlkey`" url="groups_home.php?urlkey=`$smarty.request.urlkey`"}">{$smarty.request.urlkey|escape:'html'}</a></h1>
		 </div>
		   <ul>
			      {insert name=group_info_count assign=gmemcount tbl=group_mem gid=$answers[0].GID query="and approved='yes'"}
            {insert name=group_info_count assign=gvdocount tbl=group_vdo gid=$answers[0].GID query="and approved='yes'"}
            {insert name=group_info_count assign=gtpscount tbl=group_tps gid=$answers[0].GID query="and approved='yes'"}
            {insert name=check_group_mem assign=checkmem gid=$answers[0].GID}
            {insert name=group_img assign=groupimg gid=$answers[0].GID tbl=group_vdo}
								 <li class="viewVideoInfo">
								 <div class="viewVideoThumb">
									 {if $groupimg eq ""}
            	{assign var=imgThumb value="no_videos_groups.gif"}
            	<img height="90" src="{$imgurl}/{$imgThumb}" width="120" alt="{$smarty.request.urlkey|escape:'html'}" />
            {else}
            	{assign var=imgThumb value="1_$groupimg.jpg"}
            	<img height="90" src="{$tmburl}/{$imgThumb}" width="120" alt="{$smarty.request.urlkey|escape:'html'}" />
            {/if}
								 </div>
								 </li>
								  <li class="viewGroupInfo">
									 <p class="viewVideoText"><b>{$answers[0].gname|escape:'html'}</b></p>
									 <p class="viewVideoText">{$answers[0].gdescn|escape:'html'}</p>
									 <p class="viewVideoText"><span class="textGlow">{translate item='global.type'}:</span> {$answers[0].type}</p>
									 <p class="viewVideoText">
									 {if $smarty.session.UID eq $answers[0].OID}
                	 {assign var=memberShipStatus value="You are the owner of this group."} 
              		 {elseif $is_mem eq "no"}
                	 {assign var=memberShipStatus value="Your request is sent to the owner."}
              		 {elseif $is_mem eq "yes"}
                	 {assign var=memberShipStatus value="You are the member of this group."}
              		 {else}
                	 {assign var=memberShipStatus value="You are not the member of this group."}
              		 {/if}
									 <span class="textGlow">{translate item='groups_home.membership_status'}:</span> {$memberShipStatus}
									 </p>
									 <p class="viewVideoText"><span class="textGlow">{translate item='groups_home.created_by'}:</span> {insert name=id_to_name assign=uname un=$answers[0].OID}
             			 <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$answers[0].OID`"}">
                	 {$uname}
		       				 </a></p>
									 <p class="viewVideoText"><span class="textGlow">{translate item='groups_home.url'}:</span> <a href="{seourl rewrite="group/`$smarty.request.urlkey`" url="groups_home.php?urlkey=`$smarty.request.urlkey`"}">{seourl rewrite="group/`$smarty.request.urlkey`" url="groups_home.php?urlkey=`$smarty.request.urlkey`"}</a></p>
									 <p class="viewVideoText"><span class="textGlow">{translate item='global.tags'}:</span> {$answers[0].keyword}</p>
									 <p class="viewVideoText"><span class="textGlow"> {translate item='global.channels'}:</span>
                {insert name=video_channel assign=grpchannel tbl=group_own gid=$answers[0].GID}
                {section name=k loop=$grpchannel}
                	<a href="{seourl rewrite="categories/`$grpchannel[k].CHID`" url="channel_detail.php?chid=`$grpchannel[k].CHID`" clean=$grpchannel[k].name}">{$grpchannel[k].name}</a>
                {/section}</p>
									 
						
		 </li>
		 
		 
		 </ul>
		 
		 
		</div>
		<!-- End Main Box -->
		 <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='groups_home.forum_messages'}</h1>
		 <span class="moreLink">{insert name=topic_count assign=total_topic GID=$answers[0].GID}</span>
		 </div>
		 <ul>
      
		 <!-- Public Video List -->
		 
			 
			  {if $grptps eq ""}
                  	<p>{translate item='groups_home.no_topics'}</p>
                  {else}
                  <table id="tableInbox" cellspacing="0">
									<thead>
                    <tr>
                      <th scope="col">{translate item='groups_home.topics'}</th>
                      <th scope="col">{translate item='groups_home.author'}</th>
                      <th scope="col">{translate item='groups_home.posts'}</th>
                      <th scope="col">{translate item='groups_home.created'}</th>
                      <th scope="col">{translate item='groups_home.last_post'}</th>
                      <th scope="col">&nbsp;</th>
                    </tr>
										</thead>
                    {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$answers[0].GID}
                    {section name=i loop=$grptps}
                    {if $smarty.session.UID eq $owner_id or $grptps[i].approved eq "yes"}
                    {insert name=id_to_name assign=uname un=$grptps[i].UID}
                    {insert name=post_count assign=total_post TID=$grptps[i].TID}
                    {insert name=getfield assign=lastpost field='date' table='group_tps_post' qfield='TID' qvalue=$grptps[i].TID order='order by PID desc'}
                    <tr>
                      <td class=""><a href="{seourl rewrite="group/`$smarty.request.urlkey`/posts/`$answers[0].GID`/`$grptps[i].TID`" url="group_posts.php?urlkey=`$smarty.request.urlkey`&gid=`$answers[0].GID`&tid=`$grptps[i].TID`"}">{$grptps[i].title|truncate:110|escape:'html'}</a></td>
                      <td class=""><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$grptps[i].UID`"}">{$uname}</a></td>
                      <td class="">{$total_post}</td>
                      <td class="">{$grptps[i].addtime|date_format:"%b %e, %Y, %I:%M %p"}</td>
                      <td class="">{if $lastpost eq ""}N/A{else}{insert name=timediff time=$lastpost}{/if}</td>
                      {if $smarty.session.UID eq $owner_id and $grptps[i].approved eq "no"}          
                        <td class="">
                        <form name="apostform{$grptps[i].TID}" id="apostform{$grptps[i].TID}" action="{seourl rewrite="group/`$smarty.request.urlkey`" url="groups_home.php?urlkey=`$smarty.request.urlkey`"}" method="post">
                          <input type="hidden" name="apost_TID" value="Approve" />
                          <input type="image" src="{$imgurl}/btn_approve.gif" alt="Approve"  />
                          <input type="hidden" name="apost_TID" value="{$grptps[i].TID}" />
                        </form>
                        <form name="unapostform{$grptps[i].TID}" id="unapostform{$grptps[i].TID}" action="{seourl rewrite="group/`$smarty.request.urlkey`" url="groups_home.php?urlkey=`$smarty.request.urlkey`"}" method="post">
                          <input type="hidden" name="unapost_TID" value="Delete"/>
                          <input type="image" src="{$imgurl}/btn_remove.gif" alt="Delete"  />
                          <input type="hidden" name="unapost_TID" value="{$grptps[i].TID}" />
        				</form>			
                        </td>
                      {else}
                      	<td class="center">&nbsp;</td>                        
                      {/if}
					</tr>
                    {/if}
                    {/section} 
                  </table>
		 </ul>
		  <ul id="pagination-flickr">
       {$page_link}
     </ul> 
		 {/if}
		</div>
		
		<!-- End Main Box -->
		 <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='groups_home.add_topic'}</h1>
		 </div>
		 <ul>
		  {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$answers[0].GID}
                {if $smarty.session.UID eq $owner_id or $answers[0].gposting ne 'owner_only'}
                	{if $smarty.session.UID ne ''}
                		{if $checkmem ne "0"}
                        	{* ---- Check If User Has Join Group Or Not ----*}
                			{if $is_mem eq "yes"}
                  <form action="{seourl rewrite="group/`$smarty.request.urlkey`" url="groups_home.php?urlkey=`$smarty.request.urlkey`"}" method="post" name="add_group_topic" id="add_group_topic">
   								<table summary="Signup table" id="tableForm">
   								<tr>  
     							<td colspan="2" class="smallCol"><label for="topictitle">{translate item='groups_home.add_topic'}:</label></td>
     							<td colspan="2" class="smallCol2"><textarea rows="3" cols="55" name="topic_title" id="topictitle" type="text" class="large"></textarea></td>
   								</tr>
									<tr>  
     							<td colspan="2" class="smallCol"><label for="atvideo">{translate item='groups_home.attach_video'}:</label></td>
     							<td colspan="2" class="smallCol2"><select name="topic_video" id="atvideo" class="large">{$video_ops}</select></td>
   								</tr>
									<tr>  
     							<td colspan="2"></td>
     							<td colspan="2" class="smallCol2">
									<input type="hidden" name="GID" value="{$answers[0].GID}" />
                  <input type="hidden" value="Add Topic" name="add_topic" /> 
									<input type="image" src="{$imgurl}/btn_addtopic.gif" alt="Add Topic" class="submitButton"/>
									</td>
   								</tr>
									</table>
									</form>
									  {/if}
                            {else}
                              <p><form name="Joingroup" id="Joingroup" method="post" action="{$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}">
                                <input type="hidden" name="joingroup" value=" Join to this Group " class="fullboxtext"/>
                                <input type="hidden" name="GRPID" value="{$smarty.request.gid}" class="fullboxtext" />
                              </form>
                              Please <a href="javascript:void(0);" onclick="javascript:document.getElementById('Joingroup').submit();"> join this group </a> to post a topic.
                           </p>{/if} 
                           {* ---- End Check If User Has Join Group Or Not ----*}
						{else}<p class="notFound">
                          Please <a href="{$baseurl}/signup.php?next=groups_home&amp;add={$add}">Login</a> to post new topic
                        </p>{/if}
                    {/if}
		 </ul>
		 </div>
		 
		 
		 <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='groups_home.recent_videos'}</h1>
		 <span class="moreLink"><a href="{seourl rewrite="group/`$answers[0].gurl`/videos/`$answers[0].GID`" url="gvideos.php?gid=`$answers[0].GID`"}">More</a></span>
		 </div>
		 	 <ul>
      {if $gvideo gt "0"}
		 <!-- Video List -->
		 {section name=i loop=$gvideo}
		 {insert name=comment_count assign=commentcount vid=$gvideo[i].VID}
		  <li class="mainList">
			  <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$gvideo[i].VID`" url="view_video.php?viewkey=`$gvideo[i].vkey`" clean=$gvideo[i].title}"><img src="{$tmburl}/{$gvideo[i].thumb}_{$gvideo[i].VID}.jpg" id="rotate_{$gvideo[i].VID}" alt="{$gvideo[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$gvideo[i].VID`" url="view_video.php?viewkey=`$gvideo[i].vkey`" clean=$gvideo[i].title}">{$gvideo[i].title|truncate:40|escape:'html'}</a></div>
			  <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$gvideo[i].viewnumber} {translate item='global.views'}</span></div>
				{insert name=id_to_name assign=uname un=$gvideo[i].UID}
				<div class="videoViews"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$gvideo[i].UID`"}">{$uname}</a></div>
				<div class="videoViews">{if $gvideo[i].ratedby gt "0"}
        {insert name=show_rate assign=vrate rte=$gvideo[i].rate}
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
		 
		</div>
		<!-- End Main Box -->
		
		
		 <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='groups_home.recent_members'}</h1>
		 <span class="moreLink"><a href="{seourl rewrite="group/`$smarty.request.urlkey`/members/`$answers[0].GID`" url="gmembers.php?gid=`$answers[0].GID`"}">More</a></span>
		 </div>
		 <ul>
       {section name=i loop=$gmember}
			 {insert name=id_to_name assign=uname un=$gmember[i].UID}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$gmember[i].UID`"}">{insert name=member_img UID=$gmember[i].UID}</a>
			 </div>
			 <div class="catTitle">
			 <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$gmember[i].UID`"}">{$uname}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews">{insert name=video_count assign=vdocount uid=$gmember[i].UID}{$vdocount} Videos</div>
				<div class="videoViews">{$gmember[i].profile_viewed} Views</div>
			 </div>
			</li>
			{/section}
		 </ul>
		</div>
		<!-- End Main Box -->
		
		
		
		<!-- End Main Box -->
{include file="pageadvert.tpl"}
 </div>
	 <!-- End Main Content Boxes -->
 <div id="sidebar">
 
 
	 <!-- Group Options Box -->
	  <div class="sidebarBox">
		 <div class="sidebarTitle">
		 <h3 class="sidebarBoxHeader">Group Options</h3>
		 </div>
		 <div class="sidebarInfo">
		  <ul>
			<!-- Profile Options List -->
			{if $smarty.session.UID ne "" and $checkmem ne "0"}
      {if $smarty.session.UID eq $answers[0].OID}
      <li class="optionLink"><a href="{seourl rewrite="group/edit/`$smarty.request.urlkey`" url="my_group_edit.php?urlkey=`$smarty.request.urlkey`"}"><img src="{$imgurl}/btn_editgroup.gif" alt="Edit Group" /></a></li>
      <li class="optionLink"><a href="{seourl rewrite="group/add/video/`$smarty.request.urlkey`/`$answers[0].GID`" url="add_video.php?urlkey=`$smarty.request.urlkey`&amp;gid=`$answers[0].GID`"}"><img src="{$imgurl}/btn_addvideo.gif" alt="Add Videos" /></a></li>
      {else} 
			{if $is_mem eq 'yes'}
      {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$answers[0].GID}
      {if $smarty.session.UID eq $owner_id and $gupload eq "owner_only"}
      <li class="optionLink"><a href="{$baseurl}/add_video.php?urlkey={$smarty.request.urlkey}&amp;gid={$answers[0].GID}"><img src="{$imgurl}/btn_addvideo.gif" alt="Add Videos" /></a></li>
      {/if}
      {if $gupload ne "owner_only"}
      <li class="optionLink"><a href="{$baseurl}/add_video.php?urlkey={$smarty.request.urlkey}&amp;gid={$answers[0].GID}"><img src="{$imgurl}/btn_addvideo.gif" alt="Add Videos" /></a></li>
      {/if}
      <li class="optionLink"><a href="invite_members.php?urlkey={$smarty.request.urlkey}"><img src="{$imgurl}/btn_invitemembers.gif" alt="Invite Members" /></a></li>
      {/if}
      {/if}
      {/if}
			{if $smarty.session.UID ne $answers[0].OID}
      <form name="Joingroup" method="post" action="{seourl rewrite="group/`$smarty.request.urlkey`" url="groups_home.php?urlkey=`$smarty.request.urlkey`"}">
      {if $checkmem eq "0"}
      <li class="optionLink"><input type="hidden" name="joingroup" value=" Join to this Group "/>
      <input type="image" src="{$imgurl}/btn_joingroup.gif" alt="Join Group"  /></li>
      {elseif $is_mem eq "yes"}
      <li class="optionLink"><input type="hidden" name="leavegroup" value=" Leave this Group "/>
      <input type="image" src="{$imgurl}/btn_leavegroup.gif" alt="Leave Group"  /></li>
      {/if}
      <input type="hidden" name="GRPID" value="{$answers[0].GID}"/>
      </form>
      {/if}
			
			<!-- Profile Options List -->
		  </ul>
		 </div>
		</div>
	 <!-- End Group Options Box -->
{include file="sidebaradvert.tpl"}
	 </div>
	</div>
<!-- End Page -->
 
