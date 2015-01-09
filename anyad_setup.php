<?php
//***********************************************
//*		NuevoLab FLASH PLAYER ver. 5.0			*
//*		Any HTML AD								*
//*												*
//*		http://www.nuevolab.com					*
//*		email: support@nuevolab.com				*
//*												*
//***********************************************

define('_VALID', true);
require('include/config.php');

echo "<br /><br /><center>";
echo "<h1>AnyAd Premium Plugin for Nuevoplayer v5 SETUP</h1>";
echo "<br />";

if(isset($_REQUEST['install_now'])) {

echo '<table border="0" cellpadding="4">';
echo '<tr>';
echo '<td align="left">Installing necessary MySQL tables</td><td>';

$sql = "DROP TABLE IF EXISTS `nuevo__htmlad`";
$conn->execute($sql);

$sql = "CREATE TABLE IF NOT EXISTS `nuevo__htmlad` (
  `ID` int(11) NOT NULL auto_increment,
  `ad_name` varchar(50) collate utf8_unicode_ci NOT NULL default '',
  `ad_type` varchar(20) collate utf8_unicode_ci NOT NULL default 'pause',
  `ad_menu` tinyint(1) NOT NULL default '1',
  `ad_method` varchar(10) collate utf8_unicode_ci NOT NULL default 'click',
  `ad_timer` int(11) NOT NULL default '8',
  `midroll_start` int(11) NOT NULL default '5',
  `back_color` varchar(6) collate utf8_unicode_ci NOT NULL default 'FFFFFF',
  `progress_color` varchar(6) collate utf8_unicode_ci NOT NULL default '990000',
  `bar_offset` int(11) NOT NULL default '40',
  `ad_width` int(11) NOT NULL default '300',
  `ad_height` int(11) NOT NULL default '250',
  `ad_position` varchar(10) collate utf8_unicode_ci NOT NULL default 'center',
  `ad_closepic` varchar(5) collate utf8_unicode_ci NOT NULL default 'big',
  `ad_closeoffset` int(11) NOT NULL default '0',
  `ad_content` text collate utf8_unicode_ci NOT NULL,
  `channel` int(11) NOT NULL default '0',
  `expire` varchar(30) collate utf8_unicode_ci NOT NULL default '',
  `addtime` varchar(40) collate utf8_unicode_ci NOT NULL default '',
  `active` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;";


$result1 = $conn->execute($sql);


if($result1)
  echo "MYSQL TABLE INSTALLED CORRECTLY!</td></tr></table>";
else
  echo "ERROR WHILE CREATING MYSQL TABLE</td></tr></table>";

echo "<center><br /><br />SETUP END</center"; 

}




else {?>

<b>This will install required MySQL table for NuevoPlayer AnyAd Premium Plugin</b><br /><br />
<form method="post" action="">
<input type="hidden" name="install_now" value="1" />
<input type="submit" name="submit" value="Install Now" />
</form>
</center>

<?php }


?>
