<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">Inbox</h1>
		 </div>
		 <div id="textBoxInfo">
		 {if $total ne "0"}
 
 <table cellspacing="0" id="tableInbox" summary="Inbox messages">
 <colgroup>
 <col id="SubjectOutbox" />
 <col id="DateOutbox" />
 <col id="DeleteOutbox" />
 </colgroup>
  <thead>
   <tr>
    <th scope="col">Subject</th> 
    <th scope="col">Date</th>
    <th scope="col">Delete</th>
   </tr>
	</thead>
	<tbody>
	 {section name=i loop=$pm_id}
	 {if $seen[i] == "0"}
						{assign var=newMail value="class='newmail'"}	
					{else}
						{assign var=newMail value="class='openedmail'"}
					{/if}
	 <tr>
	   <td><a href="{$baseurl}/msg.php?id={$pm_id[i]}&s={$seen[i]}" {$newMail}>{$subject[i]}</a></td>
                   
                    <td>{$date[i]|date_format:"%A, %B %e, %Y"}</td>
                    <td>
                    <form name="delete_mail" method="POST" action="{seourl rewrite='mail/inbox' url='inbox.php'}">
                    <input name="id" type="hidden" value="{$pm_id[i]}">
                    <input type="image" src="{$baseurl}/images/icon_delete.gif" alt="Delete Message">
                    </form>
                    </td>
	 </tr>
	 {/section}
	</tbody>
</table>
 {else}
			  <p>Empty Inbox</p>
			  {/if}
		</div>
		<!-- End Main Box -->
 </div>
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}