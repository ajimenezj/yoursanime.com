<?php
//***********************************************
//*		Seo Mod ver. 1.0						*
//*		Clipshare 4.xx							*
//*												*
//*		http://www.clipshare.nuevolab.com		*
//*		email: support@nuevolab.com				*
//*												*
//***********************************************
require('include/config.php');
error_reporting(E_ALL ^ E_NOTICE);
ini_set('display_errors', 1);

echo "<br /><br /><center>";
echo "<h1>Seo Mod ver. 1.0	 SETUP</h1>";
echo "<br />";

if(isset($_REQUEST['install_now'])) {

echo '<table border="0" cellpadding="4">';
echo '<tr>';
echo '<td align="left">Installing Seo table</td><td>';

$sql= "DROP TABLE `seo`";
$conn->execute($sql);

$sql = "CREATE TABLE IF NOT EXISTS `seo` (
  `id` int(11) NOT NULL,
  `page` varchar(30) collate utf8_unicode_ci NOT NULL,
  `explain` varchar(200) collate utf8_unicode_ci NOT NULL,
  `title` varchar(100) collate utf8_unicode_ci NOT NULL,
  `description` varchar(200) collate utf8_unicode_ci NOT NULL,
  `keywords` varchar(200) collate utf8_unicode_ci NOT NULL,
  `follow` tinyint(1) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;";

$result1 = $conn->execute($sql);

$sql = "INSERT INTO `seo` (`id`, `page`, `explain`, `title`, `description`, `keywords`, `follow`) VALUES
(1, 'video', 'Videos page', '', '', '', 0),
(2, 'channels', 'Channels page', '', '', '', 1),
(3, 'channel_detail', 'Single channel page', '', '', '', 1),
(4, 'about', 'About page', '', '', '', 1),
(5, 'confirm_email', 'Email confirm page', '', '', '', 0),
(6, 'ffavour', 'Friends favourite videos page', '', '', '', 1),
(7, 'friend_accept', 'Accept friend page', '', '', '', 1),
(8, 'friends', 'Friends page', '', '', '', 1),
(9, 'fvideos', 'Friends videos', '', '', '', 1),
(10, 'groups', 'Groups page', '', '', '', 1),
(11, 'help', 'Help page', '', '', '', 1),
(12, 'privacy', 'Privacy page', '', '', '', 1),
(13, 'login', 'Login page', '', '', '', 1),
(14, 'members', 'Community (members) page', '', '', '', 1),
(15, 'recover', 'Recover password page', '', '', '', 1),
(16, 'search_group', 'Search group page', '', '', '', 1),
(17, 'search_result', 'Search results page', '', '', '', 1),
(18, 'signup', 'Signup page', '', '', '', 1),
(19, 'terms', 'Terms page', '', '', '', 1),
(20, 'ufavour', 'User favourite page', '', '', '', 1),
(21, 'ufriends', 'User friends page', '', '', '', 1),
(22, 'ugroups', 'User group page', '', '', '', 1),
(23, 'uplaylist', 'User playlist', '', '', '', 1),
(24, 'upload', 'Upload page', '', '', '', 1),
(25, 'upload_success', 'Upload success page', '', '', '', 1),
(26, 'uprofile', 'User profile page', '', '', '', 1),
(27, 'uvideos', 'User videos', '', '', '', 1);";

$result2 = $conn->execute($sql);


if($result1 && $result2)
  echo "OK</td></tr></table>";
else
echo "ERROR</td></tr></table>";

echo "<center><br /><br />SETUP END</center"; 

}




else {
echo '<b>This will install seo table in database</b><br /><br />';
echo '<form method="post" action="">';
echo '<input type="hidden" name="install_now" value="1" />';
echo '<input type="submit" name="submit" value="Install Now" />';
echo "</form>";

}


?>
