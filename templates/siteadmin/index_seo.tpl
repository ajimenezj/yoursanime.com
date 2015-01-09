     <div id="rightcontent">
        <div id="messagebox"{if empty($msg)} style=display:none;"{/if}>{$msg}</div>
        <div id="right">
        <div align="center">
        <h2>Seo Settings</h2>
        <div id="simpleForm">
        <form name="system_settings" method="POST" action="index.php?m=seo">
	<fieldset>
	Select page:&nbsp;&nbsp;
	<select name="page" onchange="changeit(this.options[selectedIndex].value);">
	  {foreach from=$seo item=pg}<option value="{$pg.id}"{if $pg.page eq $current} selected="selected"{/if}>{$pg.page}</option>{/foreach}
	</select>
	</fieldset>
        
	{foreach from=$seo item=itm}
	<div id="obj_{$itm.id}"{if $itm.page neq $current} style="display:none;"{/if}>
	<form name="system_settings" method="POST" action="index.php?m=seo">
        <fieldset>
	<legend>{$itm.explain}</legend>
            <input type="hidden" name="id" value="{$itm.id}"/>
	    <input type="hidden" name="page" value="{$itm.page}"/>
	    <input type="hidden" name="explain" value="{$itm.explain}"/>
	    <label for="site_name">Meta title: </label>
            <input type="text" name="title" value="{$itm.title}" class="large"><br>
            <label for="desc">Meta Description: </label>
            <input type="text" name="desc" value="{$itm.description}" class="large"><br>
            <label for="keywords">Meta Keywords: </label>
            <input type="text" name="keywords" value="{$itm.keywords}" class="large"><br>
        </fieldset>
        <div style="text-align: center;"><input type="submit" name="submit_seo" value="Update Seo Settings" class="button"></div>
        </form>
	</div>
	{/foreach}
	</form>
	</div>

        </div>
        </div>
        </div>
     </div>
     
     {literal}
     <script type="text/javascript">
     function changeit(page) {
	document.getElementById('messagebox').style.display='none';
	document.getElementById('obj_'+page).style.display='block';
	for(var i=1;i<=29;i=i+1) {
	   if(i!=page)document.getElementById('obj_'+i).style.display='none';
	}
     }
     </script>
     {/literal}