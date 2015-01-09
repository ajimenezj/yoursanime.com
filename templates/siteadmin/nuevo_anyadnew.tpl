     <div id="rightcontent">
       {include file="siteadmin/nuevo_errmsg.tpl"}
        <div id="right">
        <div align="center">
        <h2>Create any HTML Ad</h2>
        <div id="simpleForm">
        <form name="edit_ad" method="POST" action="nuevo.php?m=anyadnew">
        <fieldset style="font-size:11px">
        <legend>Ad Settings</legend>
	    <label for="ad_name">Ad name</label>
	    <input type="text" class="large" name="ad_name" size="10" maxlength="50" value="{$data.ad_name}" /><br /><br />


	    <label for="ad_typet">Ad Type:</label>
	    <select name="ad_type">
		<option value="pause" selected="selected">On Pause</option>
		<option value="before_pause"{if $data.ad_type eq 'before_pause'} selected="selected"{/if}>Before Video &amp; On Pause</option>
		<option value="before"{if $data.ad_type eq 'before'} selected="selected"{/if}>Before Video Only</option>
	    </select><br />
	    
	    <label for="show_back">Ad before video method</label>
	    <select name="ad_method">
		<option value="click" selected="selected">Click to close</option>
		<option value="timeout"{if $data.ad_method eq 'timeout'} selected="selected"{/if}>Close on timeout</option>
	    </select><br />
	    	    
	    <label for="ad_timer">Ad timeout before video</label>
	    <input type="text" name="ad_timer" size="10" maxlength="2" value="{$data.ad_timer}" /><br />

	    <label for="midroll_start">Midroll display time</label>
	    <input type="text" name="midroll_start" size="10" maxlength="2" value="{$data.midroll_start}" /><br />
	    </fieldset>
	    </fieldset>
	    
        <fieldset style="font-size:11px">
        <legend>Close Ad Settings</legend>
	
	    <label for="ad_closepic">Close button icon</label>
	    <select name="ad_closepic">
		<option value="big" selected="selected">Big rounded</option>
		<option value="small"{if $data.ad_closepic eq 'small'} selected="selected"{/if}>Small Square</option>
	    </select><br />
	    <label for="close_delay">Close button delay</label>
	    <input type="text" name="close_delay" size="10" maxlength="2" value="{$data.close_delay}" /><br />
	    <label></label>Shows close button with delay after amount of seconds. If 0 shows immediately.
	    <br />
	    <label for="close_delaytype">Close delay method</label>
	    <select name="close_delaytype">
	    <option value="0" selected="selected">Only first time</option>
	    <option value="1"{if $data.close_delaytype eq '1'} selected="selected"{/if}>Always</option>
	    </select>
	    <br />	

	</fieldset>
	
        <fieldset style="font-size:11px">
        <legend>General Settings</legend>	
	    <label for="back_color">Background box color</label>
	    <input type="text" name="back_color" size="10" maxlength="6" value="{$data.back_color}" /><br />
	    <label></label>Leave empty for transparent background
	    <br />

	    <label for="back_color">Progressbar color</label>
	    <input type="text" name="progress_color" size="10" maxlength="6" value="{$data.progress_color}" /><br />
	    <label></label>For as before Video and timeout close method
	    <br />


	    <label for="ad_width">Ad width (pixels)</label>
	    <input type="text" name="ad_width" size="10" maxlength="3" value="{$data.ad_width}" /><br />
	    <label for="ad_height">Ad height (pixels)</label>
	    <input type="text" name="ad_height" size="10" maxlength="3" value="{$data.ad_height}" /><br />


	    <label for="ad_content">Ad content (any html/js/flash)</label>
	    <textarea name="ad_content" rows="12">{$data.ad_content}</textarea>
	    <br />
	    <label for="title">Channel: </label>
	    <select name="channel">
	    <option value="0" selected="selected">All channels</option>
	    {foreach from=$channels item=chan}
		<option value="{$chan.CHID}"{if $data.channel eq $chan.CHID} selected="selected{/if}">{$chan.name}</option>
	    {/foreach}
	    </select><br />
	    <label for="expire">Date expire: </label>	
            {html_options options=$months selected=$data.month name="month"}&nbsp;-{html_options options=$days selected=$data.day name="day"}&nbsp;-
	    <select name="year">{foreach from=$years item=yr}<option value="{$yr}"{if $data.year eq $yr} selected="selected"{/if}>{$yr}</option>{/foreach}</select>
	    <br />


	    <label for="active">Active</label>
	    <select name="active">
		<option value="0" selected="selected">No</option>
		<option value="1"{if $data.active eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br /><br />
	</fieldset>

	<div style="text-align: center;">
	    <input type="submit" name="submit" value="Create Ad" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>
