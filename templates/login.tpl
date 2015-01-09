<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">Login</h1>
		 </div>
		 <div id="textBoxInfo">
		 <h2 class="textBoxSub">Not Registered or Forgot Your Password?</h2>
		 <p>If you've not registered please visit <a href="{seourl rewrite='signup' url='signup.php'}" rel="nofollow">Signup</a> or if you've forgotten your password please visits <a href="{seourl rewrite='recoverpassword' url='recoverpass.php'}" rel="nofollow">Recover my password</a></p>
		<form name="loginForm" id="loginForm" method="post" action="{seourl rewrite='login' url='login.php'}">
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="username">{translate item='global.username'}:</label></td>
     <td colspan="2" class="smallCol2"><input type="text" name="username" id="name" tabindex="1" class="normal" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="password">{translate item='global.password'}:</label></td>
      <td colspan="2" class="smallCol2"><input type="password" name="password" id="password" tabindex="2" class="normal" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="remember-me">Remember me:</label></td>
     <td colspan="2" class="smallCol2"><input name="login_remember" type="checkbox" tabindex="3" /></td>
   </tr>
   <tr> 
	   <td colspan="2"></td>
     <td colspan="2" class="smallCol2"> <input type="hidden" name="action_login"  value="Log In" />
					<input type="image" src="images/btn_login.gif" tabindex="5" class="submitButton" /></td>
   </tr>
 </table> 
      </form>			
		</div>
		<!-- End Main Box -->
 </div>
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}