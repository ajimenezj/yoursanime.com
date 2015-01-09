<?php
//***********************************************
//*		NuevoLab FLASH PLAYER ver. 5.0			*
//*		Peel effect	plugin						*
//*												*
//*		http://www.nuevolab.com					*
//*		email: support@nuevolab.com				*
//*												*
//***********************************************

define('_VALID', true);
require('include/config.php');

echo "<br /><br /><center>";
echo "<h1>Peel Effect plugin for Nuevoplayer v5 SETUP</h1>";
echo "<br />";

if(isset($_REQUEST['install_now'])) {

echo '<table border="0" cellpadding="4">';
echo '<tr>';
echo '<td align="left">Installing necessary MySQL tables</td><td>';

$sql= "DROP TABLE IF EXISTS `nuevo__peel`";
$conn->execute($sql);

$sql = "CREATE TABLE `nuevo__peel` (
`ID` INT( 11 ) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`active` INT( 1 ) NOT NULL DEFAULT '0',
`image` VARCHAR( 250 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
`url` VARCHAR( 250 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
`target` VARCHAR( 6 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '_blank',
`title` VARCHAR( 50 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
`subtitle` VARCHAR( 80 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;";

$result1 = $conn->execute($sql);



if($result1)
  echo "OK</td></tr></table>";
else
  echo "ERROR</td></tr></table>";

echo "<center><br /><br />SETUP END</center"; 

}




else {?>

<b>This will install required MySQL table for NuevoPlayer Peel Effect</b><br /><br />
<form method="post" action="">
<input type="hidden" name="install_now" value="1" />
<input type="submit" name="submit" value="Install Now" />
</form>
</center>

<?php }


?>
