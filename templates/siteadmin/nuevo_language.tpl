     <div id="rightcontent">
{include file="siteadmin/nuevo_errmsg.tpl"}
        <div id="searchForm">
            <form name="search_ads" method="POST" action="nuevo.php?m=languagenew">
            <table width="100%" cellpadding="0" cellspacing="5" border="0">
	    <tr>
		<td colspan="6" align="left" valign="bottom">
		    <input type="submit" name="new_lang" value=" -- Create New Language -- " class="button" style="margin-left:15px;">
		</td>
	    </tr>
            </table>
            </form>
        </div>

       <div id="right">
        <div align="center">
        <h2>Langauges</h2>
        <div id="simpleForm">
	 <form name="new_ad" method="POST" action="nuevo.php?m=language">
        <fieldset style="font-size:11px">
        <legend>Switch language</legend>
        <select name="clang"  onchange="this.form.submit()">
	{foreach from=$languages item=ln}
	  <option value="{$ln}"{if $lang eq $ln} selected="selected"{/if}>{$ln}</option>
	{/foreach}
	</select>
	{if $lang neq 'en_US'}&nbsp;&nbsp;<a href="nuevo.php?m=language&mode=delete&lang={$lang}">Delete language file</a>{/if}

	</fieldset>
	 </form>
        <form name="new_ad" method="POST" action="nuevo.php?m=language">
        <fieldset style="font-size:11px">
        <legend>Edit language</legend>
	    {foreach from=$data item=lng}

            <label for="title">{$lng.def}</label>
            <input type="text" name="{$lng.key}" class="large" maxlength="250" value="{$lng.val}" /><br />
	    {/foreach}
	</fieldset>
	<input type="hidden" name="clang" value="{$lang}" />
	<div style="text-align: center;">
	    <input type="submit" name="update" value="Update Language" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>
