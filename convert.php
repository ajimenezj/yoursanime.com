<?php
require('include/config.php');
require('include/function.php');

// Get arguments from the argv array 
$vdoname = $_SERVER['argv']['1']; 
$vid = $_SERVER['argv']['2']; 
$ff = $_SERVER['argv']['3']; 

if( ( $vdoname != '' ) && ( $vid != '' ) && ( $ff != '') ) {
    $ext                = strtolower(substr($vdoname, strrpos($vdoname, '.') + 1));
    $mencoder_version   = '1.0rc1';
    exec($config['mencoder'], $mencoder_check);
    if ( isset($mencoder_check['0']) ) {
        if ( !strstr($mencoder_check['0'], 'MEncoder 1.0rc1') ) {
            $mencoder_version = '1.0rc2';
        }
    }
        $vres = ( $config['vresize'] == 1) ? ' -s '.$config['vresize_x'].'x'.$config['vresize_y'] : NULL;
	$config['abrate'] = '56';
	$encodecommand = $config['ffmpeg'].' -i '.$config[VDO_DIR].'/'.$vdoname.$vres.' -ab '.$config['abrate'].'k -ar '.$config['sbitrate'].' -ac 1 -vcodec flv -b '.$config['vbitrate'].'k -y '.$config[FLVDO_DIR].'/'.$vid.'x.flv';
	
	log_conversion($config['LOG_DIR']. '/' .$vid. '.log', $encodecommand);
	
	$ext = strtolower(substr($vdoname, strrpos($vdoname, '.') + 1));
//	if ( $config['vresize'] != 1 && $ext == 'flv' )
//		copy($ff, $config['FLVDO_DIR']. '/' .$vid. 'x.flv');
//	else
		exec($encodecommand. ' 2>&1', $output);
	
	log_conversion($config['LOG_DIR']. '/' .$vid. '.log', implode("\n", $output));
	
	//update flv metatags
	exec($config['metainject']. ' -Uv ' .$config['FLVDO_DIR']. '/' .$vid. 'x.flv ' .$config['FLVDO_DIR']. '/' .$vid. '.flv');

	//remove temporary
	@unlink($config['FLVDO_DIR']. '/' .$vid. 'x.flv');

	//create thumbnails
	video_to_frame($ff, $vid);
	
	//delete log if conversion was successfuly
	if ( file_exists($config['FLVDO_DIR']. '/' .$vid. '.flv') && filesize($config['FLVDO_DIR']. '/' .$vid. '.flv') > 10 )
		@unlink($config['TMP_DIR']. '/logs/' .$vid. '.log');
	// Mobile Plugin
        if($config['mobile_convert'] == 'true'){
                require 'include/function_mobile.php';
                $inputfile = $config['VDO_DIR'].'/'.$vdoname;
                $outputfile = $config['IPODVDO_DIR'].'/'.$vid.'.mp4';
                  if(convert_to_iphone_ffmpeg($inputfile, $outputfile, $vid)){
                    $conn->execute("UPDATE video SET iphone = '1' WHERE VID = ".(int)$vid." LIMIT 1");
          }
        }
	//delete original video
	if($config['del_original_video'] == 1)  {
    		if(filesize($config['FLVDO_DIR']. '/' .$vid. '.flv') > 100 && file_exists($config['FLVDO_DIR']. '/' .$vid. '.flv')) {
    			$del_upvid = $config['VDO_DIR']. '/' .$vdoname; 
    			@chmod($del_upvid, 0777); 
    			@unlink($del_upvid);
    		} 
	}

	// Delete Tmp Files
	$picA = $config['TMP_DIR']. '/thumbs/' .$vid. '/00000001.jpg';
	$picB = $config['TMP_DIR']. '/thumbs/' .$vid. '/00000002.jpg';
	$picC = $config['TMP_DIR']. '/thumbs/' .$vid. '/00000003.jpg';
	$picD = $config['TMP_DIR']. '/thumbs/' .$vid. '/00000004.jpg';
	if(file_exists($picA)) @unlink($picA);
	if(file_exists($picB)) @unlink($picB);
	if(file_exists($picC)) @unlink($picC);
	if(file_exists($picD)) @unlink($picD);

	@rmdir($config['TMP_DIR']. '/thumbs/' .$vid);
}
?>