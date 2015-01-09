<div id="sidebar">
   {if $smarty.session.UID eq ""}
	 <!-- Login Box -->
	  <div class="sidebarBox">
		 <div class="sidebarTitle">
		 <h3 class="sidebarBoxHeader">Log In</h3>
		 </div>
		 <div class="sidebarInfo">
		     <form name="loginForm" id="loginForm" method="post" action="{seourl rewrite='login' url='login.php'}">
         <div class="username">
				 <label>{translate item='global.username'}:</label>
				 </div>
				 <div class="usernameBox"> 
          <input type="text" name="username" id="name" tabindex="1" />
         </div>
				 <div class="password">
         <label>{translate item='global.password'}:</label>
				 </div>
				 <div class="passwordBox">  
         <input type="password" name="password" id="password" tabindex="2" />
				 </div><div class="cl"></div>
				 <div class="submitButton">
         <input type="submit" name="action_login" value="Submit" class="sidebarSubmit" tabindex="3" />
         </div>
         </form>
				 <div class="cl"></div>
				 <p class="loginText"><a href="{seourl rewrite='recoverpassword' url='recoverpass.php'}" rel="nofollow">{translate item='global.recover'}</a> or <a href="{seourl rewrite='signup' url='signup.php'}" rel="nofollow">{translate item='global.login'}</a></p>
		 </div>
		</div>
		{else}
	 <!-- End login Box -->
	 <!-- Users Box -->
	  <div class="sidebarBox">
		 <div class="sidebarTitle">
		 <h3 class="sidebarBoxHeader">{translate item='index.my_stats'}</h3>
		 </div>
		 <div class="sidebarInfo">
		  <ul>
			<!-- User info List -->
			{insert name=home_info assign=userinfo}
			{insert name=friends_count assign=frcnt uid=$smarty.session.UID}
			<li class="optionLink">{translate item='global.welcome'} <a href="{seourl rewrite="users/`$smarty.session.USERNAME`" url="uprofile.php?UID=`$smarty.session.UID`"}">{$smarty.session.USERNAME}</a></li>
			<li class="optionLink">{translate item='index.i_have'} <a href="{seourl rewrite='userfriends' url='friends.php'}">{$frcnt}</a> {translate item='index.friends'}</li>
			{if $enable_package eq "yes"}
			<li class="optionLink"><a href="{$baseurl}/my_video.php">{$u_info.total_video}</a> {translate item='videos'}</li>
			<li class="optionLink">{translate item='index.space_used'}: {insert name=format_size size=$u_info.used_space} {translate item='index.out_of'} {insert name=format_size size=$pack.space}</li>
			<li class="optionLink">{translate item='index.bandwidth_used'}: {insert name=format_size size=$u_info.used_bw} {translate item='index.out_of'} {insert name=format_size size=$pack.bandwidth}</li>
			{else}
			<li class="optionLink">{translate item='index.i_have_watched'} {$userinfo[0].watched_video} {translate item='index.videos'}</li>
			<li class="optionLink">{translate item='menu.my_profile'}</a> - {translate item='index.viewed'} {$userinfo[0].profile_viewed} {translate item='index.times'}</li>
			{/if}
			<!-- User info List -->
		  </ul>
		 </div>
		</div>
	 {/if}
	 <!-- End Users Box -->
	 <!-- Stats Box -->
	  <div class="sidebarBox">
		 <div class="sidebarTitle">
		 <h3 class="sidebarBoxHeader">{translate item='index.statistics'}</h3>
		 </div>
		 <div class="sidebarInfo">
		  <ul>
			<!-- Statistics List -->
			<li class="statPublicv">{translate item='index.public_videos'}: <span class="textWhite">{$grandtotalpublic}</span></li>
			<li class="statPrivatev">{translate item='index.private_videos'}: <span class="textWhite">{$grandtotalprivate}</span></li>
			<li class="statMembers">{translate item='index.members'}: <span class="textWhite">{$grandtotaluser}</span></li>
			<li class="statWatchv">{translate item='index.watched_videos'}: <span class="textWhite">{$vviews}</span></li>
			<li class="statVisitors">{translate item='index.online_visitors'}: <span class="textWhite">{online_users}</span></li>
			<!-- End Statistics List -->
		  </ul>
		 </div>
		</div>
	 <!-- End stats Box -->
	 <!-- Popular Tags Box -->
	  <div class="sidebarBox">
		 <div class="sidebarTitle">
		 <h3 class="sidebarBoxHeader">{translate item='index.popular_tags'}</h3>
		 </div>
		 <div class="sidebarInfo">
			<p class="sidebarTags">{$tagshome}
      </p>
			<div class="moreSidebar">
			 <a href="{seourl rewrite='tags' url='more_tags.php'}">{translate item='global.see_more_tags'}</a>
			</div>
		 </div>
		</div>
	 <!-- End Popular Tags Box -->
	  <!-- Poll Box -->
	  <div class="sidebarBox">
		 <div class="sidebarTitle">
		 <h3 class="sidebarBoxHeader">{translate item='index.vote_here'}</h3>
		 </div>
		 <div class="sidebarInfo">
			<p class="sidebarTags">
			  {if $pollinganel ne 'Disable'}
  {if isset($list) }
  <div id="vote"> 	
		<div id="vote-content">
            <div id="tblViewVote"></div>
			<div id="divShowVoting">
            	<div id="tblVote">
                {if $poll_qty ne ""}
                  <b>{$poll_qty}</b><br/>
                  <!-- 		{$poll_id}{$answers} -->
                  {section name=i loop=$list}
                  <input type="radio" name="xx" onclick="directMyvalueto('{$list[i]}','opAns')" />{$list[i]}<br/>
                  {/section}
                  <input type="hidden" id="opAns" />
                  <input type="submit" class="input_btn" id='btnVoteSubmit' value='Cast This' onclick="fxVote({$poll_id})" />
                  {/if}
                  <!--  			# END VOTING SECTION -->
                </div>
                
				<div id="tblViewVote">            
				  <div id="tblViewVote">                 
                  	  <div id="divviewvresult"><a href="javascript:void(0)" onclick="viewVote({$poll_id});hideMe('divviewvresult')"> {translate item='index.vote_status'} </a></div>
                      <table id="tblViewVoteResult" width="100%"></table>
                  </div>
                </div>
                <table id="tblVoteResult" width="100%"></table>
            </div>
		</div>
	</div>
	<div id="clear"></div>
   {/if}
   {/if}

      </p>
		 </div>
		</div>
	 <!-- End Poll Box -->
	 </div>
	</div>
<!-- End Page -->
