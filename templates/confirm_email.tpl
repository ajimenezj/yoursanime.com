
<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">Confirm Your Email</h1>
		 </div>
		 <div id="textBoxInfo">
		 <h2 class="textBoxSub">Ooops! Before you can upload you need to confirm your account</h2>
     <p>We have sent out an email with an account activation link to the email address you specified
		 during registration.  Please check your inbox and junk folder for your email.  If you would like to request an additional
		 email sent out as you believe you did not receive it the first time round then click submit.</p>
   <form name="Confirm_email" action="{$baseurl}/confirm_email.php" method="post">
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="email">Send To:</label></td>
     <td colspan="2" class="smallCol2"><input type="text" maxLength="60" size="40" value="{$smarty.session.EMAIL}" name="email readonly" class="normal" /></td>
   </tr>
	 <tr>  
     <td colspan="2"></td>
     <td colspan="2" class="smallCol2"><input type="submit" value="Send Email" name="action_send"></td>
   </tr>
 </table> 
      </form>		
				
		</div>
		<!-- End Main Box -->
 </div>
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}