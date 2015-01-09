<div id="rightcontent">
        {include file="myadmin/errmsg.tpl"}
        
        
        <div id="searchForm">
            <form name="search_comments" method="POST" action="videos.php?m=comments2">
            <table width="100%" cellpadding="0" cellspacing="5" border="0">
            <tr>
                <td align="right">Comment ID:</td><td><input type="text" name="COMID" value="{$option.COMID}"></td>
		<td align="right">Video ID:</td><td><input type="text" name="VID" value="{$option.VID}"></td>
		<td align="right">User ID:</td><td><input type="text" name="UID" value="{$option.UID}"></td>
                <td align="right">Comment:</td><td><input type="text" name="commen" value="{$option.commen}"></td>
            </tr>
            <tr>
                <td align="right">Sort</td>
                <td>
                    <select name="sort">
                    <option value="VID"{if $option.sort == 'VID'} selected="selected"{/if}>Video ID</option>
		    <option value="COMID"{if $option.sort == 'COMID'} selected="selected"{/if}>Comment ID</option>
		    <option value="UID"{if $option.sort == 'UID'} selected="selected"{/if}>User ID</option>
		    <option value="spam"{if $option.sort == 'spam'} selected="selected"{/if}>Spam number</option>
                    <option value="addtime"{if $option.sort == 'addtime'} selected="selected"{/if}>Date</option>
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
                    <input type="submit" name="search_comments" value=" -- Search -- " class="button">
                    <input type="reset" name="reset_search" value=" -- Clear -- " class="button">
                </td>
            </tr>
            </table>
            </form>
        </div>

        <div id="right">
            <table width="100%" cellspacing="1" cellpadding="3" border="0">
            <tr>
                <td align="center"><b>ComId</b></td>
		<td align="center"><b>VID</b></td>
                <td align="center"><b>Sender</b></td>
                <td align="center"><b>Comment</b></td>
		<td align="center"><b>Spam</b></td>
                <td align="center"><b>Date</b></td>
                <td align="center"><b>Actions</b></td>
            </tr>
            {if $comments}
            {section name=i loop=$comments}
            <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
             
                <td align="center">{$comments[i].COMID}</td>
		<td align="center"><a href="{$basurl}/siteadmin/videos.php?m=edit&VID={$comments[i].VID}">{$comments[i].VID}</a></td>
                {insert name=id_to_name assign=uname un=$comments[i].UID}
		<td><a href="{$basurl}/siteadmin/users.php?m=view&UID={$comments[i].UID}">{$uname}</a> [{$comments[i].UID}]</td>
		<td align="left">{$comments[i].commen}</td>
		<td align="center">{$comments[i].spam}</td>
                <td align="center">{$comments[i].addtime|date_format}</td>
                <td align="center">
                    <a href="videos.php?m=commentedit&VID={$comments[i].VID}&COMID={$comments[i].COMID}&page={$smarty.request.page}">Edit</a>&nbsp;|&nbsp;
                    <a href="videos.php?m=comments2&a=delete&COMID={$comments[i].COMID}&VID={$comments[i].VID}&page={$smarty.request.page}" onClick="javascript:return confirm('Are you sure you want to delete this comment?');">Delete</a><br>
                </td>
            </tr>
            {/section}
            {else}
            <tr>
                <td colspan="7" align="center"><div class="missing">YOUR SEARCH DID NOT RETURN ANY RESULTS</div></td>
            </tr>
            {/if}
            </table>
            </form>
        </div>
        {if $total >= 1}
        <div id="paging">
            <div class="pagingnav">{$paging}</div>
        </div>
        {/if}
     </div>