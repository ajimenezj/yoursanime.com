  <div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">My Friends</h1>
		 <span class="moreLink">
     <a href="{seourl rewrite="userfriends/name/`$page`" url="friends.php?sort=name"}">Name</a> | <a href="{seourl rewrite="userfriends/date/`$page`" url="friends.php"}">Date</a> 
		 </span>
		 </div>
		 <ul>
		 <!-- Members Page List -->
		 {section name=i loop=$friends}
		  {insert name=id_to_name assign=uname un=$friends[i].FID}
                {insert name=id_to_photo assign=photo un=$friends[i].FID}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$friends[i].FID`"}">{if $friends[i].friends_status eq "Confirmed"}
			 <img src="{$baseurl}/photo/{if $photo eq ""}nopic.gif{else}{$photo}{/if}" alt="{$uname}" />
			 {else}
			 <img src="{$imgurl}/pending.gif" alt="{$uname}" />
			 {/if}
			 </a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$friends[i].FID`"}">{$uname}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"></div>
				<div class="videoStars"></div>
			 </div>
			</li>
			{/section}
			<!-- End Members Page List -->
		 </ul>
		 <ul id="pagination-flickr">
{$browse}
</ul> 
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
	{include file="sidebar.tpl"} 