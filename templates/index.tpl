<!-- Page Start -->
	
	<div id="page">
	 <div id="mainContent">
	
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h2 class="mainBoxHeader">{translate item='global.latest_videos'}</h2>
		 <span class="moreLink"><a href="{seourl rewrite='videos' url='video.php?next=watch'}">More</a></span>
		 </div>
		 <ul>
		 <!-- Video List -->
		 {section name=i loop=$footerLatestVideo}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a itemprop="url" href="{seourl rewrite="video/`$footerLatestVideo[i].VID`" url="view_video.php?viewkey=`$footerLatestVideo[i].vkey`" clean=$footerLatestVideo[i].title}"><img itemprop="thumbnail" src="{$tmburl}/{$footerLatestVideo[i].thumb}_{$footerLatestVideo[i].VID}.jpg" itemprop="description" alt="{$footerLatestVideo[i].description}" id="rotate_{$footerLatestVideo[i].VID}_latestvideo" /></a>
			 </div>
			 <div itemprop="name" class="videoTitle">
			 <a href="{seourl rewrite="video/`$footerLatestVideo[i].VID`" url="view_video.php?viewkey=`$footerLatestVideo[i].vkey`" clean=$footerLatestVideo[i].title}">{$footerLatestVideo[i].title|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$footerLatestVideo[i].viewnumber} {translate item='global.views'}</span></div>
				{insert name=id_to_name assign=uname un=$footerLatestVideo[i].UID}
				<div class="videoViews"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$footerLatestVideo[i].UID`"}">{$uname}</a></div>
				<div class="videoViews">{if $footerLatestVideo[i].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$footerLatestVideo[i].rate}
        {$rate}
        {else}
        {translate item='global.not_yet_rated'}
        {/if}
				</div>
			 </div>
			</li>
			{/section}
			<!-- End Video List -->
		 </ul>
		</div>
		<!-- End Main Box -->
		<div class="mainBox">
		<!-- Scrollable Box -->
		 <div class="mainBoxTitle">
		 <h2 class="mainBoxHeader">{translate item='global.recently_viewed'}</h2>
		 </div>
		 <ul>
		 <!-- Video List -->
		 {section name=i loop=$answersWatchedVideo}
		  <li class="mainList">
			 <div class="videoThumb">
			 <a itemprop="url" href="{seourl rewrite="video/`$answersWatchedVideo[i].VID`" url="view_video.php?viewkey=`$answersWatchedVideo[i].vkey`" clean=$answersWatchedVideo[i].title}"><img itemprop="thumbnail" src="{$tmburl}/{$answersWatchedVideo[i].thumb}_{$answersWatchedVideo[i].VID}.jpg" itemprop="description" alt="{$answersWatchedVideo[i].title}" id="rotate_{$answersWatchedVideo[i].VID}_watchedvideo" /></a>
			 </div>
			 <div itemprop="name" class="videoTitle">
			 <a href="{seourl rewrite="video/`$answersWatchedVideo[i].VID`" url="view_video.php?viewkey=`$answersWatchedVideo[i].vkey`" clean=$answersWatchedVideo[i].title}">{$answersWatchedVideo[i].title|truncate:40|escape:'html'}</a>
			  </div>
				 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answersWatchedVideo[i].viewnumber} {translate item='global.views'}</span></div>
				{insert name=id_to_name assign=uname un=$answersWatchedVideo[i].UID}
				<div class="videoViews"><a href="{seourl rewrite="users/`$uname`" url="uprofile.php?UID=`$answersWatchedVideo[i].UID`"}">{$uname}</a></div>
				<div class="videoViews">{if $answersWatchedVideo[i].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$answersWatchedVideo[i].rate}
        {$rate}
        {else}
        {translate item='global.not_yet_rated'}
        {/if}
				</div>
			 </div>
			</li>
			 {/section}                    
			<!-- End Video List -->
		 </ul>
	  </div>
		<!-- End scrollable Box -->
		 <div id="viewBox">
		<!-- Main Box -->
		 
		  <div style="position: static;" id="container-3">
            <ul class="tabs-nav">
                <li class="tabs-selected"><a href="#fragment-1"><span>{translate item='index.featured'}</span></a></li>
                <li class=""><a href="#fragment-2"><span>{translate item='index.top_rated'}</span></a></li>
                <li class=""><a href="#fragment-3"><span>{translate item='index.most_viewed'}</span></a></li>
            </ul>
		
            <div style="" class="tabs-container" id="fragment-1">
               <ul>
		 <!-- Video List -->
		 {section name=i loop=$answers }
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`" clean=$answers[i].title}"><img src="{$tmburl}/{$answers[i].thumb}_{$answers[i].VID}.jpg" alt="{$answers[i].title}" id="rotate_{$answers[i].VID}_featured" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`" clean=$answers[i].title}">{$answers[i].title|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answers[i].viewnumber} {translate item='global.views'}</span></div>
				<div class="videoViews"><a href="{seourl rewrite="users/`$answers[i].username`" url="uprofile.php?UID=`$answers[i].UID`"}">{$answers[i].username}</a></div>
				<div class="videoViews">{if $answers[i].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$answers[i].rate}
        {$rate}
        {else}
        {translate item='global.not_yet_rated'}
        {/if}
				</div>
			 </div>
                         </li>
			 {/section}
			
			<!-- End Video List -->
		 </ul>
            </div>
            <div style="" class="tabs-container tabs-hide" id="fragment-2">
                <ul>
								  <!-- Video List -->
		 {section name=i loop=$answersTopRated }
		  <li class="mainList">
			 <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$answersTopRated[i].VID`" url="view_video.php?viewkey=`$answersTopRated[i].vkey`" clean=$answersTopRated[i].title}"><img src="{$tmburl}/{$answersTopRated[i].thumb}_{$answersTopRated[i].VID}.jpg" alt="{$answersTopRated[i].title}" id="rotate_{$answersTopRated[i].VID}_toprated" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answersTopRated[i].VID`" url="view_video.php?viewkey=`$answersTopRated[i].vkey`" clean=$answersTopRated[i].title}">{$answersTopRated[i].title|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answersTopRated[i].viewnumber} {translate item='global.views'}</span></div>
				<div class="videoViews"><a href="{seourl rewrite="users/`$answersTopRated[i].username`" url="uprofile.php?UID=`$answersTopRated[i].UID`"}">{$answersTopRated[i].username}</a></div>
				<div class="videoViews">{if $answersTopRated[i].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$answersTopRated[i].rate}
        {$rate}
        {else}
        {translate item='global.not_yet_rated'}
        {/if}
				</div>
			 </div>
                         </li>
			 {/section}
								</ul>
            </div>
						 <div style="" class="tabs-container tabs-hide" id="fragment-3">
                <ul>
								 <!-- Video List -->
		   <!-- Video List -->
		 {section name=k loop=$answersMostVideo }
		  <li class="mainList">
			 <div class="videoThumb">
			 <a itemprop="url" href="{seourl rewrite="video/`$answersMostVideo[k].VID`" url="view_video.php?viewkey=`$answersMostVideo[k].vkey`" clean=$answersMostVideo[k].title}"><img itemprop="thumbnail" src="{$tmburl}/{$answersMostVideo[k].thumb}_{$answersMostVideo[k].VID}.jpg" itemprop="description" alt="{$answersMostVideo[k].title}" id="rotate_{$answersMostVideo[k].VID}_mostviewed" /></a>
			 </div>
			 <div itemprop="name" class="videoTitle">
			 <a href="{seourl rewrite="video/`$answersMostVideo[k].VID`" url="view_video.php?viewkey=`$answersMostVideo[k].vkey`" clean=$answersMostVideo[k].title}">{$answersMostVideo[k].title|truncate:40|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="videoViews"><span class="textGlow">{$answersMostVideo[k].viewnumber} {translate item='global.views'}</span></div>
				<div class="videoViews"><a href="{seourl rewrite="users/`$answersMostVideo[k].username`" url="uprofile.php?UID=`$answersMostVideo[i].UID`"}">{$answersMostVideo[k].username}</a></div>
				<div class="videoViews">{if $answersMostVideo[k].ratedby gt "0"}
        {insert name=show_rate assign=rate rte=$answersMostVideo[k].rate}
        {$rate}
        {else}
        {translate item='global.not_yet_rated'}
        {/if}
				</div>
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
	 