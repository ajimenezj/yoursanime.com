     <div id="rightcontent">

       {include file="siteadmin/nuevo_errmsg.tpl"}
       <div id="right">
        <div align="center">
        <h2>Langauges</h2>
        <div id="simpleForm">
	<form name="new_language" method="POST" action="nuevo.php?m=languagenew">
        <fieldset style="font-size:11px">
        <legend>Switch language</legend>
	<label>Language filename:</label>
	<input type="text" name="lang" value="{$lang}" maxlength="5" class="small" /><br />
	<label>&nbsp;</label>
	<table><tr><td>
	Keep filename 5 characters long, accodring to language filenames of your script, eg. 'fr_FR' 'ru_RU' 'es_ES'
	</td></tr></table>
	</fieldset>

        <fieldset style="font-size:11px">
        <legend>Edit language</legend>
	    <label>&nbsp;</label>
	    <table><tr><td>
	    Fields not filled will be saved with default "English" values.
	    </td></tr></table>
	    <br /><br />

	    {foreach from=$data item=lng}

            <label for="title">{$lng.def}</label>
	    <input type="hidden" name="def" value="{$lng.def}" />
            <input type="text" name="{$lng.key}" class="large" maxlength="250" value="{$lng.val}" /><br />
	    {/foreach}
	</fieldset>
	
	<div style="text-align: center;">
	    <input type="submit" name="create" value="Create New Language" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>
