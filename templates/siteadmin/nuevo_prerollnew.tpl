     <div id="rightcontent">
       {include file="siteadmin/nuevo_errmsg.tpl"}
       <div id="right">
        <div align="center">
        <h2>Random Preroll Ads</h2>
        <div id="simpleForm">
        <form name="new_ad" method="POST" action="nuevo.php?m=prerollnew">
        <fieldset style="font-size:11px">
        <legend>Create new preroll ad</legend>

	    <label for="title">Channel: </label>
	    <select name="channel">
	    <option value="0" selected="selected">All channels</option>
	    {foreach from=$channels item=chan}
		<option value="{$chan.CHID}"{if $ad.channel eq $chan.CHID} selected="selected{/if}">{$chan.name}</option>
	    {/foreach}
	    </select><br />	
	    <label for="title">Ad Owner: </label>
            <input type="text" name="owner" size="40" maxlength="100" value="{$ad.owner}" /> (optional)<br />
	    <label for="title">Ad Owner Email: </label>
            <input type="text" name="email" size="40" maxlength="255" value="{$ad.email}" /> (optional)<br />
            <label for="url">Ad Source URL: </label>
            <input type="text" name="url" size="40" maxlength="255" value="{$ad.url}" /> (jpg, gif, png, flv, mp4)<br />
            <label for="html5">Video URL for HTML5 (mp4, webm or ogg) </label>
            <input type="text" name="html5" size="40" maxlength="255" value="{$ad.html5}" />  (optional)<br />            
	               
	    <label for="link">Link: </label>
	    <input type="text" name="link" size="40" maxlength="100" value="{$ad.link}" /> (max 100 chars)<br />
	    <label for="target">Link window target</label>
            <select name="target">
	    <option value="_blank" selected="selected">New window</option>
	    <option value="_self"{if $ad.target eq '_self'} selected="selected"{/if}>Same window</option>
	    </select><br />
            <label for="skipad">Skip ad option: </label>
	    <input type="text" name="skipad" size="6" maxlength="2" value="{$ad.skipad}" /> (seconds)<br />

            <label for="link">Runtime(for images): </label>
	    <input type="text" name="runtime" size="6" maxlength="3" value="{$ad.runtime}" /><br />
	    <label for="expire">Date expire: </label>	
            {html_options options=$months selected=$ad.month name="month"}&nbsp;-{html_options options=$days selected=$ad.day name="day"}&nbsp;-{html_options options=$years selected=$ad.year name="year"}<br />
	    <label for="active">Active: </label>	
	    <select name="active">
	      <option value="0" selected="selected">No</option>
	      <option value="1"{if $ad.active eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />
	</fieldset>
	<div style="text-align: center;">
            <input type="submit" name="submit" value="Create New Ad" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>
