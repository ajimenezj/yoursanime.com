     <div id="rightcontent">
        {include file="siteadmin/errmsg.tpl"}
        <div id="searchForm">
            <form name="search_groups" method="POST" action="groups.php?m={$module}">
            <table width="100%" cellpadding="0" cellspacing="5" border="0">
            <tr>
                <td align="right">Username:</td><td><input type="text" name="username" value="{$option.username}"></td>
                <td align="right">Name:</td><td><input type="text" name="title" value="{$option.title}"></td>
                <td align="right">Description:</td><td><input type="text" name="description" value="{$option.description}"></td>
            </tr>
            <tr>
                <td align="right">Keyword:</td><td><input type="text" name="keyword" value="{$option.keyword}"></td>
                <td align="right">Channel:</td>
                <td>
                    <select name="channel">
                    {insert assign=channels name=list_channel}
                    <option value="">Select Channel</option>
                    {section name=i loop=$channels}
                    <option value="{$channels[i].id}"{if $channels[i].id == $option.channel } selected="selected"{/if}>{$channels[i].ch}</option>
                    {/section}
                    </select>                                                                                            
                </td>
                <td align="right">Featured:</td>
                <td>
                    <select name="featured">
                    <option value="">---</option>
                    <option value="yes"{if $option.featured == 'yes'} selected="selected"{/if}>Yes</option>
                    <option value="no"{if $option.featured == 'no'} selected="selected"{/if}>No</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="right">Sort</td>
                <td>
                    <select name="sort">
                    <option value="GID"{if $option.sort == 'GID'} selected="selected"{/if}>ID</option>
                    <option value="gname"{if $option.sort == 'gname'} selected="selected"{/if}>Name</option>
                    <option value="type"{if $option.sort == 'type'} selected="selected"{/if}>Type</option>
                    <option value="gcrtime"{if $option.sort == 'gcrtime'} selected="selected"{/if}>Date</option>
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
                    <input type="submit" name="search_groups" value=" -- Search -- " class="button">
                    <input type="submit" name="reset_search" value=" -- Clear -- " class="button">
                </td>
            </tr>
            </table>
            </form>
        </div>
        {if $total_groups >= 1}
        <form name="group_select" method="post" id="group_select" action="groups.php?m={$module}&page={$page}">
        <div id="actions">
            <input type="submit" name="delete_selected_groups" value="Delete" class="action_button" onClick="javascript:return confirm('Are you sure you want to delete all selected groups?');">
            <input type="submit" name="feature_selected_groups" value="Feature" class="action_button" onClick="javascript:return confirm('Are you sure you want to feature all selected groups?');">
            <input type="submit" name="unfeature_selected_groups" value="Unfeature" class="action_button" onClick="javascript:return confirm('Are you sure you want to unfeature all selected groups?');">
        </div>        
        <div id="paging">
            <div class="pagingnav">{$paging}</div>
        </div>
        <div class="pagingnav_clear"></div>
        {/if}                                                    
        <div id="right">
            <table width="100%" cellspacing="1" cellpadding="3" border="0">
            <tr>
                <td align="center"><b><input name="check_all_groups" type="checkbox" id="group_check_all"></b></td>
                <td align="center"><b>Id</b></td>
                <td align="center"><b>Name</b></td>
                <td align="center"><b>Owner</b></td>
                <td align="center"><b>Videos</b></td>
                <td align="center"><b>Members</b></td>
                <td align="center"><b>Topics</b></td>
                <td align="center"><b>Type</b></td>
                <td align="center"><b>Featured</b></td>
                <td align="center"><b>Actions</b></td>
            </tr>
            {if $groups}
            {section name=i loop=$groups}
            {insert name=group_img assign=groupimg gid=$groups[i].GID tbl=group_vdo}
            {insert name=group_info_count assign=gmemcount tbl=group_mem gid=$groups[i].GID query="and approved='yes'"}
            {insert name=group_info_count assign=gvdocount tbl=group_vdo gid=$groups[i].GID query="and approved='yes'"}
            {insert name=group_info_count assign=gtpscount tbl=group_tps gid=$groups[i].GID query="and approved='yes'"}
            {insert name=id_to_name assign=uname un=$groups[i].OID}
            <tr bgcolor="{cycle values="#F8F8F8,#F2F2F2"}">
                <td align="center" width="2%"><input name="group_id_checkbox_{$groups[i].GID}" id="group_checkbox_{$groups[i].GID}" type="checkbox"></td>
                <td align="center">{$groups[i].GID}</td>
                <td align="center">
                    <a href="groups.php?m=view&GID={$groups[i].GID}">{$groups[i].gname|escape:'html'}<br><br>
                    {if $groupimg == ''}
                    <img src="{$imgurl}/no_videos_groups.gif">
                    {else}
                    <img src="{$baseurl}/thumb/1_{$groupimg}.jpg">
                    {/if}
                    </a>
                </td>
                <td align="center"><a href="users.php?m=view&UID={$groups[i].OID}">{$uname}</a></td>
                <td align="center">{if $gvdocount ne '0'}<a href="groups.php?m=videos&GID={$groups[i].GID}"><b>{$gvdocount}</b></a>{else}{$gvdocount}{/if}</td>
                <td align="center">{if $gmemcount ne '0'}<a href="groups.php?m=members&GID={$groups[i].GID}"><b>{$gmemcount}</b></a>{else}{$gmemcount}{/if}</td>
                <td align="center">{if $gtpscount ne '0'}<a href="groups.php?m=topics&GID={$groups[i].GID}"><b>{$gtpscount}</b></a>{else}{$gtpscount}{/if}</td>
                <td align="center">{$groups[i].type}</td>
                <td align="center"><b>{$groups[i].featured}</b></td>
                <td align="center">
                    <a href="groups.php?m=view&GID={$groups[i].GID}">View</a><br>
                    <a href="groups.php?m=edit&GID={$groups[i].GID}">Edit</a><br>
                    <a href="groups.php?m={$module}&a=delete&GID={$groups[i].GID}" onClick="javascript:return confirm('Are you sure you want to delete this group?');">Delete</a><br>
                    {if $groups[i].featured == 'yes'}
                    <a href="groups.php?m={$module}&a=unfeature&GID={$groups[i].GID}" onClick="javascript:return confirm('Are you sure you want to unfeature this group?');">Unfeature</a>
                    {else}
                    <a href="groups.php?m={$module}&a=feature&GID={$groups[i].GID}" onClick="javascript:return confirm('Are you sure you want to feature this group?');">Feature</a>
                    {/if}
                    <br>
                </td>
            </tr>
            {/section}
            {else}
            <tr>
                <td colspan="8" align="center"><div class="missing">YOUR SEARCH DID NOT RETURN ANY RESULTS</div></td>
            </tr>
            {/if}
            </table>
            </form>
        </div>
        {if $total_groups >= 1}
        <div id="paging">
            <div class="pagingnav">{$paging}</div>
        </div>
        <div class="pagingnav_clear"></div>
        {/if}
     </div>