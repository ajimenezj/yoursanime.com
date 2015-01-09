<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='invite.invite'}</h1>
		 </div>
		 <div id="textBoxInfo">
		 <h2 class="textBoxSub">Important!</h2>
		 <p>{translate item='invite.info_one'} {$site_name} {translate item='invite.info_two'}</p>
  <form action="{seourl rewrite='invite' url='invite_friends.php'}" method="post">
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="firstname">{translate item='invite.fname'}:</label></td>
		  {if $first_name eq ""}
     <td colspan="2" class="smallCol2"><input maxlength="60" name="first_name" value="{$first_name}" tabindex="1" class="normal" /></td>
      {else}
		 <td colspan="2" class="smallCol2"><input type="hidden" name="first_name" value="{$first_name}">
		    {$first_name}</td>
			{/if}
	 </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="email">{translate item='invite.emails_info'}</label></td>
		 {if $smarty.request.UID eq ""}
			<td colspan="2" class="smallCol2"><textarea id="recipients" name="recipients"  class="large" >{$smarty.request.recipients}</textarea></td>
     {else}
	 		<td colspan="2" class="smallCol2"><input type="hidden" name="UID" value="{$smarty.request.UID}" />
            {insert name=id_to_name assign=uname un=$smarty.request.UID}
            {$uname}
      </td>
	   {/if}
	 </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="detail">{translate item='invite.message_from'}</label></td>
     <td colspan="2" class="smallCol2"><textarea name="message" class="large" >{translate item='invite.message_three'} {$site_name}{translate item='invite.message_four'}</textarea></td>
   </tr>
   <tr> 
	   <td colspan="2"></td>
     <td colspan="2" class="smallCol2"><input type="hidden" value="Send Invite" name="action_invite" />
				<input type="image" src="{$imgurl}/btn_submit.gif" name="Send Invite" /></td>
   </tr>
 </table> 
      </form>		
				
		</div>
		<!-- End Main Box -->
 </div>
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}