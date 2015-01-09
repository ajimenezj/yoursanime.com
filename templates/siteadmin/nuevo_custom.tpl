     {literal}<style>.labrow { float:left; display:inline; } 
     .lab2 { color: #666677; float: left; display:inline; font: 13px "Lucida Sans Unicode","Trebuchet MS",Verdana,Arial,Helvetica,sans-serif; margin: 7px 0 0 15px;; padding: 0; text-align: left;} 
      pre, code { background-color: #EEE7BD; color:#000; text-align:left; border: 1px solid #A6FB99;display: block;font-family: monospace;font-size: 12px;line-height: 14px;margin: 10px 0 0;overflow: auto;padding: 10px;width: 600px; }
     .sugg { display:block; float:right; width:140px; font-weight:normal; font-size:11px; color:#000; text-align:center; background: #EEE7BD;  }
     </style>{/literal} 
     {literal}
     <script type="text/javascript">
	function suggest() {
		var skin=$('#skin').val();
		if(skin=='') skin='black';
		$.post('modules/nuevo/palette.php', { skin: skin },
		function(response) {
		   $('#hover').html('Suggested: # <b>'+response.hovercolor+'</b>');
		   $('#viralback').html('Suggested: # <b>'+response.viral_backhover+'</b>');
		   $('#viraltext').html('Suggested: # <b>'+response.viral_texthover+'</b>');
		}, 'json');
	}
	function suggest2() {
		var skin=$('#skin2').val();
		if(skin=='') skin='black';
		$.post('modules/nuevo/palette.php', { skin: skin },
		function(response) {
		   $('#hover2').html('Suggested: # <b>'+response.hovercolor+'</b>');
		   $('#viralback2').html('Suggested: # <b>'+response.viral_backhover+'</b>');
		   $('#viraltext2').html('Suggested: # <b>'+response.viral_texthover+'</b>');
		   $('#playlisttextcolor').html('Suggested: # <b>'+response.playlisttextcolor+'</b>');
		   $('#playlisthovercolor').html('Suggested: # <b>'+response.playlisthovercolor+'</b>');
		   $('#playlisttextshadow').html('Suggested: # <b>'+response.playlisttextshadow+'</b>');
		   $('#playlisthovershadow').html('Suggested: # <b>'+response.playlisthovershadow+'</b>');
		}, 'json');
	}
     </script>
     {/literal}

     <div id="rightcontent">
       {include file="siteadmin/nuevo_errmsg.tpl"}
        
       <div id="right">
        <div align="center">
        <h2>Custom Player Generator</h2>
	<div id="simpleForm">
	<form>
	<center>
	   <input type="button" value="Single Video Player" class="button" onclick="setme('single')" />&nbsp;
	   <input type="button" value="Playlist Player" class="button" onclick="setme('playlist')" />
	</center>
	</form>
	</div>
	<br />
	{literal}
	<script type="text/javascript">
	  function setme(div) {
	    document.getElementById('single').style.display="none";
	    document.getElementById('playlist').style.display="none";
	    document.getElementById(div).style.display="block";
	  }
	</script>
	{/literal}
        <div id="single"{if $div neq 'single'} style="display:none;"{/if}>
	<div id="simpleForm">
        <form name="player_settings" method="POST" action="nuevo.php?m=custom">
         
	 <fieldset style="font-size:11px;">
         <legend>Single Player Settings</legend>
            
	    <label for="">Video ID (VID)</label>
	    <input type="text" name="VID" size="10" maxlength="4" value="{$VID}" /><br /><br />
         
	 </fieldset>

	 <fieldset style="font-size:11px;">
         <legend>Skin &amp; Colors</legend>
	    <label for="skin">Player skin</label>
	    <select name="skin" id="skin" onchange="suggest();">
	      <option value="default" selected="selected">Default black</option>
	      {foreach from=$skins item=skin}
		 <option value="{$skin}"{if $player.skin eq $skin} selected="selected"{/if}>{$skin}</option>
	      {/foreach}
	    </select><br /><br />

	    <label for="hovercolor">Playbar buttons hover color: </label>
            &nbsp;&nbsp;<input type="text" name="hovercolor" size="10" maxlength="6" value="{$player.hovercolor}" /> (enter hex value) <span class="sugg" id="hover">(Suggested: # <b>{$palette.hovercolor}</b>)</span><div style="clear:right;"></div><br />           
	    <label for="viral_backhover">Viral back color (when over): </label>
            &nbsp;&nbsp;<input type="text" name="viral_backhover" size="10" maxlength="6" value="{$player.viral_backhover}" /> (enter hex value) <span class="sugg" id="viralback">(Suggested: # <b>{$palette.viral_backhover}</b>)</span><div style="clear:right;"></div><br />
	    <label for="viral_texthover">Viral text color (when over): </label>
            &nbsp;&nbsp;<input type="text" name="viral_texthover" size="10" maxlength="6" value="{$player.viral_texthover}" /> (enter hex value) <span class="sugg" id="viraltext">(Suggested: # <b>{$palette.viral_texthover}</b>)</span><div style="clear:right;"></div><br />
	 </fieldset>

	 <fieldset style="font-size:11px;">
         <legend>Misc settings</legend>
	    <label for="stretching">Default video size: </label>
            <select name="stretching">
		<option value="fit"{if $player.stretching eq "fit"} selected="selected"{/if}>Fit to window</option>
		<option value="aspect"{if $player.stretching eq "aspect"} selected="selected"{/if}>Keep aspect ratio</option>
		<option value="original"{if $player.stretching eq "original"} selected="selected"{/if}>Original size</option>
	    </select><br /><br />

            <label for="player_width">Player width: </label>
	    <div class="labrow"><input type="text" name="player_width" size="10" maxlength="4" value="{$player.player_width}" /></div>
            <div class="lab2" for="player_height">Player height: </div>
	    <div class="labrow"><input type="text" name="player_height" size="10" maxlength="4" value="{$player.player_height}" /></div>
	    <br /><br />
	    <label for="autostart">Autostart: </label>
	    <select name="autostart">
	      <option value="0" selected="selected">No</option>
	      <option value="1"{if $player.autostart eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />
            <label for="playbar">Playbar type: </label>
            <select name="playbar"><option value="bottom" selected="selected">Bottom</option><option value="over"{if $player.playbar eq 'over'} selected="selected"{/if}>Over screen</option></select><br />
	    <label for="playbarhide">Hide playbar in OVER mode: </label>
	    <select name="playbarhide"><option value="0"{if $player.playbarhide eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.playbarhide eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <br />
	    <label for="show_logo">Show logo: </label>
            <select name="show_logo"><option value="0"{if $player.show_logo eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.show_logo eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="viral_show">Show viral icons: </label>
            <select name="viral_show"><option value="0"{if $player.viral_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.viral_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="viral_offset">Viral icons Y Offset (from top): </label>
	    <input type="text" name="viral_offset" size="10" maxlength="3" value="{$player.viral_offset}" /><br />
	    <label for="viral_align">Viral icons alignment: </label>
            <select name="viral_align">
		<option value="right"{if $player.viral_align eq "right"} selected="selected"{/if}>Right</option>
		<option value="left"{if $player.viral_align eq "left"} selected="selected"{/if}>Left</option>
	    </select><br />

        </fieldset>
        <fieldset style="font-size:11px;">
        <legend>Menu window</legend>  
	    <label for="guide">Guide type: </label>
            <select name="guide"><option value="0"{if $player.guide eq '0'} selected="selected"{/if}>Default</option><option value="guide_white"{if $player.guide eq 'guide_white'} selected="selected"{/if}>Alternative light</option><option value="guide_black"{if $player.guide eq 'guide_black'} selected="selected"{/if}>Alternative dark</option></select><br />
	    <label for="guide_show">Show guide window: </label>
            <select name="guide_show"><option value="0"{if $player.guide_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.guide_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="embed_show">Show embed window: </label>
            <select name="embed_show"><option value="0"{if $player.embed_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.embed_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="email_show">Show email window: </label>
            <select name="email_show"><option value="0"{if $player.email_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.email_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="share_show">Show sharing window: </label>
            <select name="share_show"><option value="0"{if $player.share_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.share_show eq '1'} selected="selected"{/if}>Yes</option></select><br />

        </fieldset>
        <fieldset style="font-size:11px;">
        <legend>Player Buttons</legend>  
            <label for="replay_button">Replay button: </label>
            <select name="replay_button"><option value="0"{if $player.replay_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.replay_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="slomo_button">Slow motion button: </label>
            <select name="slomo_button"><option value="0"{if $player.slomo_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.slomo_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="slomointerval">Slomo interval: </label>
            <select name="slomointerval">
	    <option value="25"{if $player.slomointerval eq 25} selected="selected"{/if}>25</option>
	    <option value="50"{if $player.slomointerval eq 50} selected="selected"{/if}>50</option>
	    <option value="75"{if $player.slomointerval eq 75} selected="selected"{/if}>75</option>
	    <option value="100"{if $player.slomointerval eq 100} selected="selected"{/if}>100</option>
	    </select><br />
            <label for="zoom_button">Zoom button: </label>
            <select name="zoom_button"><option value="0"{if $player.zoom_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.zoom_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="settings_button">Video Settings button: </label>
            <select name="settings_button"><option value="0"{if $player.settings_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.settings_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="volume_button">Volume button: </label>
            <select name="volume_button"><option value="0"{if $player.volume_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.volume_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="size_button">Size options button: </label>
            <select name="size_button"><option value="0"{if $player.size_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.size_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="fullscreen_button">Fullscreen button: </label>
            <select name="fullscreen_button"><option value="0"{if $player.fullscreen_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.fullscreen_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="menu_button">Menu button: </label>
            <select name="menu_button"><option value="0"{if $player.menu_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.menu_button eq '1'} selected="selected"{/if}>Yes</option></select><br /><br />

	</fieldset>
        
	<div style="text-align: center;">
            <input type="submit" name="submit" value="Update &amp; Genarate Player Code" class="button">
        </div>
        </form>
        </div>
	</div>

        <div id="playlist"{if $div neq 'playlist'} style="display:none;"{/if}>
	<div id="simpleForm">
        <form name="playlist_settings" method="POST" action="nuevo.php?m=custom">
        <fieldset style="font-size:11px;">
        <legend>Player with playlist</legend>  

	    <label for="playlist_type">Playlist type: </label>
	    <div class="labrow"><select name="playlist_type">
	       <option value="recent" selected="selected">Recent videos</option>
               <option value="most"{if $player2.playlist_type eq 'most'} selected="selected"{/if}>Most viewed</option>
	       <option value="rate"{if $player2.playlist_type eq 'rate'} selected="selected"{/if}>Best rated</option>
	       <option value="user"{if $player2.playlist_type eq 'user'} selected="selected"{/if}>From user</option>
	    </select></div>
	    <div class="lab2">Playlist maximum items No: </div>
            <div class="labrow"><input type="text" name="playlist_items" size="10" maxlength="2" value="{$player2.playlist_items}" /></div><br />

	    <label for="playlist_type">Uploader name:<br /><font size="0.9em">(if "from user" selected)</font> </label>
            <input type="text" class="large" name="playlist_user" size="10" maxlength="3" value="{$player2.playlist_user}" /><br /><br />
	     
	    <label for="playlistsize">Playlist box width (px): </label>
            <input type="text" name="playlistsize" size="10" maxlength="3" value="{$player2.playlistsize}" /><br />
	    <label for="playlisttype">Playlist layout: </label>
	    <select name="playlisttype">
	      <option value="right" selected="selected">Right</option>
	      <option value="bottom"{if $player2.playlisttype eq 'bottom'} selected="selected"{/if}>Bottom</option>
	    </select><br />
	    <label for="playlistsize">Playlist button: </label>
	    <select name="playlist_button">
	      <option value="0" selected="selected">No</option>
	      <option value="1"{if $player2.playlist_button eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />
	</fieldset>
        <fieldset style="font-size:11px;">
        <legend>Player with playlist</legend>  
	    <label for="skin_file">Player skin</label>
	    <select name="skin" id="skin2" onchange="suggest2();">>
	      <option value="default" selected="selected">Default black</option>
	      {foreach from=$skins item=skin}
		 <option value="{$skin}"{if $player2.skin eq $skin} selected="selected"{/if}>{$skin}</option>
	      {/foreach}
	    </select><br /><br />
	    <label for="hovercolor">Playbar buttons hover color: </label>
            &nbsp;&nbsp;<input type="text" name="hovercolor" size="10" maxlength="6" value="{$player2.hovercolor}" /> (enter hex value) <span class="sugg" id="hover2">(Suggested: # <b>{$palette2.hovercolor}</b>)</span><div style="clear:right;"></div><br /><br />           
	    <label for="viral_backhover">Viral back color (when over): </label>
            &nbsp;&nbsp;<input type="text" name="viral_backhover" size="10" maxlength="6" value="{$player2.viral_backhover}" /> (enter hex value) <span class="sugg" id="viralback2">(Suggested: # <b>{$palette2.viral_backhover}</b>)</span><div style="clear:right;"></div><br /><br />
	    <label for="viral_texthover">Viral text color (when over): </label>
            &nbsp;&nbsp;<input type="text" name="viral_texthover" size="10" maxlength="6" value="{$player2.viral_texthover}" /> (enter hex value) <span class="sugg" id="viraltext2">(Suggested: # <b>{$palette2.viral_texthover}</b>)</span><div style="clear:right;"></div><br /><br />
	    
	    <label for="playlisttextcolorr">Playlist text color): </label>
            &nbsp;&nbsp;<input type="text" name="playlisttextcolor" size="10" maxlength="6" value="{$player2.playlisttextcolor}" /> (enter hex value) <span class="sugg" id="playlisttextcolor">(Suggested: # <b>{$palette2.playlisttextcolor}</b>)</span><div style="clear:right;"></div><br /><br />  
	    <label for="playlisthovercolor">Playlist hover text color: </label>
            &nbsp;&nbsp;<input type="text" name="playlisthovercolor" size="10" maxlength="6" value="{$player2.playlisthovercolor}" /> (enter hex value) <span class="sugg" id="playlisthovercolor">(Suggested: # <b>{$palette2.playlisthovercolor}</b>)</span><div style="clear:right;"></div><br /><br />  
	    <label for="playlisttextshadow">Playlist text shadow: </label>
            &nbsp;&nbsp;<input type="text" name="playlisttextshadow" size="10" maxlength="6" value="{$player2.playlisttextshadow}" /> (set "none" to skip shadow) <span class="sugg" id="playlisttextshadow">(Suggested: # <b>{$palette2.playlisttextshadow}</b>)</span><div style="clear:right;"></div><br /><br />  
	    <label for="playlisthovershadow">Playlist hover text shadow: </label>
            &nbsp;&nbsp;<input type="text" name="playlisthovershadow" size="10" maxlength="6" value="{$player2.playlisthovershadow}" /> (set "none" to skip shadow) <span class="sugg" id="playlisthovershadow">(Suggested: # <b>{$palette2.playlisthovershadow}</b>)</span><div style="clear:right;"></div><br /><br /> 

	</fieldset>
        <fieldset style="font-size:11px;">
        <legend>Misc settings</legend> 
	    <label for="stretching">Default video scale: </label>
            <select name="stretching">
		<option value="fit"{if $player2.stretching eq "fit"} selected="selected"{/if}>Fit to window</option>
		<option value="aspect"{if $player2.stretching eq "aspect"} selected="selected"{/if}>Keep aspect ratio</option>
		<option value="original"{if $player2.stretching eq "original"} selected="selected"{/if}>Original size</option>
	    </select><br /><br />
            <label for="player_width">Player width: </label>
	    <input type="text" name="player_width" size="10" maxlength="4" value="{$player2.player_width}" /><br />
            <label for="player_height">Player height: </label>
	    <input type="text" name="player_height" size="10" maxlength="4" value="{$player2.player_height}" />
	    <br /><br />

	    <label for="autostart">Autostart: </label>
	    <select name="autostart">
	      <option value="0" selected="selected">No</option>
	      <option value="1"{if $player2.autostart eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />
            <label for="playbar">Playbar type: </label>
            <select name="playbar"><option value="bottom" selected="selected">Bottom</option><option value="over"{if $player2.playbar eq 'over'} selected="selected"{/if}>Over screen</option></select><br />
	    <label for="playbarhide">Hide playbar in OVER mode: </label>
	    <select name="playbarhide"><option value="0"{if $player2.playbarhide eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.playbarhide eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <br />

	    	    <br />
	    <label for="show_logo">Show logo: </label>
            <select name="show_logo"><option value="0"{if $player2.show_logo eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.show_logo eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="viral_show">Show viral icons: </label>
            <select name="viral_show"><option value="0"{if $player2.viral_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.viral_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="viral_offset">Viral icons Y Offset (from top): </label>
	    <input type="text" name="viral_offset" size="10" maxlength="3" value="{$player2.viral_offset}" /><br />
	    <label for="viral_align">Viral icons alignment: </label>
            <select name="viral_align">
		<option value="right"{if $player2.viral_align eq "right"} selected="selected"{/if}>Right</option>
		<option value="left"{if $player2.viral_align eq "left"} selected="selected"{/if}>Left</option>
	    </select><br />

        </fieldset>
        <fieldset style="font-size:11px;">
        <legend>Menu window</legend>
	    <label for="guide">Guide type: </label>
            <select name="guide"><option value="0"{if $player2.guide eq '0'} selected="selected"{/if}>Default</option><option value="guide_white"{if $player2.guide eq 'guide_white'} selected="selected"{/if}>Alternative light</option><option value="guide_black"{if $player2.guide eq 'guide_black'} selected="selected"{/if}>Alternative dark</option></select><br />
	    <label for="guide_show">Show guide window: </label>
            <select name="guide_show"><option value="0"{if $player2.guide_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.guide_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="embed_show">Show embed window: </label>
            <select name="embed_show"><option value="0"{if $player2.embed_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.embed_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="email_show">Show email window: </label>
            <select name="email_show"><option value="0"{if $player2.email_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.email_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="share_show">Show sharing window: </label>
            <select name="share_show"><option value="0"{if $player2.share_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.share_show eq '1'} selected="selected"{/if}>Yes</option></select><br />

        </fieldset>
        <fieldset style="font-size:11px;">
        <legend>Player Buttons</legend>  
            <label for="replay_button">Replay button: </label>
            <select name="replay_button"><option value="0"{if $player2.replay_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.replay_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="slomo_button">Slow motion button: </label>
            <select name="slomo_button"><option value="0"{if $player2.slomo_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.slomo_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="slomointerval">Slomo interval: </label>
            <select name="slomointerval">
	    <option value="25"{if $player2.slomointerval eq 25} selected="selected"{/if}>25</option>
	    <option value="50"{if $player2.slomointerval eq 50} selected="selected"{/if}>50</option>
	    <option value="75"{if $player2.slomointerval eq 75} selected="selected"{/if}>75</option>
	    <option value="100"{if $player2.slomointerval eq 100} selected="selected"{/if}>100</option>
	    </select><br />
            <label for="zoom_button">Zoom button: </label>
            <select name="zoom_button"><option value="0"{if $player2.zoom_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.zoom_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="settings_button">Video Settings button: </label>
            <select name="settings_button"><option value="0"{if $player2.settings_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.settings_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="volume_button">Volume button: </label>
            <select name="volume_button"><option value="0"{if $player2.volume_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.volume_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="size_button">Size options button: </label>
            <select name="size_button"><option value="0"{if $player2.size_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.size_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="fullscreen_button">Fullscreen button: </label>
            <select name="fullscreen_button"><option value="0"{if $player2.fullscreen_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player2.fullscreen_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="menu_button">Menu button: </label>
            <select name="menu_button"><option value="0"{if $player2.menu_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.menu_button eq '1'} selected="selected"{/if}>Yes</option></select><br /><br />

	</fieldset>


        <fieldset style="font-size:11px;">


	<div style="text-align: center;">
            <input type="submit" name="submit_playlist" value="Update &amp; Genarate Player Code" class="button">
        </div>
        </form>
        </div>
	</div>

        


        </div>
        </div>
     </div>
