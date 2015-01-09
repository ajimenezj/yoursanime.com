     <div id="rightcontent">
        {include file="siteadmin/nuevo_errmsg.tpl"}
        <div id="searchForm">
            <form name="search_ads" method="POST" action="nuevo.php?m=anyad">
            <table width="100%" cellpadding="0" cellspacing="5" border="0">
	    <tr>
		<td colspan="6" align="left" valign="bottom">
		    <input type="submit" name="new_ad" value=" -- Create New Ad -- " class="button" style="margin-left:15px;">
		</td>
	    </tr>
            </table>
            </form>
        </div>
        <div id="right">
            <table width="100%" cellspacing="1" cellpadding="3" border="0">
            <tr>
                <td align="center"><b>Id</b></td>
                <td align="center"><b>Name</b></td>
                <td align="center"><b>Active</b></td>
                <td align="center"><b>Date Added</b></td>
		<td align="center"><b>Expires</b></td>
                <td align="center"><b>Actions</b></td>
            </tr>
            {if $total_ads >= 1}
            {foreach from=$ads item=ad}
            <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td align="center">{$ad.ID}</td>
                <td align="center">{$ad.ad_name}</td>
                <td align="center"><b>{if $ad.active == 1}yes{else}no{/if}</b></td>
                <td align="center">{$ad.addtime|date_format}</td>
		<td align="center">{$ad.expire|date_format}</td>
                <td align="center">
                    <a href="nuevo.php?m=anyadedit&ID={$ad.ID}">Edit</a><br>
                    <a href="nuevo.php?m=anyad&a=delete&ID={$ad.ID}" onClick="javascript:return confirm('Are you sure you want to delete this ad?');">Delete</a><br>
                    {if $ad.active == '1'}
                    <a href="nuevo.php?m=anyad&a=suspend&ID={$ad.ID}">Suspend</a>
                    {else}
                    <a href="nuevo.php?m=anyad&a=activate&ID={$ad.ID}">Activate</a>
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
     </div>