<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 {insert name=id_to_name assign=uname un=$topic.UID}
		 <h1 class="mainBoxHeader">Post Group
      <a href="groups_home.php?urlkey={$smarty.request.urlkey}">
        {$gname}
      </a></h1>
		 <span class="moreLink">Author: <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$topic.UID`"}">{$uname}</a></span>
		 </div>
		 <div id="textBoxInfo">
<h2 class="textBoxSub">{$topic.title}</h2>
<p> {if $topic.VID eq '0'}
            <img src="{$imgurl}/no_videos_groups.gif" />
            {else}
            {insert name=getfield assign=view_key field='vkey' table='video' qfield='VID' qvalue=$topic.VID}
            {insert name=getfield assign=view_title field='title' table='video' qfield='VID' qvalue=$topic.VID}
            {insert name=getfield assign=view_VID field='VID' table='video' qfield='VID' qvalue=$topic.VID}
            {insert name=getfield assign=view_thumb field='thumb' table='video' qfield='VID' qvalue=$topic.VID}
            <a href="{seourl rewrite="video/`$view_VID`" url="view_video.php?viewkey=`$view_key`" clean=$view_title}"><img src="{$baseurl}/thumb/{$view_thumb}_{$topic.VID}.jpg" width="120" height="90"></a>
            {/if}</p>
<p>Comments: {$total_post}</p>
<p>Date Added: {$topic.addtime|date_format:"%A, %B %e, %Y, %H:%M %p"}</p>

  
          {section name=i loop=$post}          
           
                  
          
					
					  <li class="comment">
								 <div class="commentUserThumb">
								    {if $post[i].VID ne "0"}
                      {insert name=getfield assign=view_key field='vkey' table='video' qfield='VID' qvalue=$post[i].VID}
                      {insert name=getfield assign=view_VID field='VID' table='video' qfield='VID' qvalue=$post[i].VID}
                      {insert name=getfield assign=view_title field='title' table='video' qfield='VID' qvalue=$post[i].VID}
                      {insert name=getfield assign=view_thumb field='thumb' table='video' qfield='VID' qvalue=$post[i].VID}
                      <a href="{seourl rewrite="video/`$view_VID`" url="view_video.php?viewkey=`$view_key`" clean=$view_title}">
                        <img src="{$baseurl}/{$view_thumb}_{$post[i].VID}.jpg" />
                      </a>
                      {else}
                      <img src="{$baseurl}/images/no_videos_groups.gif" alt="No Video" />
                     {/if}
								 </div>
								   {insert name=id_to_name assign=uname un=$post[i].UID}
								 <div class="commentDisplay">
								  <p>
										{$post[i].post|escape:'html'}
									</p>
								 <p class="commentInfo">
								 By: <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$post[i].UID`"}">{$uname}</a>
								 Added: {insert name=timediff value=var time=$post[i].date}
								 </p>
								 </div>
								</li>

{/section}


		</div>
		<!-- End Main Box -->
		 </div>
		
		  {if $smarty.session.UID ne ''}
       {insert name=check_group_mem assign=checkmem gid=$smarty.request.gid}
			  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h2 class="mainBoxHeader">Comment On This Group</h2>
		 </div>
		 <ul>
              {if $checkmem ne "0"}
							    <form action="{seourl rewrite="group/`$smarty.request.urlkey`/posts/`$smarty.request.gid`/`$topic.TID`" url="group_posts.php?urlkey=`$smarty.request.urlkey`&gid=`$smarty.request.gid`&tid=`$topic.TID`"}" method="post" name="add_group_topic" id="add_group_topic">
   								<table summary="post comment" id="tableForm">
   								<tr>  
     							<td colspan="2" class="smallCol"><label for="topictitle">Message:</label></td>
     							<td colspan="2" class="smallCol2"><textarea rows="3" cols="55" name="topic_message" id="topictitle" type="text" class="large"></textarea></td>
   								</tr>
									<tr>  
     							<td colspan="2" class="smallCol"><label for="atvideo">Attach a video:</label></td>
     							<td colspan="2" class="smallCol2"><select name="message_video" id="atvideo" class="large">{$video_ops}</select></td>
   								</tr>
									<tr>  
     							<td colspan="2"></td>
     							<td colspan="2" class="smallCol2">
									<input type="hidden" name="GID" value="{$answers[0].GID}" />
                  <input type="hidden" value="Add Message" name="add_message" /> 
									<input type="image" src="{$imgurl}/btn_addtopic.gif" alt="Add Topic" class="submitButton"/>
									</td>
   								</tr>
									</table>
									</form>
                            {else}
                              <p><form name="Joingroup" id="Joingroup" method="post" action="{$baseurl}/groups_home.php?urlkey={$smarty.request.urlkey}">
                                <input type="hidden" name="joingroup" value=" Join to this Group " class="fullboxtext"/>
                                <input type="hidden" name="GRPID" value="{$smarty.request.gid}" class="fullboxtext" />
                              </form>
                              Please <a href="javascript:void(0);" onclick="javascript:document.getElementById('Joingroup').submit();"> join this group </a> to post a topic.
                           </p>{/if} 
						 </ul>
		 </div>				
			{/if}
		

 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}