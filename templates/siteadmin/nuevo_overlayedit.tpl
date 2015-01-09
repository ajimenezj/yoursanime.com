     <div id="rightcontent">
       {include file="siteadmin/nuevo_errmsg.tpl"}
        <div id="right">
        <div align="center">
        <h2>Overlay Ads</h2>
        <div id="simpleForm">
        <form name="new_ad" method="POST" action="nuevo.php?m=overlayedit&ID={$ad.ID}">
        <fieldset style="font-size:11px">
        <legend>Edit overlay Ad</legend>               
            <label for="title">Title: </label>
            <input type="text" name="title" size="40" maxlength="80" value="{$ad.title}" /> (max 80 chars)<br />
	    <label for="source">Source URL: </label>
            <input type="text" name="media" size="40" maxlength="250" value="{$ad.media}" /> (jpg, gif, png, swf)<br />
            <label for="url">Click URL: </label>
            <input type="text" name="url" size="40" maxlength="250" value="{$ad.url}" /><br />
            <label for="link">Link target: </label>
	    <select name="target">
	    <option value="_self"{if $ad.target eq '_self'} selected="true|{/if}>_self</option>
	    <option value="_blank"{if $ad.target eq '_blank'} selected="true|{/if}>_blank</option>
	    </select><br />
	    <label for="start">Start time: </label>	
	    <input type="text" name="start" size="10" maxlength="3" value="{$ad.start}" /> (seconds)<br />
	    <label for="title">Channel: </label>
	    <select name="channel">
	    <option value="0" selected="selected">All channels</option>
	    {foreach from=$channels item=chan}
		<option value="{$chan.CHID}"{if $ad.channel eq $chan.CHID} selected="selected{/if}">{$chan.name}</option>
	    {/foreach}
	    </select><br />	   
	    
	    <label for="active">Active: </label>	
	    <select name="active">
	      <option value="0" selected="selected">No</option>
	      <option value="1"{if $ad.active eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />
	</fieldset>
	<div style="text-align: center;">
	    <input type="submit" name="submit" value="Update Overlay Ad" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>
