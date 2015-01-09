     <div id="rightcontent">
        {include file="siteadmin/nuevo_errmsg.tpl"}
        <div id="searchForm">
            <form name="search_ads" method="POST" action="nuevo.php?m=labelnew">
            <table width="100%" cellpadding="0" cellspacing="5" border="0">
	    <tr>
		<td colspan="6" align="left" valign="bottom">
		    <input type="submit" name="new_ad" value=" -- Create New Message -- " class="button" style="margin-left:15px;">
		</td>
	    </tr>
            </table>
            </form>
        </div>
        {if $total_ads >= 1}
        <div id="paging">
            <div class="pagingnav">{$paging}</div>
        </div>
        <div class="pagingnav_clear"></div>
        {/if}
        <div id="right">
            <table width="100%" cellspacing="1" cellpadding="3" border="0">
            <tr>
                <td align="center"><b>Id</b></td>
                <td align="center"><b>Message</b></td>
                <td align="center"><b>Active</b></td>
                <td align="center"><b>Date</b></td>
                <td align="center"><b>Actions</b></td>
            </tr>
            {if $labels}
            {foreach from=$labels item=ad}
            <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td align="center">{$ad.ID}</td>
                <td align="left">{$ad.text|truncate:150}</td>
                <td align="center"><b>{if $ad.active == 1}yes{else}no{/if}</b></td>
                <td align="center">{$ad.addtime|date_format}</td>
                <td align="center">
                    <a href="nuevo.php?m=labeledit&ID={$ad.ID}">Edit</a><br>
                    <a href="nuevo.php?m=labels&a=delete&ID={$ad.ID}" onClick="javascript:return confirm('Are you sure you want to delete this player message?');">Delete</a><br>
                    {if $ad.active == '1'}
                    <a href="nuevo.php?m=labels&a=suspend&ID={$ad.ID}">Suspend</a>
                    {else}
                    <a href="nuevo.php?m=labels&a=activate&ID={$ad.ID}">Activate</a>
                    {/if}
                    <br>
                </td>
            </tr>
            {/foreach}
            {else}
            <tr>
                <td colspan="8" align="center"><div class="missing">YOUR SEARCH DID NOT RETURN ANY RESULTS</div></td>
            </tr>
            {/if}
            </table>
        </div>
        {if $total_ads >= 1}
        <div id="paging">
            <div class="pagingnav">{$paging}</div>
        </div>
        {/if}
     </div>