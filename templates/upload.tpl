 {literal}
  <script type="text/javascript">
            $(function() {
                $('#container-3').tabs({ fxSlide: true, fxFade: true, fxSpeed: 'slow' });
            });
   </script>
	{/literal}
<script type="text/javascript" src="{$baseurl}/js/upload_embed.js"></script>
{if $secondpage ne "second" and $smarty.request.upload_final eq ""}
<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">Upload A Video</h1>
		 </div>
		 <div id="textBoxInfo">
		 <h2 class="textBoxSub">Video Information (Step 1 of 2)</h2>
<form id="theForm" name="theForm" action="{seourl rewrite='upload' url='upload.php'}" method="post" enctype="multipart/form-data">
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="username">Title:</label></td>
     <td colspan="2" class="smallCol2"><input type="text" maxlength="60" size="40" name="field_myvideo_title" value="{$upl.title|escape:'html'}" class="large" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="email">Description:</label></td>
     <td colspan="2" class="smallCol2"><textarea class="large" name="field_myvideo_descr" rows="4" cols="50" class="inputtext">{$upl.desc|escape:'html'}</textarea></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="tags">Tags:</label></td>
     <td colspan="2" class="smallCol2"><input maxlength="120" size="40" name="field_myvideo_keywords" value="{$upl.tags|escape:'html'}" class="large" /></td>
   </tr>
	 <tr>
	   <td colspan="4" class="hint">Hint: Enter one or more tags, separated by spaces. For Example: car sex</td>
	 </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="password2">Categories:</label></td>
		  {insert name=list_channel assign=chinfo vid=$VID}
			<td colspan="2" class="smallCol2">
          {section name=i loop=$chinfo}
            {if is_array($chlist) && in_array($chinfo[i].id, $chlist) }
            <input type="checkbox" name="chlist[]" checked="checked" value="{$chinfo[i].id}" class="check" />
            {else}
            <input type="checkbox" name="chlist[]" value="{$chinfo[i].id}" class="check" />
            {/if}
            {$chinfo[i].ch}<br />
          {/section}
					</td>
   </tr>
   <tr> 
	   <td colspan="2"></td>
     <td colspan="2" class="smallCol2"><input type="hidden" value="Continue -&gt;" name="action_upload" />
          <input type="image" src="images/btn_submit.gif" class="submitButton" name="submit"/></td>
   </tr>
 </table> 
      </form>				
		</div>	
		</div>
		<!-- End Main Box -->
	</div>

<!-- End Main Content Boxes -->
 {else}
 {if $upload_by_file == '1'}
	<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
		 <div id="viewBox">
		<!-- Main Box -->
		  <div style="position: static;" id="container-3">
            <ul class="tabs-nav">
                <li class="tabs-selected"><a href="#fragment-1"><span>Upload Video</span></a></li>
                {if $upload_by_embed == '1'}<li class=""><a href="#fragment-2"><span>Embed Video</span></a></li>{/if}
            </ul>
		
            <div style="" class="tabs-container" id="fragment-1">
               <ul>
		 <!-- Upload Video Stage 1 -->
		 <h2 class="textBoxSub">Upload File (Step 2 of 2)</h2>
