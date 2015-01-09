<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='global.signup'}</h1>
		 </div>
		 <div id="textBoxInfo">
		 <h2 class="textBoxSub">{$site_name}</h2>
		 <p>{translate item='signup.new_member_msg'}</p>
       <form id="signup-form" name="signupForm" method="post" action="{seourl rewrite='signup' url='signup.php'}" >
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="username">{translate item='signup.username'}:</label></td>
     <td colspan="2" class="smallCol2"><input type="text" name="username" id="username" tabindex="1" value="{$username}" maxlength="20" class="normal" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="email">{translate item='signup.email'}:</label></td>
     <td colspan="2" class="smallCol2"><input type="text" name="email" id="email" tabindex="2" value="{$email}" class="normal" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="password1">{translate item='signup.password'}:</label></td>
     <td colspan="2" class="smallCol2"><input type="password" name="password1" id="password1" tabindex="3" class="normal" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="password2">{translate item='signup.password_confirm'}:</label></td>
     <td colspan="2" class="smallCol2"><input type="password" name="password2" id="password2" tabindex="4" class="normal" /></td>
   </tr>
	 <tr>
	   <td colspan="2"></td>
		 <td colspan="2" class="smallCol2"><img src="{$baseurl}/captcha.php" width="158" height="60" alt="Visual CAPTCHA"></td>
	 </tr>
	 {if $captcha eq 1}
   <tr>  
     <td colspan="2" class="smallCol"><label for="captcha">{translate item='signup.verification'}:</label></td>
     <td colspan="2" class="smallCol2"><input type="text" name="capcha" tabindex="7" class="normal" /></td>
   </tr>
	 {/if}
   <tr> 
	   <td colspan="2"></td>
     <td colspan="2" class="smallCol2"> {translate item='signup.certify'}<br /></p>
     {translate item='signup.agree'}<br /><br /><input type="hidden" value="Sign Up" name="action_signup">
          <input type="image" src="{$imgurl}/btn_signup.gif" name="submit" class="submitButton" /></td>
   </tr>
 </table> 
      </form>				
		</div>	
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}