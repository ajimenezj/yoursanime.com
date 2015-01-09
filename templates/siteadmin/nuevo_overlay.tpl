     <div id="rightcontent">
       {include file="siteadmin/nuevo_errmsg.tpl"}
        <div id="searchForm">
            <form name="search_ads" method="POST" action="nuevo.php?m=overlaynew">
            <table width="100%" cellpadding="0" cellspacing="5" border="0">
	    <tr>
		<td colspan="6" align="left" valign="bottom">
		    <input type="submit" name="new_ad" value=" -- Create New Overlay -- " class="button" style="margin-left:15px;">
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
                <td align="center"><b>Title</b></td>
		<td align="center"><b>Source URL</b></td>
                <td align="center"><b>Active</b></td>
		<td align="center"><b>Views/Hits</b></td>
                <td align="center"><b>Date</b></td>
                <td align="center"><b>Actions</b></td>
            </tr>
            {if $ads}
            {foreach from=$ads item=ad}
            <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td align="center">{$ad.ID}</td>
                <td align="left">{$ad.title}</td>
		<td align="left">{$ad.media|truncate:100}</td>
                <td align="center"><b>{if $ad.active == 1}yes{else}no{/if}</b></td>
		<td align="center"><b>{$ad.views}</b> / <b>{$ad.hits}</b></td>
                <td align="center">{$ad.addtime|date_format}</td>
                <td align="center">
                    <a href="nuevo.php?m=overlayedit&ID={$ad.ID}">Edit</a><br>
                    <a href="nuevo.php?m=overlay&a=delete&ID={$ad.ID}" onClick="javascript:return confirm('Are you sure you want to delete this overlay ad?');">Delete</a><br>
                    {if $ad.active == '1'}
                    <a href="nuevo.php?m=overlay&a=suspend&ID={$ad.ID}">Suspend</a>
                    {else}
                    <a href="nuevo.php?m=overlay&a=activate&ID={$ad.ID}">Activate</a>
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