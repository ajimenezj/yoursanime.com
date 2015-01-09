  <div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{$gname|escape:'html'} Members</h1>
		 <span class="moreLink">Members {$start_num}-{$end_num} of {$total}</span>
		 </div>
		 <ul>
		 <!-- Members Page List -->
		 {insert name=getfield assign=owner_id field='OID' table='group_own' qfield=GID qvalue=$smarty.request.gid}
		 {section name=i loop=$friends}
		 {if $smarty.session.UID eq $owner_id or $friends[i].approved eq 'yes'}
		  <li class="mainList">
			 <div class="videoThumb">
			 {insert name=id_to_name assign=uname un=$friends[i].MID}
			 <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$friends[i].MID`"}">{insert name=member_img UID=$friends[i].MID}</a>
			 </div>
			 <div class="catTitle">
       <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$friends[i].MID`"}">{$uname}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews">
						 			{if $owner_id == $smarty.session.UID}
                  {if $owner_id != $friends[i].MID}
                  {if $friends[i].approved == 'yes'}
                  <form name="remove_member" method="POST" action="{seourl rewrite="group/`$smarty.request.urlkey`/members/`$smarty.request.gid`" url="gmembers.php?urlkey=`$smarty.request.urlkey`&gid=`$smarty.request.gid`"}">
                  <input type="hidden" name="MID" value="{$friends[i].MID}">
                  <input type="hidden" name="remove_mem" value="Remove Member">
                  <input type="image" src="{$imgurl}/btn_remove.gif" alt="Delete"  />
                  </form>
                  {else}
                  <form name="approve_member" method="POST" action="{seourl rewrite="group/`$smarty.request.urlkey`/members/`$smarty.request.gid`" url="gmembers.php?urlkey=`$smarty.request.urlkey`&gid=`$smarty.request.gid`"}">
                  <input type="hidden" name="MID" value="{$friends[i].MID}">
                  <input type="hidden" name="approve_mem" value="Approve Member">
                  <input type="image" src="{$imgurl}/btn_approve.gif" alt="Approve"  />
                  </form>                  
                  {/if}
                  {/if}
                  {/if}
									</div>
			</div>
			</li>
			{/if}
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