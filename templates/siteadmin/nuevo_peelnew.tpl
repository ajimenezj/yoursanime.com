     <div id="rightcontent">
        {include file="siteadmin/errmsg.tpl"}
        <div id="right">
        <div align="center">
        <h2>Peel Effect</h2>
        <div id="simpleForm">
        <form name="edit_ad" method="POST" action="nuevo.php?m=peelnew">
        <fieldset style="font-size:11px">
        <legend>Create new peel effect</legend>
   
	    <label for="image">Image source URL (jpg, gif, png): </label>
            <input type="text" name="image" class="large" maxlength="250" value="{$data.image}" /><br />

	    <label for="url">URL to go when peel clicked: </label>
            <input type="text" name="url" class="large" maxlength="250" value="{$data.url}" /><br />

	    <label for="peel_target">Window target: </label>
            <select name="target">
	    <option value="_blank" selected="selected">_blank</option>
	    <option value="_self"{if $data.target == "_self"} selected="selected"{/if}>_self</option>
	    </select>
	    <br />

	    <label for="title">Top title: </label>
            <input type="text" name="title" class="large" maxlength="50" value="{$data.title}" /><br />

	    <label for="subtitle">Subtitle: </label>
            <input type="text" name="subtitle" class="large" maxlength="50" value="{$data.subtitle}" /><br />

	    <label for="active">Active: </label>
	    <select name="active">
	    <option value="0">No</opton>
	    <option value="1"{if $data.active eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br/>
	</fieldset>

	<div style="text-align: center;">
	    <input type="submit" name="submit" value="Create Peel Effect" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>
