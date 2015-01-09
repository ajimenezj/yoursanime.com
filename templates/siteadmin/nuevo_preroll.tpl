 <div id="rightcontent">
       {include file="siteadmin/nuevo_errmsg.tpl"}
        <div id="searchForm">
            <form name="search" method="POST" action="videos.php?m=rolls">
            <table width="100%" cellpadding="0" cellspacing="5" border="0">
            <tr>
                <td align="right">Sort</td>
                <td>
                    <select name="sort">
                    <option value="owner"{if $option.sort == 'owner'} selected="selected"{/if}>Owner</option>
                    <option value="added"{if $option.sort == 'added'} selected="selected"{/if}>Date added</option>
		    <option value="expire"{if $option.sort == 'expire'} selected="selected"{/if}>Date expire</option>
		    <option value="active"{if $option.sort == 'active'} selected="selected"{/if}>Active</option>
		    <option value="ID"{if $option.sort == 'ID'} selected="selected"{/if}>ID</option>
                    </select>
                </td>
                <td align="right">Order</td>
                <td>
                    <select name="order">
                    <option value="DESC"{if $option.order == 'DESC'} selected="selected"{/if}>DESC</option>
                    <option value="ASC"{if $option.order == 'ASC'} selected="selected"{/if}>ASC</option>
                    </select>
                </td>
                <td align="right">Display</td>
                <td>
                    <select name="display">
                    <option value="10"{if $option.display == '10'} selected="selected"{/if}>10</option>
                    <option value="20"{if $option.display == '20'} selected="selected"{/if}>20</option>
                    <option value="30"{if $option.display == '30'} selected="selected"{/if}>30</option>
                    <option value="40"{if $option.display == '40'} selected="selected"{/if}>40</option>
                    <option value="50"{if $option.display == '50'} selected="selected"{/if}>50</option>
                    <option value="100"{if $option.display == '100'} selected="selected"{/if}>100</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="6" align="center" valign="bottom">
                    <input type="submit" name="search_rolls" value=" -- Search -- " class="button">
                    <input type="reset" name="reset_search" value=" -- Clear -- " class="button">
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
		<td align="center"><b>Channel</b></td>
		<td align="center"><b>URL</b></td>
		<td align="center"><b>Views/Hits</b></td>
		<td align="center"><b>Active</b></td>
                <td align="center"><b>Date</b></td>
                <td align="center"><b>Expire</b></td>
                <td align="center"><b>Actions</b></td>
            </tr>
            {if $ads}
            {foreach from=$ads item=ad}
            <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td align="center">{$ad.ID}</td>
		<td align="center">{$channels[$ad.channel]}</td>
		<td align="left">{$ad.url}</td>
		<td align="center"><b>{$ad.views}</b> / <b>{$ad.hits}</b></td>
		<td align="center"><b>{if $ad.active == 1}yes{else}no{/if}</b></td>
                <td align="center">{$ad.added|date_format}</td>
		<td align="center">{$ad.expire|date_format}</td>
                <td align="center">
                    <a href="nuevo.php?m=prerolledit&ID={$ad.ID}">Edit</a><br>
                    <a href="nuevo.php?m=preroll&a=delete&ID={$ad.ID}" onClick="javascript:return confirm('Are you sure you want to delete this midroll?');">Delete</a><br>
                    {if $ad.active == '1'}
                    <a href="nuevo.php?m=preroll&a=suspend&ID={$ad.ID}">Suspend</a>
                    {else}
                    <a href="nuevo.php?m=preroll&a=activate&ID={$ad.ID}">Activate</a>
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