<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">{translate item='mail.messages'} {translate item='mail.details'}</h1>
		 <span class="moreLink">{translate item='mail.sender'}: <a href="{seourl rewrite="users/`$sender`" url="uprofile.php?UID=`$userid`"}">{$sender}</a></span>
		 </div>
		 <div id="textBoxInfo">
<h2 class="textBoxSub">{$subject}</h2>
<p>{$body}</p>
<p>{$date|date_format:"%A, %B %e, %Y"} at {$date|date_format:"%I:%M:%S %p"}</p>
<p><a href="compose.php?receiver={$sender}&subject=Re: {$subject}">Reply</a></p>
		</div>
		<!-- End Main Box -->
 </div>
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}