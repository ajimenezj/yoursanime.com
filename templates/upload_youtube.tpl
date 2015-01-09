<script type="text/javascript" src="{$baseurl}/js/upload_youtube.js"></script>
<div id="fullbox">
    {if $upload_page == 'first'}
    <div id="fullbox-title">Upload Youtube (Step 1 of 2)</div>
    <div id="fullbox-content">
        <div class="arrow-general">&nbsp;</div>
        <div class="contentbox">
            <form name="upload_youtube_download" id="uploadForm" method="POST" action="{$baseurl}/upload_youtube.php"
            <div class="fm-req">
                <label for="fm-url">Youtube URL: </label>
                <input name="youtube_url" type="text" value="{$youtube_url}" class="inputtext">
            </div>
            <br>
            <div id="uploadImage" style="display:none;">
            <div class="fm-opt">
                <label for="fm-image">&nbsp;</label>
                <image src="{$imgurl}/ajax-loader.gif">
            </div>
            </div>
            <div id="uploadSubmit">
            <input type="hidden" value="Continue" name="submit_upload_youtube" />
            <div class="submitbutton">
                <input type="image" src="{$imgurl}/btn_submit.gif" class="button" name="submit" onClick="submitUpload('uploadForm', 'uploadImage', 'uploadReset', 'uploadSubmit');"/>
            </div>
            </div>
            <div id="uploadReset" style="display:none;">
            <div class="submitbutton">
                <input type="image" src="{$imgurl}/btn_submit.gif" class="button" name="submit" onClick='window.location="{$baseurl}/upload_youtube.php";'/>
            </div>
            </div>
            </form>
        </div>
    </div>
    {elseif $upload_page == 'second'}
    <div id="fullbox-title">Upload Youtube (Step 2 of 2)</div>
    <div id="fullbox-content">
        <div class="arrow-general">&nbsp;</div>
        <div class="contentbox">
            <form name="upload_youtube_update" method="POST" action="{$baseurl}/upload_youtube.php">
            <input name="VID" type="hidden" value="{$VID}">
            <div class="fm-req">
                <label for="fm-title">{translate item='upload_youtube.title'}:</label>
                <input maxlength="60" size="40" name="video_title" value="{$video.title}" class="inputtext"/>
            </div>
            <div class="fm-opt">
                <label for="fm-desc">{translate item='upload_youtube.desc'}:</label>
                <textarea name="video_desc" rows="4" cols="50" class="inputtext">{$video.desc}</textarea>
            </div>
            <div class="fm-opt">
                <label for="fm-tag">{translate item='upload_youtube.tags'}: </label>
                <input maxlength="120" size="40" name="video_keywords" value="{$video.tags}" class="inputtext"><br><br>
                <div class="formFieldInfo">
                    <strong>{translate item='upload_youtube.tags_help'}</strong><br>
                    {translate item='upload_youtube.tags_desc'}
                </div>
            </div><br><br>
            <div class="fm-req">
                <label for="fm-vidchannel">{translate item='upload_youtube.channels'}:</label>
            </div><br>
            {insert name=list_channel assign=chinfo vid=$VID}
            {section name=i loop=$chinfo}
            <div class="fm-opt">
                <label>&nbsp;</label>
                {if in_array($chinfo[i].id, $video.chlist) }
                    <input type="checkbox" name="video_chlist[]" checked="checked" value="{$chinfo[i].id}"  />
                {else}
                    <input type="checkbox" name="video_chlist[]" value="{$chinfo[i].id}"  />
                {/if}
                {$chinfo[i].ch}
            </div>
            {/section}
            <strong>{translate item='upload_youtube.channels_help'}</strong><br>
            {translate item='upload_youtube.channels_desc'}
            <br>
            <strong>{translate item='upload_youtube.broadcast'}:</strong>
            <div class="fm-opt">
                <label for="fm-title">Public:</label>
                <input name="video_type" type="radio" value="public"{if $video.type == 'public'} checked="checked"{/if} />
                {translate item='upload_youtube.broadcast_public'}
            </div>
            <div class="fm-opt">
                <label for="fm-title">Private:</label>
                <input name="video_type" type="radio" value="private"{if $video.type == 'private'} checked="checked"{/if} />
                {translate item='upload_youtube.broadcast_private'}
            </div>
            <br><br>
            <input name="submit_update_video" type="hidden" value="Continue">
            <div class="submitbutton"><input type="image" src="{$imgurl}/btn_submit.gif" class="button" name="submit"/></div>
            </form>
        </div>
    </div>
    {else}
    <div class="msgbox">{$success}</div>    
    {/if}
</div>
