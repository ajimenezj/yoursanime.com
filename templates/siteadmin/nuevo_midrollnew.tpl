     <div id="rightcontent">
        {include file="siteadmin/nuevo_errmsg.tpl"}
        <div id="right">
        <div align="center">
        <h2>Midrolls</h2>
        <div id="simpleForm">
        <form name="new_ad" method="POST" action="nuevo.php?m=midrollnew">
        <fieldset style="font-size:11px">
        <legend>Create new midroll Ad</legend>               
	    <label for="title">Ad Owner: </label>
            <input type="text" name="owner" size="40" maxlength="100" value="{$midroll.owner}" /> (optional)<br />
	    <label for="title">Ad Owner Email: </label>
            <input type="text" name="email" size="40" maxlength="255" value="{$midroll.email}" /> (optional)<br />
	    <label for="title">Channel: </label>
	    <select name="channel">
	    <option value="0" selected="selected">All channels</option>
	    {foreach from=$channels item=chan}
		<option value="{$chan.CHID}"{if $midroll.channel eq $chan.CHID} selected="selected{/if}">{$chan.name}</option>
	    {/foreach}
	    </select><br />
            <label for="duration">Duration: </label>
	    <input type="text" name="duration" size="10" maxlength="3" value="{if !empty($midroll.duration)}{$midroll.duration}{else}3{/if}" /> (min 3 seconds)<br />
            <label for="title">Title: </label>
            <input type="text" name="title" size="40" maxlength="80" value="{$midroll.title}" /> (max 80 chars)<br />
            <label for="desc">Description: </label>
            <input type="text" name="description" size="40" maxlength="150" value="{$midroll.description}" /> (max 50 chars)<br />
            <label for="url">Click URL: </label>
            <input type="text" name="url" size="40" maxlength="255" value="{$midroll.url}" /><br />
            <label for="link">Display link: </label>
	    <input type="text" name="link" size="40" maxlength="100" value="{$midroll.link}" /> (max 100 chars)<br />
	    <label for="image">Banner URL: </label>	
	    <input type="text" name="image" size="50" maxlength="255" value="{$midroll.image}" /><br /><br />
	    <label for="expire">Date expire: </label>	
            {html_options options=$months selected=$midroll.month name="month"}&nbsp;-{html_options options=$days selected=$midroll.day name="day"}&nbsp;-{html_options options=$years selected=$midroll.year name="year"}<br />
	    <label for="active">Active: </label>	
	    <select name="active">
	      <option value="0" selected="selected">No</option>
	      <option value="1"{if $midroll.active eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />
	</fieldset>
	<div style="text-align: center;">
            <input type="hidden" name="type" value="midroll" />
	    <input type="submit" name="submit" value="Create Midroll Ad" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>
