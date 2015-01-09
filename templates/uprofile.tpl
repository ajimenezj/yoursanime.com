 {literal}
  <script type="text/javascript">
            $(function() {
                $('#container-3').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
            });
   </script>
	{/literal}
	{insert name=id_to_name assign=uname un=$UID}
	<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{$uname}</h1>
		 <span class="moreLink">{translate item='uprofile.last_login'}: {insert name=time_range assign=rtime field=logintime IDFR=UID id=$uanswers[0].UID tbl=signup}
            {$rtime}</span>
		 </div>
		   <ul>
								 <li class="viewVideoInfo">
								 <div class="viewVideoThumb">
									{insert name=id_to_photo assign=uphoto un=$UID}
								  <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$UID`"}"><img src="{$photourl}/{if $uphoto ne ""}{$uphoto}{else}nopic.gif{/if}" width="120" height="90" alt="{$uname}" /></a>
								 </div>
								 </li>
								  <li class="viewVideoInfo">
									 <p class="viewVideoText"><span class="textGlow">{translate item='uprofile.signed_up'}:</span> {insert name=time_range assign=stime field=addtime IDFR=UID id=$uanswers[0].UID tbl=signup}
            {$stime}</p>
									 {if $uanswers[0].fname ne ""}<p class="viewVideoText"><span class="textGlow">{translate item='uprofile.name'}:</span> {$uanswers[0].fname} {$uanswers[0].lname}</p>{/if}
									 {if $uanswers[0].bdate ne "0000-00-00"}<p class="viewVideoText"><span class="textGlow">{translate item='uprofile.age'}:</span> {$profileage}</p>{/if}
		               {if $uanswers[0].gender ne ""}<p class="viewVideoText"><span class="textGlow">{translate item='uprofile.gender'}:</span> {$uanswers[0].gender}</p>{/if}
									 {if $uanswers[0].country ne ""}<p class="viewVideoText"><span class="textGlow">{translate item='uprofile.country'}:</span> {$uanswers[0].country}</p>{/if}
									 {if $uanswers[0].website ne ""}<p class="viewVideoText"><span class="textGlow">{translate item='uprofile.website'}:</span> {$uanswers[0].website}</p>{/if}
		 </li>
		 <li class="viewVideoInfo">
									 {if $uanswers[0].aboutme ne ""}<p class="viewVideoText"><span class="textGlow">{translate item='uprofile.about'}:</span> {$uanswers[0].aboutme}</p>{/if}
		 </li>
		 
		 </ul>
		 
		 
		</div>
		<!-- End Main Box -->
		 <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 {insert name=id_to_name assign=uname un=$UID}
		 <h1 class="mainBoxHeader">{translate item='global.playlists'} {$uname}</h1>
		 <span class="moreLink"><a href="{seourl rewrite="users/`$uname`/playlists" url="uplaylist.php?UID=`$UID`"}">More</a></span>
		 </div>
		 <ul>
                 {if $ptotal gt "0"}
		 <!-- Public Video List -->
		 {section name=i loop=$panswers}
		 {insert name=comment_count assign=commentcount vid=$panswers[i].VID}
		  <li class="mainList">
			  <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$panswers[i].VID`" url="view_video.php?viewkey=`$panswers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$panswers[i].title}"><img src="{$tmburl}/{$panswers[i].thumb}_{$panswers[i].VID}.jpg" id="xrotate_{$panswers[i].VID}" alt="{$panswers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$panswers[i].VID`" url="view_video.php?viewkey=`$panswers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$panswers[i].title}">{$panswers[i].title|truncate:40|escape:'html'}</a>
			 </div>
			  <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$panswers[i].viewnumber} {translate item='global.views'}</span></div>
				{insert name=id_to_name assign=uname un=$panswers[i].UID}
				<div class="videoViews"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$panswers[i].UID`"}">{$uname}</a></div>
				<div class="videoViews">{if $panswers[i].ratedby gt "0"}
        {insert name=show_rate assign=vrate rte=$panswers[i].rate}
        {$vrate}
        {else}
        not yet rated
        {/if}
				</div>
			 </div>
			 
			</li>
			{/section}
			<!-- End Video List -->
                 {else}<p class="notFound">{translate item='global.video_not_found'}</p>{/if}
		 </ul>
		 
		</div>
		<!-- End Main Box -->
		
		
		 <div id="viewBox">
		<!-- Main Box -->
		  <div style="position: static;" id="container-3">
            <ul class="tabs-nav">
                <li class="tabs-selected"><a href="#fragment-1"><span>Videos</span></a></li>
                <li class=""><a href="#fragment-2"><span>Favorites</span></a></li>
                <li class=""><a href="#fragment-3"><span>Friends</span></a></li>
            </ul>
		
            <div style="" class="tabs-container" id="fragment-1">
               <ul>
                 {if $vtotal gt "0"}
		 <!-- Video List -->
		 {section name=i loop=$answers}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}"><img src="{$tmburl}/{$answers[i].thumb}_{$answers[i].VID}.jpg" id="rotate_{$answers[i].VID}" alt="{$answers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}">{$answers[i].title|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answers[i].viewnumber} {translate item='global.views'}</span></div>
				{insert name=id_to_name assign=uname un=$answers[i].UID}
				<div class="videoViews"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$answers[i].UID`"}">{$uname}</a></div>
				<div class="videoViews">{if $answers[i].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$answers[i].rate}
        {$rate}
        {else}
        not yet rated
        {/if}
				</div>
			 </div>
			</li>
			{/section}
			<!-- End Video List -->
                        {else}<p class="notFound">{translate item='global.video_not_found'}</p>{/if}
		 </ul>
		 
        </div>
        <div style="" class="tabs-container" id="fragment-2"> 
				 <ul>
                                 {if $ftotal gt "0"}
		 <!-- Favourite Video List -->
		 {section name=i loop=$fanswers}
		 {insert name=comment_count assign=commentcount vid=$fanswers[i].VID}
		  <li class="mainList">
			  <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$fanswers[i].VID`" url="view_video.php?viewkey=`$fanswers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$fanswers[i].title}"><img src="{$tmburl}/{$fanswers[i].thumb}_{$fanswers[i].VID}.jpg" id="rotate_{$fanswers[i].VID}" alt="{$fanswers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$fanswers[i].VID`" url="view_video.php?viewkey=`$fanswers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$fanswers[i].title}">{$fanswers[i].title|truncate:40|escape:'html'}</a>
			 </div>
			  <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$fanswers[i].viewnumber} {translate item='global.views'}</span></div>
				{insert name=id_to_name assign=uname un=$fanswers[i].UID}
				<div class="videoViews"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$fanswers[i].UID`"}">{$uname}</a></div>
				<div class="videoViews">{if $fanswers[i].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$fanswers[i].rate}
        {$rate}
        {else}
        not yet rated
        {/if}
				</div>
			 </div>
			</li>
			{/section}
			<!-- End Video List -->
                       {else}<p class="notFound">{translate item='global.video_not_found'}</p>{/if}
		 </ul>
		 
				</div>
				<div style="" class="tabs-container" id="fragment-3">
				  
				   <ul>
                   {if $frtotal gt "0"}   
		 <!-- Friend List -->
		   <!-- Members Page List -->
		 {section name=i loop=$friends}
		  {insert name=id_to_photo assign=photo un=$friends[i].FID}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="users/`$friends[i].friends_name`" url="uprofile.php?UID=`$friends[i].FID`"}"><img src="{$photourl}/{if $photo eq ""}nopic.gif{else}{$photo}{/if}" alt="member" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="users/`$friends[i].friends_name`" url="uprofile.php?UID=`$friends[i].FID`"}">{$friends[i].friends_name}</a>
			 </div>
			</li>
			{/section} 
			<!-- End Members Page List -->
          <!-- End Video List -->
                         {else}<p class="notFound">There is no friends found</p>{/if}
		 </ul>
		 
				</div>  
        </div>	
		</div>
		<!-- End Main Box -->
{include file="pageadvert.tpl"}
 </div>
	 <!-- End Main Content Boxes -->
 <div id="sidebar">
 {if $smarty.session.USERNAME ne ''}
 
	 <!-- Group Options Box -->
	  <div class="sidebarBox">
		 <div class="sidebarTitle">
		 <h3 class="sidebarBoxHeader">Profile Options</h3>
		 </div>
		 <div class="sidebarInfo">
		  <ul>
			<!-- Profile Options List -->
			{insert name=is_subscribe assign=status id_to_subscribe=$UID}
			<li class="optionLink"><a href="{seourl rewrite="invite/`$uanswers[0].UID`" url="invite_friends.php?UID=`$uanswers[0].UID`"}">Add To Friends</a></li>
			<li class="optionLink"><a href="{seourl rewrite="compose/`$uanswers[0].username`" url="compose.php?receiver=`$uanswers[0].username`"}">Send Message</a></li>
			{ if $status eq 'off'  }
			<li class="optionLink"><a href="{seourl rewrite="users/`$uanswers[0].username`/subscribe/on/u" url="uprofile.php?subscribe=on&UID=`$UID`&info=u"}">Subscribe</a></li>
			{ elseif  $status eq 'on'}
			<li class="optionLink"><a href="{seourl rewrite="users/`$uanswers[0].username`/subscribe/off/u" url="uprofile.php?subscribe=off&UID=`$UID`&info=u"}">Unsubscribe</a></li>
			{ else }
			<li class="optionLink"><a href="{seourl rewrite="users/`$uanswers[0].username`/subscribe/on/i" url="uprofile.php?subscribe=on&UID=`$UID`&info=i"}">Subscribe</a></li>
			{/if}
			<!-- Profile Options List -->
		  </ul>
		 </div>
		</div>
	 <!-- End Group Options Box -->
	 {/if}
{include file="sidebaradvert.tpl"}
	 </div>
	</div>
<!-- End Page -->
 
