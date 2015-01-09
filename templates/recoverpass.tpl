
<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">Recover Password</h1>
		 </div>
		 <div id="textBoxInfo">
		 <h2 class="textBoxSub">Ooops! Did You Forget Your password?</h2>
     <p>Don't worry we can send out a new password to the email your registered with.  Please just fill in the information below and hit submit.</p>
   <form id="forgotpassword-form" method="post" action="recoverpass.php">
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="email">email:</label></td>
     <td colspan="2" class="smallCol2"><input type="text" name="email" size="22" tabindex="1" id="name" class="normal" /></td>
   </tr>
	 <tr>  
     <td colspan="2"></td>
     <td colspan="2" class="smallCol2"><input type="hidden" value="Submit" name="recover" />
			  <input type="image" src="images/btn_submit.gif" class="button" name="submit"/></td>
   </tr>
 </table> 
      </form>		
				
		</div>
		<!-- End Main Box -->
 </div>
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}