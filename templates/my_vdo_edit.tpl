<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">Update: {$answers[0].title}</h1>
		 </div>
		 <div id="textBoxInfo">
		 <h2 class="textBoxSub">Important!</h2>
		 <p>Please select only between 1 and 3 categories when updating your video.</p>
			 
	<form action="{seourl rewrite="video/edit/`$smarty.request.VID`" url="my_vdo_edit.php?VID=`$smarty.request.VID`"}" method="post"> 
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="title">Title:</label></td>
     <td colspan="2" class="smallCol2"><input maxLength="60" size="40" name="vtitle" id="title" value="{$answers[0].title}" type="text" class="large" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="description">Description:</label></td>
     <td colspan="2" class="smallCol2"><textarea name="vdescription" rows="4" cols="50" id="description" class="large">{$answers[0].description}</textarea></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="tags">Tags:</label></td>
     <td colspan="2" class="smallCol2"><input maxLength="120" size="40" name="vkeyword" id="tags" value="{$answers[0].keyword}" type="text" class="large" /></td>
   </tr>
	 <tr>
	   <td colspan="4" class="hint">Hint: Enter one or more tags, separated by spaces. For Example: car sex</td>
	 </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="cats">Categories:</label></td>
		  {insert name=list_channel assign=chinfo vid=$VID}
			<td colspan="2" class="smallCol2">
          {section name=i loop=$chinfo}
					{assign var="status" value=""}
					{section name=j loop=$chid}
                    			{if $chid[j] eq $chinfo[i].id}{assign var="status" value="checked"}{/if}
                    		{/section}
            
            <input type="checkbox" name="chlist[]" value="{$chinfo[i].id}" class="check" {$status} />{$chinfo[i].ch}<br />
          {/section}
					</td>
   </tr>
	 <tr> 
	   <td colspan="2" class="smallCol"><label for="broadcast">Broadcast:</label></td>
		 <td colspan="2" class="smallCol2"><input type="radio" CHECKED value="public" name="video_privacy" id="fm-public_video_privacy" {if $answers[0].type eq "public"}checked{/if} /> Public<br />
		 <input type="radio" value="private" name="video_privacy" id="fm-private_video_privacy" {if $answers[0].type eq "private"}checked{/if} /> Private</td>
	</tr>
	<tr> 
	   <td colspan="2" class="smallCol"><label for="comments">Allow Comments:</label></td>
		 <td colspan="2" class="smallCol2"><input type="radio" value="yes" name="allow_comments" id="fm-enabled_allow_comments" {if $answers[0].be_comment eq "yes"}checked{/if}/> Allow <br />
		 <input type="radio" value="no" name="allow_comments" id="fm-disabled_allow_comments" {if $answers[0].be_comment eq "no"}checked{/if} /> Disallow</td>
	</tr>
	<tr> 
	   <td colspan="2" class="smallCol"><label for="rate">Allow Ratings:</label></td>
		 <td colspan="2" class="smallCol2"><input type="radio" CHECKED value="yes" name="allow_ratings" id="fm-yes_allow_ratings" {if $answers[0].be_rated eq "yes"}checked{/if} />Allow people to rate your video.<br />
		 <input type="radio" value="no" name="allow_ratings" id="fm-no_allow_ratings" {if $answers[0].be_rated eq "no"}checked{/if} />Disallow people from rating your video.
</td>
	</tr>
	<tr> 
	   <td colspan="2" class="smallCol"><label for="embed">Enable Embedding:</label></td>
		 <td colspan="2" class="smallCol2"><input type="radio" value="enabled" name="allow_embed" id="fm-enabled_allow_embed" {if $answers[0].embed eq "enabled"}checked{/if} /> Enable Embedding.
<br />
		 <input type="radio" value="disabled" name="allow_embed" id="fm-disabled_allow_embed" {if $answers[0].embed eq "disabled"}checked{/if} /> Disable Embedding.
</td>
	</tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="thumbs">Thumbs:</label></td>
     <td colspan="2" class="smallCol2">
		 <input name="thumb" type="radio" value="1"{if $answers[0].thumb == 1} checked="checked"{/if}><img src="{$tmburl}/1_{$answers[0].VID}.jpg"><br /><br />
			<input name="thumb" type="radio" value="2"{if $answers[0].thumb == 2} checked="checked"{/if}><img src="{$tmburl}/2_{$answers[0].VID}.jpg"><br /><br />
			<input name="thumb" type="radio" value="3"{if $answers[0].thumb == 3} checked="checked"{/if}><img src="{$tmburl}/3_{$answers[0].VID}.jpg"></td>
   </tr>
	 <tr>  
     <td colspan="2"></td>
     <td colspan="2" class="smallCol2"> <input type="hidden" value="Update Video" name="update_video" />
                        <input type="image" src="{$baseurl}/images/btn_update.gif" name="update video" class="submitButton"/></td>
   </tr>
 </table> 
      </form>	
			
			
						
		</div>	
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}