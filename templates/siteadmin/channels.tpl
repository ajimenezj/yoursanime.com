     <div id="rightcontent">
        {include file="siteadmin/errmsg.tpl"}
        <div id="searchForm">
            <form name="search_channels" method="POST" action="channels.php">
            <table width="100%" cellpadding="0" cellspacing="5" border="0">
            <tr>
                <td align="right">Sort</td>
                <td>
                    <select name="sort">
                    <option value="CHID"{if $option.sort == 'CHID'} selected="selected"{/if}>ID</option>
                    <option value="name"{if $option.sort == 'name'} selected="selected"{/if}>Name</option>
                    </select>
                </td>
                <td align="right">Order</td>
                <td>
                    <select name="order">
                    <option value="DESC"{if $option.order == 'DESC'} selected="selected"{/if}>DESC</option>
                    <option value="ASC"{if $option.order == 'ASC'} selected="selected"{/if}>ASC</option>
                    </select>
                </td>
                <td colspan="2" align="center">
                    <input type="submit" name="search_channels" value=" -- Search -- " class="button">
                    <input type="reset" name="reset_search" value=" -- Clear -- " class="button">
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
                <td align="center"><b>Description</b></td>
                <td align="center"><b>Videos</b></td>
                <td align="center"><b>Groups</b></td>
                <td align="center"><b>Actions</b></td>
            </tr>
            {if $channels}
            {section name=i loop=$channels}
            {insert name=channel_count assign=count cid=$channels[i].CHID}
            <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td align="center">{$channels[i].CHID}</td>
                <td align="center">
                    <a href="channels.php?m=view&CID={$channels[i].CHID}">{$channels[i].name}<br><br>
                    <img src="{$baseurl}/chimg/{$channels[i].CHID}.jpg" width="70"></a>
                    </td>
                <td align="center">{$channels[i].descrip|wordwrap:40:"<br>":true}</td>
                <td align="center">{if $count[1] != '0'}<a href="videos.php?m=all&CID={$channels[i].CHID}">{$count[1]}{else}0{/if}</a></td>
                <td align="center">{if $count[2] != '0'}<a href="groups.php?m=all&CID={$channels[i].CHID}">{$count[2]}{else}0{/if}</a></td>
                <td align="center">
                    <a href="channels.php?m=view&CID={$channels[i].CHID}">View</a><br>
                    <a href="channels.php?m=edit&CID={$channels[i].CHID}">Edit</a><br>
                    <a href="channels.php?m=list&a=delete&CID={$channels[i].CHID}" onClick="javascript:return confirm('Are you sure you want to delete this channel?');">Delete</a><br>
                </td>
            </tr>
            {/section}
            {else}
            <tr>
                <td colspan="8" align="center"><div class="missing">NO CHANNELS FOUND. CLICK <a href="channels.php?m=add">HERE</a> TO ADD CHANNELS!</div></td>
            </tr>
            {/if}
            </table>
        </div>
     </div>