<form name="form_upload" id="form_upload"{if $UBR_embedded_upload_results eq 1 or $UBR_opera_browser eq 1 or $UBR_safari_browser eq 1} target="upload_iframe"{/if} method="post" enctype="multipart/form-data"  action="#" style="margin: 0px; padding: 0px;">   <table summary="Signup table" id="tableForm">
	 <table summary="Signup table" id="tableForm">
	 <tr>  
     <td colspan="2" class="smallCol"><label for="video">File:</label></td>
     <td colspan="2" class="smallCol3">
	<noscript><font color='red'>Warning: </font>Javascript must be enabled to use this uploader.<br><br></noscript>
        <input type="hidden" name="MAX_FILE_SIZE" value="104857600" />
        <input type="hidden" name="upload_range" value="1" />
        <noscript><input type="hidden" name="no_script" value="1" /></noscript>
        <input type="hidden" name="adult" value="{$adult}" />
        <input type="hidden" name="field_myvideo_keywords" value="{$upl.tags}" />
        <input type="hidden" name="field_myvideo_title" value="{$upl.title|escape:'html'}" />
        <input type="hidden" name="field_myvideo_descr" value="{$upl.desc|escape:'html'}" />
        <input type="hidden" name="listch" value="{$listch}" />
			    
		<input type="file" name="upfile_0" size="40"{if $UBR_multi_upload_slots eq 1} onChange="addUploadSlot(1)"{/if}onkeypress="return handleKey(event)" class="large" value="" /></td>
   
	 </tr>
	 <tr> 
	   <td colspan="2" class="smallCol"><label for="broadcast">Broadcast:</label></td>
		 <td colspan="2" class="smallCol2"><input name="field_privacy" type="radio" value="public" checked="checked" /> Public<br />
		 <input name="field_privacy" type="radio" value="private" /> Private</td>
	</tr>
	 <tr> 
	   <td colspan="2"></td>
     <td colspan="2" class="smallCol2"><input type="hidden" value="Continue -&gt;" name="action_upload" />
         	<input type="button" id="reset_button" name="reset_button" value="Reset" onClick="resetForm();">&nbsp;
	<input type="button" id="upload_button" name="upload_button" value="Upload" onClick="linkUpload();"></td>
   </tr>
	 <tr>
	  <td colspan="2"></td>
		<td colspan="2" class="smallCol2">
		{if $UBR_embedded_upload_results eq 1 or $UBR_opera_browser eq 1 or $UBR_safari_browser eq 1 or $UBR_chrome_browser eq 1}
	<div id="upload_div" style="display:none;"><iframe name="upload_iframe" frameborder="0" width="800" height="200" scrolling="auto"></iframe></div>
	{/if}
		 <!-- Start Progress Bar -->  
		
	<div id="progress_bar" style="display:none">
	 <div class="alert" id="ubr_alert"></div>
		<div class="bar1" id="upload_status_wrap">
			<div class="bar2" id="upload_status"></div>
		</div>
		{if $UBR_show_percent_complete eq 1 or $UBR_show_files_uploaded eq 1 or $UBR_show_current_position eq 1 or $UBR_show_elapsed_time eq 1 or $UBR_show_est_time_left eq 1 or $UBR_show_est_speed eq 1}
		<br />
		<table class="data" cellpadding='3' cellspacing='1'>
		{if $UBR_show_percent_complete eq 1}
		<tr>
			<td align="left"><b>Percent Complete:</b></td>
			<td align="center"><span id="percent">0%</span></td>
		</tr>
		{/if}
		{if $UBR_show_files_uploaded eq 1}
		<tr>
			<td><b>Files Uploaded:</b></td>
			<td align="center"><span id="uploaded_files">0</span> of <span id="total_uploads"></span></td>
		</tr>
		{/if}
		{if $UBR_show_current_position eq 1}
		<tr>
			<td align="left"><b>Current Position:</b></td>
			<td align="center"><span id="current">0</span> / <span id="total_kbytes"></span> KBytes</td>
		</tr>
		{/if}
		{if $UBR_show_elapsed_time eq 1}
		<tr>
			<td align="left"><b>Elapsed Time:</b></td>
			<td align="center"><span id="time">0</span></td>
		</tr>
		{/if}
		{if $UBR_show_est_time_left eq 1}
		<tr>
			<td align="left"><b>Est Time Left:</b></td>
			<td align="center"><span id="remain">0</span></td>
		</tr>
		{/if}
		{if $UBR_show_est_speed eq 1}
		<tr>
			<td align="left"><b>Est Speed:</b></td>
			<td align="center"><span id="speed">0</span> KB/s.</td>
		</tr>
		{/if}
		</table>
		{/if}
	</div>
	<!-- End Progress Bar -->
		</td>
	 </tr>
	 </table>
	 </form> 
	 
	 
	        


	 
	 
	 
	 
			<!-- End Upload Video -->
		 </ul>
        </div>

        {if $upload_by_embed == '1'}
        <div style="" class="tabs-container" id="fragment-2">
				 <ul>
		 <!-- Embed Video -->
		 
		 <h2 class="textBoxSub">Embed Video (Step 2 of 2)</h2>
 <form method="POST" action="{seourl rewrite='upload' url='upload.php'}" enctype="multipart/form-data">
          <input type="hidden" name="adult" value="{$adult}" />
          <input type="hidden" name="field_myvideo_keywords" value="{$upl.tags}" />
          <input type="hidden" name="field_myvideo_title" value="{$upl.title|escape:'html'}" />
          <input type="hidden" name="field_myvideo_descr" value="{$upl.desc|escape:'html'}" />
          <input type="hidden" name="listch" value="{$listch}" />
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="embed">Embed Code:</label></td>
     <td colspan="2" class="smallCol2"><textarea name="embed_code" rows="4" cols="50" class="large"></textarea>
</td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="thumb">Thumb:</label></td>
     <td colspan="2" class="smallCol3"><input name="thumb" type="file"></textarea></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="duration">Runtime:</label></td>
     <td colspan="1" class="smallCol2"><input maxlength="2" size="2" name="duration_minutes" value="" class="small" /> Minutes</td>
		 <td colspan="1" class="smallCol2"><input maxlength="2" size="2" name="duration_seconds" value="" class="small" /> Seconds</td>
   </tr>
	 <tr> 
	   <td colspan="2" class="smallCol"><label for="broadcast">Broadcast:</label></td>
		 <td colspan="2" class="smallCol2"><input name="field_privacy" type="radio" value="public" checked="checked" /> Public<br />
		 <input name="field_privacy" type="radio" value="private" /> Private</td>
	</tr>
	 <tr> 
	   <td colspan="2"></td>
     <td colspan="2" class="smallCol2"><input type="submit" name="submit_embed" value="Upload" /></td>
   </tr>
		</table>
		</form>
		 
		 
			<!-- End Embed Video -->
		 </ul>
				</div>
 {/if}
		</div>
		<!-- End Main Box -->
 </div>
 </div>
<!-- End Main Content Boxes -->
{/if}
{/if}
{include file="sidebar.tpl"}

