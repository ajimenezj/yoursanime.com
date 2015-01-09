
<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='mail.messages'} // {translate item='mail.details'}</h1>
		 </div>
		 <div id="textBoxInfo">
		 
   <form action="{seourl rewrite='compose' url='compose.php'}" method="POST">
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="receiver">{translate item='mail.to'}:</label></td>
     <td colspan="2" class="smallCol2"><input type="text" name="receiver" maxlength="40" value="{$smarty.request.receiver}" id="receiver" tabindex="1" class="normal" /></td>
   </tr>
	 {if $buddy_name}
	 <tr>  
     <td colspan="2" class="smallCol"><label for="name">{translate item='global.of'}:</label></td>
     <td colspan="2" class="smallCol2"><select name="buddy_name" id="fm-buddyname" class="inputtext">{html_options values=$buddy_name output=$buddy_name selected=$receiver_name}</select></td>
   </tr>
	 {/if}
   <tr>  
     <td colspan="2" class="smallCol"><label for="subject">{translate item='mail.subject'}:</label></td>
      <td colspan="2" class="smallCol2"><input type="text" name="subject" value="{$smarty.request.subject}" maxlength="200" id="subject" tabindex="2" class="normal" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="detail">{translate item='mail.detail'}:</label></td>
     <td colspan="2" class="smallCol2"><textarea name="details" class="large" id="detail" tabindex="2">{$smarty.request.details}</textarea></td>
   </tr>
   <tr> 
	   <td colspan="2"></td>
     <td colspan="2" class="smallCol2"><input type="hidden" name="send" value="Send">
				<input type="image" src="{$imgurl}/btn_sendmsg.gif" alt="Send Email" /></td>
   </tr>
 </table> 
      </form>		
				
		</div>
		<!-- End Main Box -->
 </div>
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}