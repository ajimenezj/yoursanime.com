<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">Friend Accept</h1>
		 </div>
		 <div id="textBoxInfo">
		 {if $AID ne ""}
     {insert name=id_to_name assign=uname un=$UID}
		 <h2 class="textBoxSub">Friend Invitation From {$uname}</h2>
		 <p>Accept thisinvitation if you know this user and wish to share videos with each other.</p>
     <p>User: <a href="{$baseurl}/uprofile.php?UID={$smarty.session.UID}">{$smarty.session.USERNAME}
     </a></p>
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol2">
		 <form action="{$baseurl}/friend_accept.php" method="post">
     <input type="hidden" value="150E0406E61EE03D" name="friend_link_id" />
		 <input type="hidden" value="{$AID}" name="AID" />
     <input type="hidden" value="Yes, I want to share videos." name="friend_accept" />
     <input type="image" src="images/btn_yes.gif" alt="Yes, I want to share videos." />
     </form>
     </td>
     <td colspan="2" class="smallCol2">
		 <form onsubmit="return confirm('Are you sure you want to deny this friend request?');"
action="{$baseurl}/friend_accept.php" method="post">
     <input type="hidden" value="{$AID}" name="AID" />
     <input type="hidden" value="No thanks." name="friend_deny" />
     <input type="image" src="images/btn_no.gif" alt="No Thanks" />
     </form>
		 </td>
   </tr>
 </table> 
 {else}
 <p class="notFound">There seems to have been an error! Please try again</p>
 {/if}		
		</div>
		<!-- End Main Box -->
 </div>
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}