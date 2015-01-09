  {literal}
  <script type="text/javascript">
            $(function() {
                $('#container-3').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
            });
   </script>
   {/literal}
   {literal}
	<div id="fb-root"></div>
		<script>(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "//connect.facebook.net/es_ES/all.js#xfbml=1&appId=156212591141806";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		</script>
	{/literal}
	<div id="page">
	 <div id="mainContent">
	
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 itemprop="name" class="mainBoxHeader">{$vinfo[0].title|escape:'html'}</h1>
		 <span class="moreLink">{insert name=id_to_name assign=uname un=$UID}<a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$UID`"}">{$uname}</a></span>
		 </div>
		 <ul id ="videoPlayerBg">
		  <li id="videoPlayer">
			{if $vinfo[0].embed_code eq '' || $isyoutube eq '1'}
			{include file="view_video_nuevoplayer.tpl"}
	    {else}
	    {$vinfo[0].embed_code}
	    {/if}
			</li>
		 </ul>
		 		<!-- FACEBOOK LIKE BOTON -->
		<div class="fb-like" data-href="https://www.facebook.com/yoursanime" data-width="300" data-height="300" data-colorscheme="light" data-layout="button_count" data-action="like" data-show-faces="true" data-send="false"></div>
		<!-- FACEBOOK LIKE BOTON -->
		 <ul id="videoUnder">
		  <li itemprop="description" class="videoDesc">
		  {$vinfo[0].description|escape:'html'}
			</li>
			<li class="videoRate">
                    <div id="voteProcess">
                        Rate: <img src="{$imgurl}/tpl_icon_star_empty.gif" onclick="fxRate('{$viewkey}',2,'voteProcess','voteProcessthank','{$VID}')" alt="rate {$viewkey}" />
                        <img src="{$imgurl}/tpl_icon_star_empty.gif" onclick="fxRate('{$viewkey}',4,'voteProcess','voteProcessthank','{$VID}')" alt="rate {$viewkey}" />
                        <img src="{$imgurl}/tpl_icon_star_empty.gif" onclick="fxRate('{$viewkey}',6,'voteProcess','voteProcessthank','{$VID}')" alt="rate {$viewkey}" />
                        <img src="{$imgurl}/tpl_icon_star_empty.gif" onclick="fxRate('{$viewkey}',8,'voteProcess','voteProcessthank','{$VID}')" alt="rate {$viewkey}" />
                        <img src="{$imgurl}/tpl_icon_star_empty.gif" onclick="fxRate('{$viewkey}',10,'voteProcess','voteProcessthank','{$VID}')" alt="rate {$viewkey}" />
                    </div>
                    <div id="voteProcessthank" style='display:none'>Thanks for rating</div>
			</li>
			<li class="videoRate">
			{insert name=show_rate assign=rate rte=$vinfo[0].rate}
			({$vinfo[0].ratedby} {translate item='view_video.votes'}) {$rate}
			</li>
		 </ul>
		</div>
		<!-- End Main Box -->
		 {* {include file="pageadvert.tpl"} *}
		 <div id="viewBox">
		<!-- Main Box -->
		 
		 
		 
		  <div style="position: static;" id="container-3">
            <ul class="tabs-nav">
                <li class="tabs-selected"><a href="#fragment-1"><span>Related Videos</span></a></li>
                <li class=""><a href="#fragment-2"><span>Video Info</span></a></li>
                <li class=""><a href="#fragment-3"><span>Share Videos</span></a></li>
		<li class=""><a href="#fragment-4"><span>Comments</span></a></li>
		<li class=""><a href="#fragment-5"><span>User Videos</span></a></li>
            </ul>
		
            <div style="" class="tabs-container" id="fragment-1">
               <ul>
		 <!-- Video List -->
		 {section name=i loop=$answers}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a itemprop="url" href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}"><img itemprop="thumbnail" src="{$tmburl}/{$answers[i].thumb}_{$answers[i].VID}.jpg" id="xrotate_{$answers[i].VID}" alt="{$answers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}">{$answers[i].title|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answers[i].viewnumber} {translate item='global.views'}</span></div>
				{insert name=id_to_name assign=uname un=$answers[i].UID}
				<div class="videoViews"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$answers[i].UID`"}">{$uname}</a></div>
				<div class="videoViews">{insert name=show_rate assign=rate rte=$answers[i].rate}
        {$rate}</div>
			 </div>
			</li>
			{/section}
			<!-- End Video List -->
		 </ul>
            </div>
            
            
            <div style="" class="tabs-container tabs-hide" id="fragment-2">
                <ul>
								 <li class="viewVideoInfo">
								 <div class="viewVideoThumb">
								  {insert name=id_to_name assign=uname un=$UID}
									{insert name=id_to_photo assign=uphoto un=$UID}
								  <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$UID`"}"><img src="{$photourl}/{if $uphoto ne ""}{$uphoto}{else}nopic.gif{/if}" width="120" height="90" alt="{$uname}" /></a>
								 </div>
								 </li>
								  <li class="viewVideoInfo">
									 <p class="viewVideoText">{translate item='global.from'}: <a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$UID`"}">{$uname}</a></p>
									 <p class="viewVideoText">{translate item='global.added'}: <span class="textGlow">{insert name=id_to_uploaddate assign=DID un=$VID}</span></p>
									 {assign var=viddur value=$vinfo[0].duration}
                   {math equation="$viddur/60" format="%0.0f" assign=minutes}
                   {math equation="$viddur - ($minutes * 60)" format="%0.0f" assign=seconds}
                   {if $seconds < 0}
                   {math equation="$minutes - 1" assign=minutes}
                   {math equation="$seconds + 60" assign=seconds}
                   {/if}
									 <p class="viewVideoText">{translate item='global.runtime'}: <span class="textGlow">{$minutes}m {$seconds}s</span></p>
									 <p class="viewVideoText">{translate item='global.views'}: <span class="textGlow">{$vinfo[0].viewnumber}</span></p>
									 {insert name=comment_count assign=commentcount vid=$vinfo[0].VID}
									 <p class="viewVideoText">{translate item='global.comments'}: <span class="textGlow">{$commentcount}</span></p>
									</li>
									 <li class="viewVideoInfo">
									 <p class="viewVideoText"><a href="{$baseurl}/compose.php?receiver={$uname}">{translate item='view_video.send_pm'} {$uname}</a></p>
									 <p id="addToFavLink" class="viewVideoText"><a href="#addfavour" onclick="fxAddFavorite('addToFavLink', {if $smarty.session.UID ne ''}{$smarty.session.UID}{else}0{/if}, {$vinfo[0].VID}, {$vinfo[0].UID});">Add To Favorites</a></p>
									 <p id="addToFavSuccess" class="specialMessage" style="display:none;">{translate item='view_video.addfav_success'}</p>
		               <p id="addToFavFailed" class="specialMessage" style="display:none;">{translate item='view_video.addfav_failed'}</p>
		               <p id="addToFavAlready" class="specialMessage" style="display:none;">{translate item='view_video.addfav_already'}</p>
		               <p id="addToFavLogin" class="specialMessage" style="display:none;"><a href="{seourl rewrite='login' url='login.php'}">{translate item='view_video.addfav_login'}</a></p>
		               <p id="addToFavOwner" class="specialMessage" style="display:none;">{translate item='view_video.addfav_owner'}</p>
									 <p class="viewVideoText"><a href="#reportVideo" onclick="fxReportVideo({if $smarty.session.UID ne ''}{$smarty.session.UID}{else}0{/if}, {$vinfo[0].VID});">{translate item='view_video.flag_this'}</a></p>
									 <p id="reportVideoLogin" class="specialMessage" style="display:none;">{translate item='view_video.report_login'}</p>
	                 <p id="reportVideoSuccess" class="specialMessage" style="display:none;">{translate item='view_video.report_success'}</p>
	                 <p id="reportVideoFailed" class="specialMessage" style="display:none;">{translate item='view_video.report_failed'}</p>
									 {if $downloads eq 1}<p class="viewVideoText">
                    {if $smarty.session.UID ne ""}
                    <a href="{$flvdourl}/{$vinfo[0].flvdoname}" title="Download">{translate item='view_video.download'}</a>
                    {else}
					          <a href="{seourl rewrite='signup' url='signup.php'}" title="SignUp">{translate item='view_video.download_login'}</a>
					          {/if}
                    </p>{/if}
									 <p class="viewVideoText"><a href="#featureVideo" onclick="fxFeatureVideo({if $smarty.session.UID ne ''}{$smarty.session.UID}{else}0{/if}, {$vinfo[0].VID});">{translate item='view_video.feature_this}!</a></p>
									 <p id="featureVideoLogin" class="specialMessage" style="display:none;">{translate item='view_video.feature_login'}</p>
	                 <p id="featureVideoSuccess" class="specialMessage" style="display:none;">{translate item='view_video.feature_success'}</p>
	                 <p id="featureVideoFailed" class="specialMessage" style="display:none;">{translate item='view_video.feature_failed'}</p>
									</li>
							  
									<li class="viewVideoDetail">
									 <p class="viewVideoTags">{translate item='global.tags'}:
									 {insert name=video_keyword assign=keyword vid=$VID}
                   {section name=j loop=$keyword}
	                 <a href="{seourl rewrite="tags" url="search_result.php?search_id=`$keyword[j]`" clean=$keyword[j]}">{$keyword[j]}</a>
                   {/section}
									 </p>
									  <p class="viewVideoTags">{translate item='view_video.channels}: {insert name=video_channel assign=channel vid=$VID}
                   {section name=k loop=$channel}
          	       <a href="{seourl rewrite="categories/`$channel[k].CHID`" url="channel_detail.php?chid=`$channel[k].CHID`" clean=$channel[k].name}">{$channel[k].name}</a>
                   {/section}
									 </p>
									</li>
								</ul>
            </div>
						 <div style="" class="tabs-container tabs-hide" id="fragment-3">
                <ul>
								<li class="viewTextBox">
								<p class="viewVideoText">{translate item='view_video.url'}:</p>
								<form id="linkForm" name="linkForm" action="#">		
		            <textarea rows="2" cols="3" name="video_link" id="fm-video_link" onclick="javascript:document.linkForm.video_link.focus();document.linkForm.video_link.select();" readonly="readonly">{seourl rewrite="video/`$vinfo[0].VID`" url="view_video.php?viewkey=`$viewkey`" clean=$vinfo[0].title}</textarea>
		            </form>
								</li>
								<li class="viewTextBox">
								<form itemprop="embedUrl" id="embedForm" name="embedForm" action="#">	
								<p class="viewVideoText">{translate item='view_video.embed'}:</p>
								{if $isvideoembabed eq "enabled"}
								<textarea rows="2" cols="2" style="overflow: hidden;" name="video_play" onclick="javascript:document.embedForm.video_play.focus();document.embedForm.video_play.select();" readonly="readonly">{if $vinfo[0].embed_code eq '' || $isyoutube eq '1'}{$embedcode}{else}
		            {$vinfo[0].embed_code}
		            {/if}
								{else}
                <textarea rows="2" cols="2" style="overflow: hidden;" name="videoplay" onclick="javascript:document.linkForm.video_play.focus();document.linkForm.video_play.select();" readonly="readonly">Embed Options Disabled
								{/if}
								</textarea>
                </form>
								</li>
								</ul>
            </div>
						 <div style="" class="tabs-container tabs-hide" id="fragment-4">
               <ul>
		<li id="commentForm" style="text-align:left;display:table;width:100%">

		{include file="view_video_comments.tpl"}<br />
						
		</li>

		</ul>
            </div>
            <div style="" class="tabs-container tabs-hide" id="fragment-5">
                <ul>
		 <!-- Video List -->
		 {section name=i loop=$answersuser}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$answersuser[i].VID`" url="view_video.php?viewkey=`$answersuser[i].vkey`&amp;page=`$smarty.request.page`&amp;viewtype=`$smarty.request.viewtype`&amp;category=`$smarty.request.category`" clean=$answersuser[i].title}"><img src="{$tmburl}/{$answersuser[i].thumb}_{$answersuser[i].VID}.jpg" id="rotate_{$answersuser[i].VID}" alt="{$answersuser[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answersuser[i].VID`" url="view_video.php?viewkey=`$answersuser[i].vkey`&amp;page=`$smarty.request.page`&amp;viewtype=`$smarty.request.viewtype`&amp;category=`$smarty.request.category`" clean=$answersuser[i].title}">{$answersuser[i].title|truncate:40|escape:'html'}</a>
       </div>	
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answersuser[i].viewnumber} {translate item='global.views'}</span></div>
				{insert name=id_to_name assign=uname un=$answersuser[i].UID}
				<div class="videoViews"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$answersusers[i].UID`"}">{$uname}</a></div>
				<div class="videoViews">{insert name=show_rate assign=rate rte=$answers[i].rate}
        {$rate}</div>
			 </div>
			</li>
			{/section}
			<!-- End Video List -->
		 </ul>
            </div>
        </div>
				
		</div>
		<!-- End Main Box -->
		
 </div>
	 <!-- End Main Content Boxes -->
	{include file="sidebar.tpl"}
 
