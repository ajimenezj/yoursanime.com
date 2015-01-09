<div id="rightcontent">  {include file="siteadmin/nuevo_errmsg.tpl"}   <div id="right">
        <div align="center">
        <h2>Embed Player Settings</h2>
	<div id="simpleForm">
        <form name="player_settings" method="POST" action="nuevo.php?m=embed">

	 <fieldset style="font-size:11px;">
         <legend>Player settings</legend>
	    <label for="skin_file">Player skin</label>
	    <select name="skin" id="skin">
	      <option value="" selected="selected">Default black</option>
	      {foreach from=$skins item=skin}
		 <option value="{$skin}"{if $player.skin eq $skin} selected="selected"{/if}>{$skin}</option>
	      {/foreach}
	    </select><br />	     
	    <label for="player_width">Player width: </label>	     
	    <input type="text" name="player_width" value="{$player.player_width}" class="small" maxlength="4" /><br />	     
	    <label for="player_height">Player height: </label>	     
	    <input type="text" name="player_height" value="{$player.player_height}" class="small" maxlength="4" /><br />	   
            <label for="playbar">Playbar type: </label>
            <select name="playbar">
	    <option value="bottom" selected="selected">Bottom</option>
	    <option value="over"{if $player.playbar eq 'over'} selected="selected"{/if}>Over screen</option>
	    </select><br />
            </fieldset>
	   
	<fieldset style="font-size:11px;">
        <legend>Basic plugins</legend>	    
	    <label for="plugin_midroll">Preroll Ads Plugin </label>            
	    <select name="plugin_preroll"><option value="1"{if $player.plugin_preroll eq '1'} selected="selected"{/if}>Yes</option><option value="0"{if $player.plugin_preroll eq '0'} selected="selected"{/if}>No</option></select><br />
	    <label for="plugin_midroll">Midroll Ads Plugin </label>
            <select name="plugin_midroll"><option value="1"{if $player.plugin_midroll eq '1'} selected="selected"{/if}>Yes</option><option value="0"{if $player.plugin_midroll eq '0'} selected="selected"{/if}>No</option></select><br />
	    <label for="plugin_overlay">Overlay Ads Plugin </label>
            <select name="plugin_overlay"><option value="1"{if $player.plugin_overlay eq '1'} selected="selected"{/if}>Yes</option><option value="0"{if $player.plugin_overlay eq '0'} selected="selected"{/if}>No</option></select><br />
	    <label for="plugin_ticker">News Ticker Plugin </label>
            <select name="plugin_ticker"><option value="1"{if $player.plugin_ticker eq '1'} selected="selected"{/if}>Yes</option><option value="0"{if $player.plugin_ticker eq '0'} selected="selected"{/if}>No</option></select>
	</fieldset>
	<fieldset style="font-size:11px;">
        <legend>Misc Settings</legend>
	    <label for="stretch">Default video scaling method (flash): </label>
            <select name="stretching">
		<option value="fit"{if $player.stretching eq "fit"} selected="selected"{/if}>Fit to window</option>
		<option value="aspect"{if $player.stretching eq "aspect"} selected="selected"{/if}>Keep aspect ratio</option>
		<option value="original"{if $player.stretching eq "original"} selected="selected"{/if}>Original size</option>
	    </select><br />
	    <label for="autostart">Autostart: </label>
	    <select name="autostart"><option value="0"{if $player.autostart eq '0'} selected="selected"{/if}>No</option><option value="1"{if $player.autostart eq '1'} selected="selected"{/if}>Yes</option></select><br />
	    	    
	    <label for="viral_menu">Viral Menu icon </label>            
	    <select name="viral_menu">
	    <option value="0"{if $player.viral_menu eq '0'} selected="selected"{/if}>No</option>
	    <option value="1"{if $player.viral_menu eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />	    
	    <label for="viral_share">Viral Share icon </label>            
	    <select name="viral_share">
	    <option value="0"{if $player.viral_share eq '0'} selected="selected"{/if}>No</option>
	    <option value="1"{if $player.viral_share eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />            	    
	    <label for="viral_slomo">Viral Slowmotion icon </label>            
	    <select name="viral_slomo">
	    <option value="0"{if $player.viral_slomo eq '0'} selected="selected"{/if}>No</option>
	    <option value="1"{if $player.viral_slomo eq '1'} selected="selected"{/if}>Yes</option>
	    </select><br />	    
        </fieldset>
       <fieldset style="font-size:11px;">        
       <legend>Menu window</legend>  	    
       <label for="related">Related window: </label>            
       <select name="related">
       <option value="0" selected="selected">Default</option>
       </select><br />	    
	    <label for="related_link">&nbsp;</label>
	    For more options check <a href="http://www.nuevolab.com/plugins">http://www.nuevolab.com/plugins</a>
	    <br />
       <label for="related_show">Show related window: </label>            
       <select name="related_show">
       <option value="0"{if $player.related_show eq '0'} selected="selected"{/if}>No</option>
       <option value="1"{if $player.related_show eq '1'} selected="selected"{/if}>Yes</option>
       </select><br />	   
       <label for="embed_show">Show embed window: </label>            
       <select name="embed_show">
       <option value="0"{if $player.embed_show eq '0'} selected="selected"{/if}>No</option>
       <option value="1"{if $player.embed_show eq '1'} selected="selected"{/if}>Yes</option>
       </select><br />	   
       <label for="email_show">Show email window: </label>            
       <select name="email_show">
       <option value="0"{if $player.email_show eq '0'} selected="selected"{/if}>No</option>
       <option value="1"{if $player.email_show eq '1'} selected="selected"{/if}>Yes</option>
       </select><br />	    
       <label for="share_show">Show sharing window: </label>            
       <select name="share_show">
       <option value="0"{if $player.share_show eq '0'} selected="selected"{/if}>No</option>
       <option value="1"{if $player.share_show eq '1'} selected="selected"{/if}>Yes</option>
       </select><br />	    
       <label for="share_show">Show video settings window: </label>            
       <select name="screen_show">
       <option value="0"{if $player.screen_show eq '0'} selected="selected"{/if}>No</option>
       <option value="1"{if $player.screen_show eq '1'} selected="selected"{/if}>Yes</option>
       </select>        
       </fieldset>        
       <fieldset style="font-size:11px;">       
	<legend>Player Buttons</legend>             
	<label for="replay_button">Replay button: </label>            
	<select name="replay_button">
	<option value="0"{if $player.replay_button eq '0'} selected="selected"{/if}>No</option>
	<option value="1"{if $player.replay_button eq '1'} selected="selected"{/if}>Yes</option>
	</select><br />            
	<label for="zoom_button">Zoom button: </label>            
	<select name="zoom_button">
	<option value="0"{if $player.zoom_button eq '0'} selected="selected"{/if}>No</option>
	<option value="1"{if $player.zoom_button eq '1'} selected="selected"{/if}>Yes</option>
	</select><br />            
	<label for="volume_button">Volume button: </label>            
	<select name="volume_button">
	<option value="0"{if $player.volume_button eq '0'} selected="selected"{/if}>No</option>
	<option value="1"{if $player.volume_button eq '1'} selected="selected"{/if}>Yes</option>
	</select><br />            
	<label for="size_button">Size options button: </label>            
	<select name="size_button">
	<option value="0"{if $player.size_button eq '0'} selected="selected"{/if}>No</option>
	<option value="1"{if $player.size_button eq '1'} selected="selected"{/if}>Yes</option>
	</select><br />            
	<label for="fullscreen_button">Fullscreen button: </label>            
	<select name="fullscreen_button">
	<option value="0"{if $player.fullscreen_button eq '0'} selected="selected"{/if}>No</option>
	<option value="1"{if $player.fullscreen_button eq '1'} selected="selected"{/if}>Yes</option>
	</select><br />        
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
