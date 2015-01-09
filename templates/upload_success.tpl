<div id="page">
	 <div id="mainContent">
	 <!-- main Content Boxes -->
	  <div class="mainBox">
		<!-- Main Box -->
		 <div class="mainBoxTitle">
		 <h1 class="mainBoxHeader">Upload Successful!</h1>
		 </div>
		 <div id="textBoxInfo">
		 <h2 class="textBoxSub">Important!</h2>
		 <p>Your video is currently being converted and will appear on the site shortly.  If you embedded a video it will be availabel immediately</p>
		 <p>More video's to upload? visit <a href="{$baseurl}/upload">the uploader</a>.</p>
	<form name="linkForm">	 
   <table summary="Signup table" id="tableForm">
   <tr>  
     <td colspan="2" class="smallCol"><label for="video">Video URL:</label></td>
     <td colspan="2" class="smallCol2"><input class="large" onclick="javascript:document.linkForm.video_link.focus();document.linkForm.video_link.select();" readonly="readOnly" value="{seourl rewrite="video/`$vinfo.VID`" url="view_video.php?viewkey=`$smarty.request.viewkey`" clean=$vinfo.title}" name="video_link" /></td>
   </tr>
   <tr>  
     <td colspan="2" class="smallCol"><label for="description">Embed:</label></td>
     <td colspan="2" class="smallCol2"><textarea class="large" onclick="javascript:document.linkForm.video_play.focus();document.linkForm.video_play.select();" name="video_play" readonly="readOnly" wrap="physical">{if $vinfo.embed_code == ''}
<embed src="{$baseurl}/player.swf" width="360" height="270" allowscriptaccess="always" allowfullscreen="true" flashvars="width=360&amp;height=270&amp;file={$flvdourl}/{$vinfo.flvdoname}&amp;image={$tmburl}/{$vinfo.thumb}_{$vinfo.VID}.jpg&amp;displayheight=270&amp;link={seourl rewrite="video/`$vinfo.VID`" url="view_video.php?viewkey=`$viewkey`" clean=$vinfo.title}&amp;searchbar=false&amp;linkfromdisplay=true&amp;recommendations={$baseurl}/feed_embed.php?v={$vinfo.vkey}" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" />
{else}
{$vinfo.embed_code}
{/if}
        </textarea></td>
   </tr>
 </table> 
      </form>	
			
			
						
		</div>	
		</div>
		<!-- End Main Box -->
 </div>
	 <!-- End Main Content Boxes -->
{include file="sidebar.tpl"}