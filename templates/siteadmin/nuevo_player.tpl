 <div id="rightcontent">
      {include file="siteadmin/nuevo_errmsg.tpl"}
         <div id="right">
        <div align="center">
        <h2>Nuevoplayer Settings</h2>
	<div id="simpleForm">
        <form name="player_settings" method="POST" action="nuevo.php?m=player">
	 <fieldset style="font-size:11px;">
         <legend>Player general settings</legend>
	    <label for="regkey">Registraiton key</label>
	    <input type="text" name="regkey" class="large" maxlength="255" value="{$player.regkey}" /><br /><br />


	    <label for="player_width">Player width: </label>
	    <input type="text" name="player_width" value="{$player.player_width}" class="small" maxlength="4" /><br />
	    <label for="player_height">Player height: </label>
	    <input type="text" name="player_height" value="{$player.player_height}" class="small" maxlength="4" /><br />	
	    <label for="skin_file">Player skin</label>
	    <select name="skin">
	      <option value="" selected="selected">Default</option>
	      {foreach from=$skins item=skin}
		 <option value="{$skin}"{if $player.skin eq $skin} selected="selected"{/if}>{$skin}</option>
	      {/foreach}
	    </select><br />
            <label for="playbar">Playbar type: </label>
            <select name="playbar"><option value="bottom" selected="selected">Bottom</option><option value="over"{if $player.playbar eq 'over'} selected="selected"{/if}>Over screen</option></select><br />	    
	    <br />
	</fieldset>
	<fieldset style="font-size:11px;">
        <legend>Basic plugins</legend>	   
	<label for="plugin_midroll">Preroll Ads Plugin </label>	   
	    <select name="plugin_preroll">
	    <option value="1"{if $player.plugin_preroll eq '1'} selected="selected"{/if}>Yes</option>
	    <option value="0"{if $player.plugin_preroll eq '0'} selected="selected"{/if}>No</option>
	    </select><br />
	    <label for="plugin_midroll">Midroll Ads Plugin </label>
            <select name="plugin_midroll"><option value="1"{if $player.plugin_midroll eq '1'} selected="selected"{/if}>Yes</option><option value="0"{if $player.plugin_midroll eq '0'} selected="selected"{/if}>No</option></select> Flash only<br />
	    <label for="plugin_overlay">Overlay Ads Plugin </label>
            <select name="plugin_overlay"><option value="1"{if $player.plugin_overlay eq '1'} selected="selected"{/if}>Yes</option><option value="0"{if $player.plugin_overlay eq '0'} selected="selected"{/if}>No</option></select><br />
	    <label for="plugin_ticker">News Ticker Plugin </label>
            <select name="plugin_ticker"><option value="1"{if $player.plugin_ticker eq '1'} selected="selected"{/if}>Yes</option><option value="0"{if $player.plugin_ticker eq '0'} selected="selected"{/if}>No</option></select>  Flash only
	</fieldset>

        <fieldset style="font-size:11px;">
        <legend>Misc settings</legend>

	    <label for="stretch">Default video scaling method: </label>
            <select name="stretching">
		<option value="fit"{if $player.stretching eq "fit"} selected="selected"{/if}>Fit to window</option>
		<option value="aspect"{if $player.stretching eq "aspect"} selected="selected"{/if}>Keep aspect ratio</option>
		<option value="original"{if $player.stretching eq "original"} selected="selected"{/if}>Original size</option>
	    </select><br /><br />
	    <label for="autostart">Autostart: </label>
	    <select name="autostart"><option value="0"{if $player.autostart eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.autostart eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="volume">Default volume: </label>
	    <input type="text" name="volume" size="10" maxlength="3" value="{$player.volume}" /> (0-100)<br />
            <label for="usetooltips">Show tooltips: </label>
             <select name="usetooltips"><option value="0"{if $player.usetooltips eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.usetooltips eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <br /><br />

	    <label for="viral_menu">Viral Menu icon </label>
            <select name="viral_menu"><option value="0"{if $player.viral_menu eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.viral_menu eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="viral_share">Viral Share icon </label>
            <select name="viral_share"><option value="0"{if $player.viral_share eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.viral_share eq '1'} selected="selected"{/if}>Yes</option></select><br />            
	    <label for="viral_slomo">Viral Slowmotion icon </label>
            <select name="viral_slomo"><option value="0"{if $player.viral_slomo eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.viral_slomo eq '1'} selected="selected"{/if}>Yes</option></select><br />	    
	    <label for="viral_offset">Viral icons Y Offset (from top): </label>
	    <input type="text" name="viral_offset" size="10" maxlength="3" value="{$player.viral_offset}" /><br />
	    <label for="viral_align">Viral icons alignment: </label>
            <select name="viral_align">
		<option value="right"{if $player.viral_align eq "right"} selected="selected"{/if}>Right</option>
		<option value="left"{if $player.viral_align eq "left"} selected="selected"{/if}>Left</option>
	    </select><br />

	    <br /><br />

            <label for="bufferlength">Buffer length (flash): </label>
	    <input type="text" name="bufferlength" size="10" maxlength="2" value="{$player.bufferlength}" /> (1-15)<br />
	    <br /><br />

	    <label for="barlogo">Controlbar logo image URL: (full URL)</label>
            <input type="text" name="barlogo" class="large" maxlength="255" value="{$player.barlogo}" /> Keep max 15-30px height<br />
	    <label for="logo">Logo image URL: (full URL)</label>
            <input type="text" name="logo" class="large" maxlength="255" value="{$player.logo}" /><br />
	    <label for="logourl">Logo click URL: (full URL)</label>
            <input type="text" name="logourl" class="large" maxlength="255" value="{$player.logourl}" /><br />
            <label for="logoposition">Logo position: </label>
            <select name="logoalign">
		<option value="LT"{if $player.logoalign eq "LT"} selected="selected"{/if}>Top Left</option>
		<option value="RT"{if $player.logoalign eq "RT"} selected="selected"{/if}>Top Right</option>
		<option value="LB"{if $player.logoalign eq "LB"} selected="selected"{/if}>Bottom Left</option>
		<option value="RB"{if $player.logoalign eq "RB"} selected="selected"{/if}>Bottom Right</option>
	    </select><br />
	    <label for="logooffsetx">Logo X Offset: </label>
            <input type="text" name="logooffsetx" size="6" maxlength="3" value="{$player.logooffsetx}" /><br />
	    <label for="logooffsety">Logo Y Offset: </label>
            <input type="text" name="logooffsety" size="6" maxlength="3" value="{$player.logooffsety}" /><br />
	    <br />
            <label for="menuitem">Show link in flash menu: </label>
            <select name="menuitem"><option value="0"{if $player.menuitem eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.menuitem eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="menutext">Flash menu text: </label>
            <input type="text" name="menutext" class="large" maxlength="30" value="{$player.menutext}" /><br />
            <label for="menulink">Flash nenu link: </label>
            <input type="text" name="menulink" class="large" maxlength="255" value="{$player.menulink}" /><br />
	    <br /><br />

            <label for="statscript">Stats script URL: </label>
	    <input type="text" name="statscript" class="large" maxlength="255" value="{$player.statscript}" /><br />
            <label for="rss_url">RSS full URL): </label>
	    <input type="text" name="rss_url" class="large" maxlength="255" value="{$player.rss_url}" />
	    <br /><br />


	    <br />
            <label for="mailsubject">Mail subject: </label>
            <input type="text" name="mailsubject" class="large" maxlength="100" value="{$player.mailsubject}" /><br />
            <label for="mailbody">Mail body: </label>
	    <input type="text" name="mailbody" class="large" maxlength="255" value="{$player.mailbody}" />


        </fieldset>
        <fieldset style="font-size:11px;">
        <legend>Menu window</legend>  
	    <label for="related">Related window: </label>
            <select name="related">
	    <option value="0" selected="selected">Default</option>
	    </select><br />
	    <label for="related_link">&nbsp;</label>
	    For more related flash options check <a href="http://www.nuevolab.com/plugins">http://www.nuevolab.com/plugins</a>
	    <br />
	    <label for="related_show">Show related window: </label>
            <select name="related_show"><option value="0"{if $player.related_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.related_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="embed_show">Show embed window: </label>
            <select name="embed_show"><option value="0"{if $player.embed_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.embed_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="email_show">Show email window: </label>
            <select name="email_show"><option value="0"{if $player.email_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.email_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="share_show">Show sharing window: </label>
            <select name="share_show"><option value="0"{if $player.share_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.share_show eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    <label for="share_show">Show screen settings window: </label>
            <select name="screen_show"><option value="0"{if $player.screen_show eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.screen_show eq '1'} selected="selected"{/if}>Yes</option></select>

        </fieldset>
        <fieldset style="font-size:11px;">
        <legend>Player Buttons</legend>  
            <label for="replay_button">Replay button: </label>
            <select name="replay_button"><option value="0"{if $player.replay_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.replay_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="zoom_button">Zoom button: </label>
            <select name="zoom_button"><option value="0"{if $player.zoom_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.zoom_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="volume_button">Volume button: </label>
            <select name="volume_button"><option value="0"{if $player.volume_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.volume_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="size_button">Size options button: </label>
            <select name="size_button"><option value="0"{if $player.size_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.size_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
            <label for="fullscreen_button">Fullscreen button: </label>
            <select name="fullscreen_button"><option value="0"{if $player.fullscreen_button eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.fullscreen_button eq '1'} selected="selected"{/if}>Yes</option></select><br />
        </fieldset>
  

	<div style="text-align: center;">
            <input type="submit" name="submit" value="Update Player Settings" class="button">
        </div>
        </form>
        </div>
	</div>

        


        </div>
        </div>
     </div>
