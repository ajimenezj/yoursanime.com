     <div id="rightcontent">
        {include file="siteadmin/errmsg.tpl"}
        <div id="right">
        <div align="center">
        <h2>Mobile Settings</h2>
        <div id="simpleForm">
        <form name="media_settings" method="POST" action="index.php?m=mobile">
        <fieldset>
        <legend>iPhone Conversion Settings</legend>
        
        	<label for="mobile_convert" style="width: 35%;">Mobile Video Conversions: </label>
        	<select name="mobile_convert">
            <option value="true"{if $mobile_convert == 'true'} selected="selected"{/if}>Enabled</option>
            <option value="false"{if $mobile_convert == 'false'} selected="selected"{/if}>Disabled</option>
            </select><br>
            
			<label for="mobile_meta_title" style="width: 35%;">Mobile Meta Title: </label>
            <input type="text" name="mobile_meta_title" value="{$mobile_meta_title}" class="large"><br>            
            <label for="mobile_meta_desc" style="width: 35%;">Mobile Meta Description: </label>
            <input type="text" name="mobile_meta_desc" value="{$mobile_meta_desc}" class="large"><br>
            <label for="mobile_meta_keywords" style="width: 35%;">Mobile Meta Keywords: </label>
            <input type="text" name="mobile_meta_keywords" value="{$mobile_meta_keywords}" class="large"><br>
            
        	<label for="mobile_appmode" style="width: 35%;">Mobile Web-app Mode: </label>
        	<select name="mobile_appmode">
            <option value="true"{if $mobile_appmode == 'true'} selected="selected"{/if}>Enabled</option>
            <option value="false"{if $mobile_appmode == 'false'} selected="selected"{/if}>Disabled</option>
            </select><br>
            
        	<label for="mobile_force_redirect" style="width: 35%;">Force Mobile Redirect: </label>
            <select name="mobile_force_redirect">
            <option value="true"{if $mobile_force_redirect == 'true'} selected="selected"{/if}>Enabled</option>
            <option value="false"{if $mobile_force_redirect == 'false'} selected="selected"{/if}>Disabled</option>
            </select><br>
            
			<label for="mobile_view_limit" style="width: 35%;">View Per Page: </label>
            <select name="mobile_view_limit">
            <option value="5"{if $mobile_view_limit == '5'} selected="selected"{/if}>5</option>
            <option value="10"{if $mobile_view_limit == '10'} selected="selected"{/if}>10</option>
            <option value="15"{if $mobile_view_limit == '15'} selected="selected"{/if}>15</option>
            <option value="10"{if $mobile_view_limit == '20'} selected="selected"{/if}>20</option>
            </select><br>
            
            

            <label for="mobile_default_type" style="width: 35%;">Default Video Type: </label>
            <select name="mobile_default_type">
            <option value="recent"{if $mobile_default_type == 'recent'} selected="selected"{/if}>Most Recent</option>
            <option value="rating"{if $mobile_default_type == 'rating'} selected="selected"{/if}>Highest Rated</option>
            <option value="popular"{if $mobile_default_type == 'popular'} selected="selected"{/if}>Most Popular</option>
            </select><br>




            <!-- Encoding Passes -->
	        <label for="iphone_encode_passes" style="width: 35%;">Encoding Passes: </label>
	        <select name="iphone_encode_passes">
	        <option value="1"{if $iphone_encode_passes eq "1"} selected="selected"{/if}>1 Pass</option>
	        <option value="2"{if $iphone_encode_passes eq "2"} selected="selected"{/if}>2 Pass</option>
	        </select>
	        <small style="color:#bbb; font-weight:0.8em;">Default: <i>2 Pass</i></small><br> 
	        
	        <!-- OVC Profile -->
	        <label for="iphone_ovc_profile" style="width: 35%;">OVC Profile: </label>
	        <select name="iphone_ovc_profile">
	        <option value="standard"{if $iphone_ovc_profile eq "standard"} selected="selected"{/if}>Standard</option>
	        </select>
	        <small style="color:#bbb; font-weight:0.8em;">Default: <i>Standard</i></small><br> 
	        
	        <!-- Bitrate Type -->
	        <script type="text/javascript">
	        {literal}
	        function hdvbr(id){
	        	var val = document.getElementById(id).value
	        	if(val == 'fix'){
	        		document.getElementById('btr').style.display = "block"
	        	}else{
	        		document.getElementById('btr').style.display = "none"
	        	}
	        }
	        {/literal}
	        </script>
	        <label for="iphone_ref_type" style="width: 35%;">Video Bitrate: </label>
	        <select name="iphone_ref_type" id="hdvdr" onchange="hdvbr(this.id)">
	        <option value="standard"{if $iphone_ref_type eq "standard"} selected="selected"{/if}>Auto Calculated</option>
	        <option value="fix"{if $iphone_ref_type eq "fix"} selected="selected"{/if}>Fixed</option>
	        </select>
	        <small style="color:#bbb; font-weight:0.8em;">Default: <i>Auto Calculated</i></small><br> 
	               		       
 			<!-- Video Bit-Rate -->  
 			<div id="btr" {if $iphone_ref_type eq "standard"}style="display:none;"{else}style="display:block;"{/if}>        	
	        <label for="iphone_vbitrate" style="width: 35%;">Fixed Video Bitrate (in Kbps): </label>
	        <input type="text" name="iphone_vbitrate" value="{$iphone_vbitrate}">
	        <small style="color:#bbb; font-weight:0.8em;">Default: <i>1500</i></small><br> 
			</div>
			<!-- Blackbars -->
	        <label for="iphone_blackbars" style="width: 35%;">Blackbars: </label>
	        <select name="iphone_blackbars">
	        <option value="1"{if $iphone_blackbars eq "1"} selected="selected"{/if}>Yes</option>
	        <option value="0"{if $iphone_blackbars eq "0"} selected="selected"{/if}>No</option>
	        </select>
	        <small style="color:#bbb; font-weight:0.8em;">Default: <i>No</i></small><br> 	        
	          		       
	        <!-- Resize Base -->
	        <label for="iphone_resize_base" style="width: 35%;">Resize Base: </label>
	        <select name="iphone_resize_base">
	        <option value="area"{if $iphone_resize_base eq "area"} selected="selected"{/if}>Area</option>
	        <option value="width"{if $iphone_resize_base eq "width"} selected="selected"{/if}>Width</option>
	        <option value="height"{if $iphone_resize_base eq "height"} selected="selected"{/if}>Height</option>
	        <option value="both"{if $iphone_resize_base eq "both"} selected="selected"{/if}>Both</option>
	        <option value="crop"{if $iphone_resize_base eq "crop"} selected="selected"{/if}>Crop</option>
	        </select>
	        <small style="color:#bbb; font-weight:0.8em;">Default: <i>Both</i></small><br>  	
	        <!-- Resize Width -->
	        <label for="iphone_resize_x" style="width: 35%;">Resize Width (px): </label>
	        <input type="text" name="iphone_resize_x" value="{$iphone_resize_x}">
	        <small style="color:#bbb; font-weight:0.8em;">Default: <i>480</i></small><br>
	        
	         <!-- Resize Height -->
	        <label for="iphone_resize_y" style="width: 35%;">Resize Height (px): </label>
	        <input type="text" name="iphone_resize_y" value="{$iphone_resize_y}">
	        <small style="color:#bbb; font-weight:0.8em;">Default: <i>320</i></small><br>  

	        <!-- Audio Bit-Rate -->          	
	        <label for="iphone_sbitrate" style="width: 35%;">Audio Bitrate (in Kbps): </label>
	        <input type="text" name="iphone_sbitrate" value="{$iphone_sbitrate}">
	        <small style="color:#bbb; font-weight:0.8em;">Default: <i>128</i></small><br>            
	        <!-- Audio Sampling -->
	        <label for="iphone_srate" style="width: 35%;">Audio Sampling rate (in KHz): </label>
	        <input type="text" name="iphone_srate" value="{$iphone_srate}">
	        <small style="color:#bbb; font-weight:0.8em;">Default: <i>44100</i></small><br>       
	        

                        
        


     
     
     
        </fieldset>
        <div style="text-align: center;">
            <input type="submit" name="submit_mobile" value="Update Media Settings" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>
