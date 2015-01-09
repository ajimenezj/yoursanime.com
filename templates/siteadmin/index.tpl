     <div id="rightcontent">
        {include file="siteadmin/errmsg.tpl"}
        <div id="right">
        <div align="center">
        <h2>System Settings</h2>
        <div id="simpleForm">
        <form name="system_settings" method="POST" action="index.php?m=main">
        <fieldset>
        <legend>Site Settings</legend>
            <label for="site_name">Site Name: </label>
            <input type="text" name="site_name" value="{$site_name}" class="large"><br>
            <label for="meta_description">Meta Description: </label>
            <input type="text" name="meta_description" value="{$meta_description}" class="large"><br>
            <label for="meta_keywords">Meta Keywords: </label>
            <input type="text" name="meta_keywords" value="{$meta_keywords}" class="large"><br>
        </fieldset>
        <fieldset>
        <legend>Admin Settings</legend>
            <label for="admin_name">Admin Name: </label>
            <input type="text" name="admin_name" value="{$admin_name}" class="large"><br>
            <label for="admin_email">Admin Email: </label>
            <input type="text" name="admin_email" value="{$admin_email}" class="large"><br>
            <label for="admin_pass">Admin Password: </label>
            <input type="password" name="admin_pass" value="{$admin_pass}" class="large"><br>
        </fieldset>
        <fieldset>
        <legend>System Settings</legend>
            <label for="language">Language: </label>
            {insert name=language_select assign=language_select language=$language}
            <select name="language">
            {$language_select}
            </select><br>
            <label for="multilanguage">Multi Language: </label>
            <select name="multilanguage">
            <option value="1"{if $multilanguage == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $multilanguage == '0'} selected="selected"{/if}>No</option>
            </select><br>
            <label for="seo_urls">SEO Urls: </label>
            <select name="seo_urls">
            <option value="1"{if $seo_urls == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $seo_urls == '0'} selected="selected"{/if}>No</option>
            </select><br>
            <label for="gzip_encoding">Gzip Encoding: </label>
            <select name="gzip_encoding">
            <option value="1"{if $gzip_encoding == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $gzip_encoding == '0'} selected="selected"{/if}>No</option>
            </select><br>
            <label for="captcha">Signup Captcha: </label>
            <select name="captcha">
            <option value="1"{if $captcha == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $captcha == '0'} selected="selected"{/if}>No</option>
            </select><br>
            <label for="downloads">Videos Downloads: </label>
            <select name="downloads">
            <option value="1"{if $downloads == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $downloads == '0'} selected="selected"{/if}>No</option>
            </select><br>
            <label for="approve">Video Approve: </label>
            <select name="approve">
            <option value="1"{if $approve == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $approve == '0'} selected="selected"{/if}>No</option>
            </select><br>
            <label for="selLFUBannar">Last Five User Panel: </label>
            <select name="selLFUBannar">
            <option value="Enable"{if $lfubannar == 'Enable'} selected="selected"{/if}>Enable</option>
            <option value="Disable"{if $lfubannar == 'Disable'} selected="selected"{/if}>Disable</option>
            </select><br>
            <label for="pollinganel">Polls Panel: </label>
            <select name="pollinganel">
            <option value="Enable"{if $pollinganel == 'Enable'} selected="selected"{/if}>Enable</option>
            <option value="Disable"{if $pollinganel == 'Disable'} selected="selected"{/if}>Disable</option>
            </select><br>
            <label for="upload_by_file">Upload (File): </label>
            <select name="upload_by_file">
            <option value="1"{if $upload_by_file == '1'} selected="selected"{/if}>Enabled</option>
            <option value="0"{if $upload_by_file == '0'} selected="selected"{/if}>Disabled</option>
            </select><br>
            <label for="upload_by_embed">Upload (Embed): </label>
            <select name="upload_by_embed">
            <option value="1"{if $upload_by_embed == '1'} selected="selected"{/if}>Enabled</option>
            <option value="0"{if $upload_by_embed == '0'} selected="selected"{/if}>Disabled</option>
            </select><br>
        </fieldset>
        <fieldset>
        <legend>Display Settings</legend>
            <label for="items_per_page">List Per Page: </label>
            <input type="text" name="items_per_page" value="{$items_per_page}" class="small"><br>
            <label for="items_per_front_page">List Per FrontPage: </label>
            <input type="text" name="items_per_front_page" value="{$items_per_front_page}" class="small"><br>
            <label for="rel_video_per_page">List Per Related: </label>
            <input type="text" name="rel_video_per_page" value="{$rel_video_per_page}" class="small"><br>
        </fieldset>
        <fieldset>
        <legend>Service Settings</legend>
            <label for="enable_package">Service Type: </label>
            <select name="enable_package">
            <option value="yes"{if $enable_package == 'yes'} selected="selected"{/if}>Enable Package</option>
            <option value="no"{if $enable_package == 'no'} selected="selected"{/if}>Free Service</option>
            </select><br>
            {if $enable_package == 'yes'}
            <label for="payment_method">Payment Method: </label>
            <input type="checkbox" name="method[]" value="Paypal" class="checkbox" checked>Paypal<br>
            <label for="enable_test_payment">Enable Test Payment: </label>
            <input type="radio" name="enable_test_payment" value="yes" class="radio"{if $enable_test_payment == 'yes'} checked{/if}>Yes
            <input type="radio" name="enable_test_payment" value="no" class="radio"{if $enable_test_payment == 'no'} checked{/if}>No<br>
            <label for="paypal_receiver_email">Paypal Receiver Email: </label>
            <input name="paypal_receiver_email" type="text" value="{if $paypal_receiver_email != ''}{$paypal_receiver_email}{else}payment@yoursite.com{/if}" class="large"><br>
            {/if}
        </fieldset>
        <div style="text-align: center;">
            <input type="submit" name="submit_settings" value="Update System Settings" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>