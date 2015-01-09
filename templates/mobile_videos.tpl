{if $mobile_search != 'Search'}
	{if $curr_count > 0}
	<ul><li class="search"><strong>{$curr_count}</strong> videos found for <strong>"{$mobile_search}"</strong></li></ul>
	{/if} 
{/if}
<ul>
	{if $videos}
	{section name=i loop=$videos}
	<li>
		<div class="left">
			{if $mobile_appmode eq 'true'}
			<embed height="90" width="120" autoplay="false" controller="false" scale="fitin" target="myself" 
			  cache="true" targetcache="true" type="video/quicktime" 
			  href="{$ipodvideo}/{$videos[i].VID}.mp4" src="{$baseurl}/thumb/{$videos[i].VID}.jpg"/>
			{else}
			<a href="{$ipodvideo}/{$videos[i].VID}.mp4"><img src="{$baseurl}/thumb/{$videos[i].VID}.jpg"/></a> 
			{/if}
		</div>
		<div class="divider">
			<div class="right">
				{if $mobile_appmode eq 'true'}
				<span class="title">{$videos[i].title}</span><br/>
				{else}
				<a href="{$ipodvideo}/{$videos[i].VID}.mp4">{$videos[i].title}</a><br/>
				{/if}
				{insert name=duration assign=duration duration=$videos[i].duration}
				<span>Duration: </span><span class="highlight">{$duration}</span><br/>
				{if $mobile_type eq 'popular'}
				<span>Views: </span><span class="highlight">{$videos[i].viewnumber}</span>
				{elseif $mobile_type eq 'rated'}
				{insert name=video_rating assign=rating video=$videos[i].VID}
				<span>Rating: </span><span class="highlight">{$rating}</span>
				{else}
				{insert name=added_ago assign=ago video=$videos[i].VID}
				<span>Added: </span><span class="highlight">{$ago}</span>
				{/if}
			</div>
		</div>
		<div class="clear"></div>
	</li>
	{/section}
	{else}
	<ul><li class="search">No videos found.</li></ul>
	{/if}
</ul>
<div class="pager">
{$tpaging}
<div class="clear"></div>
</div>
