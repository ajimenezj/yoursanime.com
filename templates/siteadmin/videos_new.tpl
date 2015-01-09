
     <div id="rightcontent">
        {include file="siteadmin/errmsg.tpl"}
        <div id="right">
        <div align="center">
        <div id="simpleForm">
        <form name="create_video" method="POST" action="">
        <fieldset>
        <legend>Create new video</legend>

		{if empty($vids)}
		  <label for="empty">There are no videos in upload folder.</label><br>
		
		{else}
		<label for="username">Video: </label>
		<select name="new_vid">
		{foreach from=$vids item=nvid}
			<option value="{$nvid}">{$nvid}</option>
		{/foreach}
		</select><br>
		{/if}

		{if $users_count<50 }
		<label for="title">Owner of the video: </label>
                <select name="user">
		{foreach from=$users item=usr}
			<option value="{$usr.UID}"{if $video.uid eq $usr.UID} selected="true"{/if}>{$usr.username}</option>
		{/foreach}
		</select><br>
		{else}
		<label for="title">Owner of the video: </label>
                <input type="text" name="def_user" value="{$def_user}" class="large"><br>
		{/if}

		<label for="title">Title: </label>
		<input type="text" name="title" value="{$video.title|stripslashes|trim|escape}" class="large"><br>
		<label for="description">Description: </label>
		<textarea name="description">{$video.description|stripslashes}</textarea><br>
		<label for="keyword">Keywords (tags): </label>
		<textarea name="keyword">{$video.keyword}</textarea><br>
		<label for="channel">Channel(s): </label>
		<table><tr><td>
		{insert assign=channels name=list_channel}
		{section name=i loop=$channels}
		{if $channels[i].id|in_array:$video.channel }
		<input type="checkbox" name="channel[]" value="{$channels[i].id}" checked="checked">{$channels[i].ch}<br>
		{else}
		<input type="checkbox" name="channel[]" value="{$channels[i].id}">{$channels[i].ch}<br>
		{/if}
		{/section}
		</td></tr></table>
		<label for="type">Type: </label>
		<select name="type">
		<option value="public"{if $video.type == 'public'} selected="selected"{/if}>public</option>
		<option value="private"{if $video.type == 'private'} selected="selected"{/if}>private</option>
		</select><br>
		<label for="active">Active (active): </label>
		<select name="active">
		<option value="1"{if $video.active == '1'} selected="selected"{/if}>Yes</option>
		<option value="0"{if $video.active == '0'} selected="selected"{/if}>No</option>
		</select><br>
		<label for="be_comment">Can be commented? </label>
		<select name="be_comment">
		<option value="yes"{if $video.be_comment == 'yes'} selected="selected"{/if}>Yes</option>
		<option value="no"{if $video.be_comment == 'no'} selected="selected"{/if}>No</option>
		</select><br>
		<label for="be_rated">Can be rated? </label>
		<select name="be_rated">
		<option value="yes"{if $video.be_rated == 'yes'} selected="selected"{/if}>Yes</option>
		<option value="no"{if $video.be_rated == 'no'} selected="selected"{/if}>No</option>
		</select><br>
		<label for="embed">Can be embeded? </label>
		<select name="embed">
		<option value="enabled"{if $video.embed == 'enabled'} selected="selected"{/if}>Yes</option>
		<option value="disabled"{if $video.embed == 'disabled'} selected="selected"{/if}>No</option>
		</select><br><br />
		<label for="remove">Remove source video? </label>
		<select name="remove">
		<option value="no" selected="selected">No</option>
		<option value="yes">Yes</option>
		</select>
		<br />


	</fieldset>
        <div style="text-align: center;">
	    <input type="hidden" name="create_video" value="1" />
            <input type="submit" value="Create Video" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>


