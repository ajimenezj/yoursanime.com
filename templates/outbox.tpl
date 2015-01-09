<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">Outbox</h1>
		 </div>
		 <div id="textBoxInfo">
		 {if $total ne "0"}
 
 <table cellspacing="0" id="tableInbox" summary="outbox messages">
 <colgroup>
 <col id="SubjectOutbox" />
 <col id="ToOutbox" />
 <col id="DateOutbox" />
 <col id="DeleteOutbox" />
 </colgroup>
  <thead>
   <tr>
		<th scope="col">Subject</th>
    <th scope="col">To</th>
    <th scope="col">Date</th>
    <th scope="col">Delete</th>
   </tr>
	</thead>
	<tbody>
	 {section name=i loop=$pm_id}
	 <tr>
                    <td><a href="{$baseurl}/msg.php?id={$pm_id[i]}" class="openedmail">{$subject[i]}</a></td>
                    <td>{$receiver[i]}</td>
                    <td>{$date[i]|date_format:"%A, %B %e, %Y"}</td>
                    <td>
                    <form name="delete_mail" method="POST" action="{seourl rewrite='mail/outbox' url='outbox.php'}">
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