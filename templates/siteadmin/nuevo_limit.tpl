     <div id="rightcontent">
       {include file="siteadmin/nuevo_errmsg.tpl"}
       <div id="right">
        <div align="center">
        <h2>Time Watch Limit for not registered users</h2>
        <div id="simpleForm">
        <form name="edit_ad" method="POST" action="nuevo.php?m=limit">
        <fieldset style="font-size:11px">
        <legend>Edit limit settings</legend>
	    <label for="plugin_limit">Use Watch Limit: </label>	
	    <select name="plugin_limit">
	      <option value="0" selected="selected">No</option>
	      <option value="1"{if $data.plugin_limit eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />
	    <label for="limit_start">Watch Limit (seconds): </label>
	    <input type="text" name="limit_start" size="10" maxlength="5" value="{$data.limit_start}" /><br />
	    <label for="limit_media">On limit picture URL (jpg, gif, png): </label>
            <input type="text" name="limit_media" class="large" maxlength="200" value="{$data.limit_media}" /><br />
	    <label for="limit_url">Custom URL on Limit click: </label>
            <input type="text" name="limit_url" class="large" maxlength="200" value="{$data.limit_url}" /><br />
	    <label for="message">&nbsp;</label>
	    <div style="margin-left:20px;font-size:11px;">If not defined - Signup URL used</div><br />	
	</fieldset>

	<div style="text-align: center;">
	    <input type="submit" name="submit" value="Update Watch Limit Settings" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>
