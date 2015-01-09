<div id="mediaplace"></div>
<script type="text/javascript" src="{$baseurl}/js/swfobject.js"></script>
<script type="text/javascript">
        var nv="{$baseurl}/player/vPlayer.swf?f={$baseurl}/player/vConfig.php?vkey={$viewkey}";
        {literal}
        var so = new SWFObject(nv, "nuevoplayer", "765", "455", 8, "#000000");
        so.addParam("quality", "high");
        so.addParam("swLiveConnect", "true");
        so.addParam("allowScriptAccess", "always");
        so.addParam("allowFullScreen", "true");
        so.write("mediaplace");
        {/literal}
</script>

