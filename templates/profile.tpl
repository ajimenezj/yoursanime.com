  <div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 {insert name=id_to_name assign=uname un=$UID}
		 <h1 class="mainBoxHeader">{$uname}'s {if $smarty.request.type eq "private"}private videos{else}public videos{/if}</h1>
		 </div>
		 <ul>
		 <!-- Public Video List -->
		 {section name=i loop=$answers}
		 {insert name=comment_count assign=commentcount vid=$answers[i].VID}
		  <li class="mainList">
			  <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}" title="{$answers[i].description|truncate:160|escape:'html'}"><img src="{$tmburl}/{$answers[i].thumb}_{$answers[i].VID}.jpg" id="rotate_{$answers[i].VID}" alt="{$answers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$answers[i].VID`" url="view_video.php?viewkey=`$answers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$answers[i].title}">{$answers[i].title|truncate:55|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="innerViews"><span class="textGlow">{$answers[i].viewnumber}</span> Views</div>
				<div class="innerStars"> {insert name=show_rate assign=vrate rte=$answers[i].rate}{$vrate}
        </div>
				</div>
			</li>
			{/section}
			<!-- End Video List -->
		 </ul> 
		</div>
		<!-- End Main Box -->
		
			  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 {insert name=id_to_name assign=uname un=$UID}
		 <h1 class="mainBoxHeader">{$uname}'s favorites</h1>
		 </div>
		 <ul>
		 <!-- Favourite Video List -->
		 {section name=i loop=$fanswers}
		 {insert name=comment_count assign=commentcount vid=$fanswers[i].VID}
		  <li class="mainList">
			  <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$fanswers[i].VID`" url="view_video.php?viewkey=`$fanswers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$fanswers[i].title}" title="{$fanswers[i].description|truncate:160|escape:'html'}"><img src="{$tmburl}/{$fanswers[i].thumb}_{$fanswers[i].VID}.jpg" id="rotate_{$fanswers[i].VID}" alt="{$fanswers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$fanswers[i].VID`" url="view_video.php?viewkey=`$fanswers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$fanswers[i].title}">{$fanswers[i].title|truncate:55|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="innerViews"><span class="textGlow">{$fanswers[i].viewnumber}</span> Views</div>
				<div class="innerStars"> {insert name=show_rate assign=vrate rte=$fanswers[i].rate}{$vrate}
        </div>
				</div>
			</li>
			{/section}
			<!-- End Video List -->
		 </ul>
		</div>
		<!-- End Main Box -->
		
		 <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 {insert name=id_to_name assign=uname un=$UID}
		 <h1 class="mainBoxHeader">{$uname}'s playlist</h1>
		 </div>
		 <ul>
		 <!-- Public Video List -->
		 {section name=i loop=$panswers}
		 {insert name=comment_count assign=commentcount vid=$panswers[i].VID}
		  <li class="mainList">
			  <div class="videoThumb">
			 <a href="{seourl rewrite="video/`$panswers[i].VID`" url="view_video.php?viewkey=`$panswers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$panswers[i].title}" title="{$panswers[i].description|truncate:160|escape:'html'}"><img src="{$tmburl}/{$panswers[i].thumb}_{$panswers[i].VID}.jpg" id="rotate_{$panswers[i].VID}" alt="{$panswers[i].title}" /></a>
			 </div>
			 <div class="videoTitle">
			 <a href="{seourl rewrite="video/`$panswers[i].VID`" url="view_video.php?viewkey=`$panswers[i].vkey`&page=`$page`&viewtype=`$viewtype`&category=$catgy" clean=$panswers[i].title}">{$panswers[i].title|truncate:55|escape:'html'}</a>
			 </div>
			 <div class="videoInfo">
			  <div class="innerViews"><span class="textGlow">{$panswers[i].viewnumber}</span> Views</div>
				<div class="innerStars"> {insert name=show_rate assign=vrate rte=$panswers[i].rate}{$vrate}
        </div>
				</div>
			</li>
			{/section}
			<!-- End Video List -->
		 </ul>
		</div>
		<!-- End Main Box -->
		
				 <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 {insert name=id_to_name assign=uname un=$UID}
		 <h1 class="mainBoxHeader">{$uname}'s Friends</h1>
		 </div>
		 <ul>
		 <!-- Friend List -->
		  {section name=i loop=$friends} 
          {insert name=id_to_photo assign=photo un=$friends[i].FID}
          {assign var=looprecord value=$smarty.section.i.index}
          {if $looprecord%2 eq 0}{assign var=colorLoop value=""}{else}{assign var=colorLoop value=" blue"}{/if} 
		  <div class="friendlist {$colorLoop}">
              <div class="friendspict"><img src="{$photourl}/{if $photo eq ""}nopic.gif{else}{$photo}{/if}" border="0" width=180 height=135 /></div>
              <div class="friendstat" style="margin-left: 85px;">
		          <p><strong>{if $friends[i].friends_status eq "Confirmed"}<a href="{seourl rewrite="users/`$friends[i].friends_name`" url="uprofile.php?UID=`$friends[i].FID`"}">{$friends[i].friends_name}</a>{else}{$friends[i].friends_name}{/if}</strong></p>                    
				  {if $friends[i].friends_status eq "Confirmed"}
				      {insert name=video_count assign=video uid=$friends[i].FID}
					  {insert name=favour_count assign=favour uid=$friends[i].FID}
					  {insert name=friends_count assign=frnd uid=$friends[i].FID}
					  {insert name=id_to_name assign=uname un=$friends[i].FID}
				  {/if}
                  </p>
              </div>
          </div>          
          {/section}
          
          <!-- End Video List -->
		 </ul>
		</div>
		<!-- End Main Box -->


		
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}