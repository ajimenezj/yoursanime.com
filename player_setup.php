<?php
//***********************************************
//*		NuevoLab FLASH PLAYER ver. 8			*
//*												*
//*		http://www.nuevolab.com					*
//*		email: support@nuevolab.com				*
//*												*
//***********************************************

define('_VALID', true);
require('include/config.php');

$regkey = '';
$domain = $config['BASE_URL'];



echo "<br /><br /><center>";
echo "<h1>NuevoLab Player ver. 8 SETUP</h1>";
echo "<br />";

if(isset($_POST['install_now'])) {


	if(isset($_POST['domain'])) { $domain=trim($_POST['domain']); } 
	if(isset($_POST['regkey'])) { $regkey=trim($_POST['regkey']); } 

	echo '<table border="0" cellpadding="4">';
	echo '<tr>';
	echo '<td align="left">Installing Player table</td><td>';

	$sql= "DROP TABLE IF EXISTS `nuevo__player`";
	$conn->execute($sql);

	$sql = "CREATE TABLE IF NOT EXISTS `nuevo__player` (
  `ID` int(11) NOT NULL auto_increment,
  `regkey` varchar(50) collate utf8_unicode_ci NOT NULL,
  `skin` varchar(20) collate utf8_unicode_ci NOT NULL default '',
  `playback_method` varchar(20) collate utf8_unicode_ci NOT NULL default 'flash',
  `autostart` tinyint(1) NOT NULL default '1',
  `stretching` varchar(10) collate utf8_unicode_ci NOT NULL default 'aspect',
  `volume` int(11) NOT NULL default '60',
  `usetooltips` tinyint(1) NOT NULL default '1',
  `playbar` varchar(10) collate utf8_unicode_ci NOT NULL default 'bottom',
  `wmode` varchar(20) collate utf8_unicode_ci NOT NULL default 'opaque',
  `related_show` tinyint(1) NOT NULL default '1',
  `embed_show` tinyint(1) NOT NULL default '1',
  `email_show` tinyint(1) NOT NULL default '1',
  `share_show` tinyint(1) NOT NULL default '1',
  `screen_show` tinyint(1) NOT NULL default '1',
  `bufferlength` int(11) NOT NULL default '1',
  `viral_menu` tinyint(1) NOT NULL default '1',
  `viral_share` tinyint(1) NOT NULL default '1',
  `viral_slomo` tinyint(1) NOT NULL default '1',
  `viral_lights` tinyint(1) NOT NULL default '0',
  `viral_offset` int(11) NOT NULL default '10',
  `viral_align` varchar(10) collate utf8_unicode_ci NOT NULL default 'right',
  `show_logo` tinyint(1) NOT NULL default '1',
  `barlogo` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `logo` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `logourl` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `logoalign` varchar(2) collate utf8_unicode_ci NOT NULL default 'RT',
  `logooffsetx` int(11) NOT NULL default '10',
  `logooffsety` int(11) NOT NULL default '10',
  `menuitem` tinyint(1) NOT NULL default '1',
  `menutext` varchar(30) collate utf8_unicode_ci NOT NULL default '',
  `menulink` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `replay_button` tinyint(1) NOT NULL default '1',
  `zoom_button` tinyint(1) NOT NULL default '1',
  `fullscreen_button` tinyint(1) NOT NULL default '1',
  `volume_button` tinyint(1) NOT NULL default '1',
  `size_button` tinyint(1) NOT NULL default '1',
  `onclick` varchar(5) collate utf8_unicode_ci NOT NULL default 'play',
  `linktarget` varchar(10) collate utf8_unicode_ci NOT NULL default '_self',
  `statscript` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `rss_url` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `mailsubject` varchar(255) collate utf8_unicode_ci NOT NULL default 'Cool video!',
  `mailbody` varchar(255) collate utf8_unicode_ci NOT NULL default 'Check this video:',
  `plugins` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `player_width` int(11) NOT NULL default '540',
  `player_height` int(11) NOT NULL default '370',
  `watch_limit_use` tinyint(1) NOT NULL default '0',
  `limit_start` int(11) NOT NULL default '30',
  `limit_media` varchar(200) collate utf8_unicode_ci NOT NULL default '',
  `limit_url` varchar(200) collate utf8_unicode_ci NOT NULL default '',
  `related` varchar(30) collate utf8_unicode_ci NOT NULL default '',
  `plugin_preroll` tinyint(1) NOT NULL default '0',
  `plugin_midroll` tinyint(1) NOT NULL default '0',
  `plugin_overlay` tinyint(1) NOT NULL default '0',
  `slidebackcolor` varchar(6) collate utf8_unicode_ci NOT NULL default 'e5e5e5',
  `slidetextcolor` varchar(6) collate utf8_unicode_ci NOT NULL default '000000',
  `slideversion` tinyint(1) NOT NULL default '1',
  `plugin_ticker` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
	) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;";

	$result1 = $conn->execute($sql);
	if($result1) echo "OK</td></tr>"; else echo "ERROR</td></tr>";

	echo "<tr><td>Inserting Player data</td><td>";

	$sql = "INSERT INTO `nuevo__player` SET ID = '1'";
	$result2 = $conn->execute($sql);
	$sql = "INSERT INTO `nuevo__player` SET ID = '2'";
	$result3 = $conn->execute($sql);
	$sql = "INSERT INTO `nuevo__player` SET ID = '3'";
	$result3 = $conn->execute($sql);

	if($result2 && $result3) echo "OK</td></tr>"; else echo "ERROR</td></tr>";

	$sql = "UPDATE nuevo__player SET autostart = '0', WHERE ID='2' OR ID='3'";
	$conn->execute($sql);


	$sql = "UPDATE nuevo__player SET onclick='url', linktarget='_blank', player_width='540', player_height='380' WHERE ID='2'";
	$conn->execute($sql);

	if($regkey != "") {
		$sql = "UPDATE nuevo__player SET `regkey` = '".$regkey."'"; $conn->execute($sql);
	}
	if($domain != "") {
		$domain = trim($domain,'/');
		$stripdomain = str_replace('www','',$domain);
		$stripdomain = str_replace('http://','',$stripdomain);
		$stripdomain = trim($stripdomain,".");

		$sql = "UPDATE nuevo__player SET `menutext` = '".$stripdomain."'"; $conn->execute($sql);

		$sql = "UPDATE nuevo__player SET `menulink` = '".$domain."', `logourl` = '".$domain."'"; $conn->execute($sql);

		$sql = "UPDATE nuevo__player SET `statscript` = '".$domain."/media/nuevo/stat.php'"; $conn->execute($sql);
	}



	echo "<tr><td>Installing Midroll Ads table</td><td>";

	$sql= "DROP TABLE IF EXISTS `nuevo__midroll`";
	$conn->execute($sql);

	$sql = "CREATE TABLE IF NOT EXISTS `nuevo__midroll` (
  `ID` int(11) NOT NULL auto_increment,
  `owner` varchar(50) collate utf8_unicode_ci NOT NULL,
  `email` varchar(255) collate utf8_unicode_ci NOT NULL,
  `channel` int(11) NOT NULL default '0',
  `duration` int(11) NOT NULL default '8',
  `title` varchar(80) collate utf8_unicode_ci NOT NULL,
  `description` varchar(150) collate utf8_unicode_ci NOT NULL,
  `url` varchar(255) collate utf8_unicode_ci NOT NULL,
  `link` varchar(100) collate utf8_unicode_ci NOT NULL,
  `image` varchar(255) collate utf8_unicode_ci NOT NULL,
  `added` varchar(40) collate utf8_unicode_ci NOT NULL,
  `expire` varchar(40) collate utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL default '0',
  `views` int(11) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
	) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";

	$result5 = $conn->execute($sql);
	if($result5)
		echo "OK</td></tr>";
	else
		echo "ERROR</td></tr>";

	echo "<tr><td>Installing Midroll Settings table</td><td>";

	$sql= "DROP TABLE IF EXISTS `nuevo__midroll_settings`";
	$conn->execute($sql);

	$sql = "CREATE TABLE IF NOT EXISTS `nuevo__midroll_settings` (
  `ID` int(11) NOT NULL auto_increment,
  `background` varchar(6) character set utf8 collate utf8_unicode_ci NOT NULL default '000000',
  `opacity` int(11) NOT NULL default '50',
  `outline` tinyint(1) NOT NULL default '1',
  `titlecolor` varchar(6) character set utf8 collate utf8_unicode_ci NOT NULL default 'FFFFFF',
  `desccolor` varchar(6) character set utf8 collate utf8_unicode_ci NOT NULL default 'BBBBBB',
  `linkcolor` varchar(6) character set utf8 collate utf8_unicode_ci NOT NULL default '7D9BBF',
  `hovercolor` varchar(6) character set utf8 collate utf8_unicode_ci NOT NULL default 'FF0000',
  `aboutcolor` varchar(6) character set utf8 collate utf8_unicode_ci NOT NULL default '7D9BBF',
  `abouttext` varchar(30) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `abouturl` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `canclose` tinyint(1) NOT NULL default '1',
  `defstart` int(11) NOT NULL default '5',
  `defruntime` int(11) NOT NULL default '10',
  PRIMARY KEY  (`ID`)
	) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;";

	$result6 = $conn->execute($sql);
	if($result6) {
		echo "OK</td></tr>";
		
		$sql = "INSERT INTO `nuevo__midroll_settings` SET ID = '1'";
		$conn->execute($sql);	
	
	} else
		echo "ERROR</td></tr>";


	echo "<tr><td>Installing Random Preroll table</td><td>";



	$sql= "DROP TABLE IF EXISTS `nuevo__preroll`";
	$conn->execute($sql);

	$sql = "CREATE TABLE IF NOT EXISTS `nuevo__preroll` (
  `ID` int(11) NOT NULL auto_increment,
  `channel` int(11) NOT NULL default '0',
  `url` varchar(255) collate utf8_unicode_ci NOT NULL,
  `link` varchar(100) collate utf8_unicode_ci NOT NULL,
  `runtime` int(11) NOT NULL default '10',
  `skipad` int(11) NOT NULL default '0',
  `owner` varchar(100) collate utf8_unicode_ci NOT NULL,
  `target` varchar(10) character set utf8 collate utf8_unicode_ci NOT NULL default '_blank',
  `email` varchar(255) collate utf8_unicode_ci NOT NULL,
  `added` varchar(40) collate utf8_unicode_ci NOT NULL,
  `expire` varchar(40) collate utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL,
  `hits` int(11) NOT NULL default '0',
  `views` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";

	$result7 = $conn->execute($sql);
	if($result7)
		echo "OK</td></tr>";
	else
		echo "ERROR</td></tr>";


	echo "<tr><td>Installing Overlay table</td><td>";


	$sql= "DROP TABLE IF EXISTS `nuevo__overlay`";
	$conn->execute($sql);

	$sql = "CREATE TABLE IF NOT EXISTS `nuevo__overlay` (
  `ID` int(11) NOT NULL auto_increment,
  `title` varchar(40) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `media` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `url` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `target` varchar(10) character set utf8 collate utf8_unicode_ci NOT NULL default '_blank',
  `start` int(11) NOT NULL default '10',
  `pause` int(11) NOT NULL default '0',
  `delay` int(11) NOT NULL default '4',
  `runtime` int(11) NOT NULL default '5',
  `active` tinyint(1) NOT NULL default '0',
  `addtime` varchar(40) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `expire` varchar(40) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `owner` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `email` varchar(200) character set utf8 collate utf8_unicode_ci NOT NULL default '',
  `channel` int(11) NOT NULL default '0',
  `views` int(11) NOT NULL default '0',
  `hits` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
	) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";

	$result8 = $conn->execute($sql);
	if($result8)
		echo "OK</td></tr>";
	else
		echo "ERROR</td></tr>";

	echo "<tr><td>Installing Player News Ticker table</td><td>";

	$sql= "DROP TABLE IF EXISTS `nuevo__ticker`";
	$conn->execute($sql);

	$sql = "CREATE TABLE IF NOT EXISTS `nuevo__ticker` (
  `ID` int(11) NOT NULL auto_increment,
  `text` varchar(250) NOT NULL default '',
  `start` int(11) NOT NULL default '3',
  `runtime` int(11) NOT NULL default '10',
  `url` varchar(200) NOT NULL default '',
  `target` varchar(10) NOT NULL default '_blank',
  `position` varchar(10) NOT NULL default 'top',
  `addtime` varchar(40) NOT NULL default '',
  `active` tinyint(11) NOT NULL default '0',
  `opacity` int(11) NOT NULL default '50',
  `scrollspeed` int(11) NOT NULL default '5',
  PRIMARY KEY  (`ID`)
	) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";

	$result9 = $conn->execute($sql);
	if($result9)
		echo "OK</td></tr></table>";
	else
		echo "ERROR</td></tr></table>";


	echo "<center><br /><br /><b>SETUP END</b></center"; 

} else {?>

<b>This will install all required tables for NuevoLab Player</b><br /><br />
<form method="post" action="">
<table  border="0">
<tr><td align="right">Your website URL:</td>
<td align="right"><input type="text" name="domain" size="50" value="<?php echo $domain;?>" /></td></tr>
<tr><td align="right">Your license key:</td>
<td align="right"><input type="text" name="regkey" size="50" value="<?php echo $regkey;?>" />
</td></tr>
</table><br /><br />

<input type="hidden" name="install_now" value="1" />
<input type="submit" name="submit" value="Install Now" />


</form>
</center>

<?php }


?>