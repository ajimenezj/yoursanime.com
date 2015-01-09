<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">Edit Profile</h1>
		 </div>
		 <div id="textBoxInfo">
		 <h2 class="textBoxSub">Important!</h2>
		 <p>When updating your profile, entering your password for verification purposes is required.  Please make sure you do this otherwise all changes will be lost.</p>
			 
			 <form method="post" enctype="multipart/form-data">
			 <input type="hidden" value="profile_submit" name="command" />
       <input type="hidden" name="prevemail" value="{$answers[0].email}" />
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="email">Email:</label></td>
     <td colspan="2" class="smallCol2"><input maxlength="60" size="30" value="{$answers[0].email}" name="email" class="normal" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="email">Username:</label></td>
     <td colspan="2" class="smallCol2">{$answers[0].username}</td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="password1">Password:</label></td>
     <td colspan="2" class="smallCol2"><input type="password" name="password1" id="password1" tabindex="3" class="normal" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="password2">Confirm Password:</label></td>
     <td colspan="2" class="smallCol2"><input type="password" name="password2" id="password2" tabindex="4" class="normal" /></td>
   </tr>
	 <tr>
	   <td colspan="2" class="smallCol"><label for="playlist">Playlist:</label></td>
		 <td colspan="2" class="smallCol2"> <select name="playlist" class="myprofiletext">
              <option value="Public"{if $answers[0].playlist == 'Public'} selected="selected"{/if}>{translate item='global.public'}</option>
              <option value="Private"{if $answers[0].playlist == 'Private'} selected="selected"{/if}>{translate item='global.private'}</option>
              </select></td>
	 </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="userpic">Avatar:</label></td>
     <td colspan="2" class="smallCol3"><input type="file" name="userpic" class="normal" /></td>
   </tr>
	  <tr>  
     <td colspan="2" class="smallCol"><label for="delete">Delete Avatar:</label></td>
     <td colspan="2" class="smallCol2"><input type="checkbox" name="delete" value="1" class="check" /></td>
   </tr>
   <tr> 
	   <td colspan="2"></td>
     <td colspan="2" class="smallCol2"><img src="{if $answers[0].photo eq ""}photo/nopic.gif{else}{$photourl}/{$answers[0].photo}{/if}" /></td>
   </tr>
	  <tr>  
     <td colspan="2" class="smallCol"><label for="first">First Name:</label></td>
     <td colspan="2" class="smallCol2"><input maxlength="30" size="30" name="fname" value="{$answers[0].fname}" class="normal" /></td>
   </tr>
	   <tr>  
     <td colspan="2" class="smallCol"><label for="last">Last Name:</label></td>
     <td colspan="2" class="smallCol2"><input maxlength="30" size="30" name="lname" value="{$answers[0].lname}" class="normal" /></td>
   </tr>
	   <tr>  
     <td colspan="2" class="smallCol"><label for="birthday">Birthday:</label></td>
     <td colspan="2" class="smallCol2"><select name="month">
              <option>mm</option>
              {$months}
            </select>
						<select name="day">
              <option>dd</option>
              {$days}
            </select>
						<select name="year">
              <option>yyyy</option>
              {$years}
            </select></td>
   </tr>
	   <tr>  
     <td colspan="2" class="smallCol"><label for="gender">Gender:</label></td>
     <td colspan="2" class="smallCol2"><select name="gender">
              <option value="">---</option>
              <option value="Female" {if $answers[0].gender eq "Female"}selected{/if}>Female</option>
              <option value="Male" {if $answers[0].gender eq "Male"}selected{/if}>Male</option>
            </select></td>
   </tr>
	  <tr>  
     <td colspan="2" class="smallCol"><label for="website">Website:</label></td>
     <td colspan="2" class="smallCol2"><input maxlength="255" name="url" value="{$answers[0].website}" class="normal" /></td>
   </tr>
	  <tr>  
     <td colspan="2" class="smallCol"><label for="country">Country:</label></td>
     <td colspan="2" class="smallCol2"><select name="country">
              <option value="">Select Country</option>
              {$country}
            </select></td>
   </tr>
	  <tr>  
     <td colspan="2" class="smallCol"><label for="aboutme">About Me:</label></td>
     <td colspan="2" class="smallCol2"><textarea name="aboutme" rows="5" cols="45" class="large">{$answers[0].aboutme}
    </textarea></td>
   </tr>
	 <tr>  
     <td colspan="2"></td>
     <td colspan="2" class="smallCol2"><input type="hidden" value="Update Profile" name="update_profile" />
	  	<input type="image" src="{$imgurl}/btn_update.gif" class="submitButton" /></td>
   </tr>
 </table> 
      </form>	
			
			
						
		</div>	
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}