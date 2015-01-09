{include file="footeradvert.tpl"}
<div id="footer">
	 <ul>
	  <li><a href="{seourl rewrite='about' url='about.php'}">{translate item='global.about_us'}</a><span class="textF">|</span></li>
		<li><a href="{seourl rewrite='help' url='help.php'}">{translate item='global.help'}</a><span class="textF">|</span></li>
		<li><a href="{seourl rewrite='advertise' url='dev.php'}">{translate item='global.advertise'}</a><span class="textF">|</span></li>
		<li><a href="{seourl rewrite='terms' url='terms.php'}">{translate item='global.terms'}</a><span class="textF">|</span></li>
		<li><a href="{seourl rewrite='privacy' url='privacy.php'}">{translate item='global.privacy'}</a><span class="textF">|</span></li>
		<li><a href="{seourl rewrite='rss' url='rss.php'}">Rss Feeds</a><span class="textF">|</span></li>
		<li><a href="{seourl rewrite='contact' url='contact.php'}">Contact US</a></li>
	 </ul>
	 <p class="textFooter">Copyright &copy; {php} echo date('Y'); {/php} <a href="http://www.yoursanime.com">{$site_name}</a></p>	 
	</div>
<!-- End Footer -->
 </div>
{literal}
    <script type="text/javascript">
    //anylinkmenu.init("menu_anchors_class") //call this function at the very *end* of the document!
    anylinkmenu.init("menuanchorclass")
    </script>
{/literal}
{literal}
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-38235542-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
{/literal}    
</body>
</html>