<script type="text/javascript">
var cm_short="{translate item='comments.comment_short'}";
var cm_long="{translate item='comments.comment_long'}";
var cm_success="{translate item='comments.comment_success'}";
var cm_edit="{translate item='comments.edit_comment'}";
var cm_cancel="{translate item='comments.cancel_comment'}";
var cm_reply="{translate item='comments.reply_comment'}";
var cm_deleted="{translate item='comments.comment_deleted'}";
var cm_dir="{$text_dir}";
var cm_chars="{translate item='comments.chars_left'}";
</script>
{if $isvideocommented ne ""}

<input type="hidden" id="do_smileys" value="{$comm_set.allow_smileys}" />
<input type="hidden" id="max_smileys" value="{$comm_set.max_smileys}" />
<input type="hidden" id="max_length" value="{$comm_set.max_length}" />
<input type="hidden" id="min_length" value="{$comm_set.min_length}" />
<input type="hidden" id="com_total" value="{$total_comments}" />
<input type="hidden" id="ccls" value="comm_even" />

<div id="ultimate_comments">

<div id="comments_id">

 <div id="only_comments">

   {foreach from=$comments item=com}
      {cycle values='comm_even,comm_odd' assign='class'}
      <div class="{$class}" id="coid_{$com.COMID}">
      <input type="hidden" id="comm_cl_{$com.COMID}" value="{$class}" />

	<div class="comm_right">
	   <div class="right_inside">
		
		<div class="comm_icon">
		   
		   <a href="#rate" id="rate_comment_down_{$com.COMID}" class="comm_down" title="">&nbsp;</a>
		   <a href="#rate" id="rate_comment_up_{$com.COMID}" class="comm_up" title="">&nbsp;</a>
		   <span class="rates">
		   <label id="rated_com_{$com.COMID}">
		   {if $com.rate>0}<span class="rate_plus">+{elseif $com.rate<0}<span class="rate_minus">{else}<span class="rate_zero">{/if}{$com.rate}</span> </label>{translate item='comments.comment_votes'}
		   </span>
		</div>

		<div class="comm_links">
		   &nbsp;
		   {if $smarty.session.UID eq $com.UID}
			<a href="#edit" id="show_edit_{$com.COMID}_{$vinfo[0].VID}">{translate item='comments.edit_comment'}</a>
		   {else}
			{if $smarty.session.UID>0}
			   {if $smarty.session.UID eq $vinfo[0].VID}
				<a href="#reply" onclick="alert({translate item='comments.reply_error'})">{translate item='comments.reply_comment'}</a>
			   {else}
				<a href="#reply" id="show_reply_{$com.COMID}_{$vinfo[0].VID}_{$com.COMRP}">{translate item='comments.reply_comment'}</a>
			   {/if}
			{else}
			   <a href="#reply" onclick="alert('{translate item='comments.login_reply'}')">{translate item='comments.reply_comment'}</a>
			{/if}
		   {/if}
     
		   {if ($smarty.session.UID && ($smarty.session.UID eq $vinfo[0].UID)) || $moderator eq '1'}
			&nbsp;<a href="#delete" id="delete_comment_{$com.COMID}_{$com.reply_id}">{translate item='comments.delete_comment'}</a>
		   {/if}
     
		   <span id="reported_spam_{$com.COMID}">
			{if $smarty.session.UID>0}
			   &nbsp;<a href="#report_spam" id="report_spam_video_{$com.COMID}">{translate item='comments.spam_comment'}</a>
			{else}
			   &nbsp;<a href="#report_spam" onclick="alert('{translate item='comments.login_report'}')">{translate item='comments.spam_comment'}</a>
			{/if}
		   </span>

     
		</div>

	   </div>
	</div>

	<div class="comm_left">
	   
	   <div class="{if $com.reply_id > 0}left_reply{else}left_comm{/if}">

		{if $comm_set.photo eq '1'}
		<div class="comm_photo">
		   <a href="{$baseurl}/users/{$com.username}"><img src="{$photourl}/{if !empty($com.photo)}{$com.photo}{else}nopic.jpg{/if}" alt="" /></a>
		</div>
		{/if}

		<div class="comm_content">
		   <span class="comm_date">
		   {if $com.reply_id > 0}{translate item='comments.replied_comment'}: {else}{translate item='comments.posted_comment'}: {/if} {translate item='comments.by_comment'} <a href="{$baseurl}/users/{$com.username}">{$com.username}</a> ({$com.addtime|date_format:'%Y-%m-%d  %H:%M'})</span>
		   <br />
		   <div class="comm_comment" id="comm_{$com.COMID}"{if $text_dir eq 1} style="direction:rtl;text-align:right;"{/if}>{$com.commen|comment:$comm_set.allow_url}</div>
		 </div>
                 <div class="comm_cl"></div>
	   </div>

	   <div style="display:none;" id="box_rep_{$com.COMID}"></div>
	   <div style="display:none;" id="box_edit_{$com.COMID}"></div>

	</div>

	


	<div class="comm_cl"></div>

   </div>
   <div id="in_reply_{$com.COMID}"></div>
   
   
   {/foreach}
   
   
   </div>
   <input type="hidden" id="last_class" value="{$class}" /> 

   {if $total_comments >0}<br />{/if}
   <div id="pagination"{if $total_comments<1} style="display:none;"{/if}>
   <input type="hidden" id="comm_number" value="{$count_comments}" />
   {if $total_comments > $count_comments}<div class="comm_more" id="show_more"><a href="#more" id="more_comments_{$vinfo[0].VID}">{translate item='comments.more_comment'}</a></div>{/if}
   <input type="hidden" id="showing" value="{$limit_comments}" /> 
   </div>

   </div>

   {if $total_comments >0}<br />{/if}
   
   <div id="comments_id2">

   <div id="comm_message"></div>

   <div id="send_area">
   <b>{if $total_comments >0}{translate item='comments.comment_video'}{else}{translate item='comments.first_comment'}{/if}</b>
   <br /><br />
   <label id="char_left">500 {translate item='comments.chars_left'}</label><br />
   <textarea{if $text_dir eq 1} style="direction:rtl;"{/if} id="comment_message" class="comm_area" name="comment_message"></textarea>
   {if $comm_set.allow_smileys eq '1'} {include file="smileys_send.tpl} {/if}
   <br />

   {if $smarty.session.UID ne "" && $smarty.session.EMAILVERIFIED eq "yes"}
         <a href="#send_comment" id="send_comment_{$vinfo[0].VID}" class="comm_button">{translate item='comments.send_comment'}</a>
   {else}
         <a class="comm_link" href="{$baseurl}/login">{translate item='comments.login_comment'}</a>
   {/if}
   </div>

   {if $comm_set.allow_smileys eq '1'}
	{include file="smileys_reply.tpl}
	{include file="smileys_edit.tpl}
   {/if}

   </div>

{/if}

</div>