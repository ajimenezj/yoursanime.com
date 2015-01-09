{strip}

{if $video.embed_code != '' && $isyoutube != '1'}
<center>{$video.embed_code}</center>
{else}

   <script type="text/javascript" id="nuevo" src="{$baseurl}/nuevo/player.js" charset="utf-8"></script>
   
   <div style="width:{$nuevo.player_width}px;height:{$nuevo.player_height}px;position:relative;">
   <div id="main"></div>
   <script type="text/javascript">
      var cnf='{$baseurl}/nuevo/config.php?key={$viewkey}'; var w='100%'; var h='100%';
      {literal}nvplayer.start( { id:'main',config: cnf,width:w,height:h,}); {/literal}
  </script>
  {if $anyad eq '1'}{php}$vid=$this->_tpl_vars['vid']; include("adserve.php");{/php}{/if}
  </div>

  

{/if}
{/strip}
