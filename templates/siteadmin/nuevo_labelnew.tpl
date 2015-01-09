     <div id="rightcontent">
       {include file="siteadmin/nuevo_errmsg.tpl"}
       <div id="right">
        <div align="center">
        <h2>Ticker Messages</h2>
        <div id="simpleForm">
        <form name="new_ad" method="POST" action="nuevo.php?m=labelnew">
        <fieldset style="font-size:11px">
        <legend>Create ticker message</legend>               
            <label for="title">Title: </label>
            <input type="text" name="text" class="large" maxlength="250" value="{$ad.text}" /><br />
	    <label for="start">Start time: </label>	
	    <input type="text" name="start" size="10" maxlength="3" value="{$ad.start}" /> (seconds)<br />
	    <label for="runtime">Runtime: </label>	
	    <input type="text" name="runtime" size="10" maxlength="3" value="{$ad.runtime}" /> (seconds)<br />
	    <label for="opacity">Scroll Speed: </label>	
	    <input type="text" name="scrollspeed" size="10" maxlength="2" value="{$ad.scrollspeed}" /> (1-10)<br />
	    <label for="opacity">Opacity: </label>	
	    <input type="text" name="opacity" size="10" maxlength="3" value="{$ad.opacity}" /> (25-100)<br />
	    <label for="opacity">Position: </label>	
            <select name="position">
		<option value="top" selected="selected">Top</option>
		<option value="bottom"{if $ad.position eq 'bottom'} selected="selected"{/if}>Bottom</option>
	    </select><br />
            <label for="url">Click URL: </label>
            <input type="text" name="url" class="large" maxlength="250" value="{$ad.url}" /><br />
            <label for="url">URL target </label>
            <select name="target">
		<option value="_blank" selected="selected">New window (_blank)</option>
		<option value="_self"{if $ad.target eq '_self'} selected="selected"{/if}>Same window (_self)</option>
	    </select><br />
	    <label for="active">Active: </label>	
	    <select name="active">
	      <option value="0" selected="selected">No</option>
	      <option value="1"{if $ad.active eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />
	</fieldset>
	<div style="text-align: center;">
	    <input type="submit" name="submit" value="Create Ticker Message" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>
