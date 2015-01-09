
     <div id="rightcontent">
      {include file="siteadmin/nuevo_errmsg.tpl"}
        
         <div id="right">
        <div align="center">
        <h2>Midroll Ads Settings</h2>

	<div id="simpleForm">
        <form name="midroll_settings" method="POST" action="nuevo.php?m=midrollsettings">
         
	 <fieldset style="font-size:11px;">
         <legend>Midroll ads settings</legend>
            
	    <label for="background">Background color: </label>
	    <input type="text" name="background" size="10" maxlength="6" value="{$data.background}" /><br /> 
	    <label for="opacity">Background opacity</label>
	    <input type="text" name="opacity" size="10" maxlength="4" value="{$data.opacity}" /><br /> 
	    <label for="outline">Show outline: </label>
	    <select name="outline"><option value="1"{if $data.outline eq '1'} selected="selected"{/if}>Yes</option><option value="0"{if $data.outline eq '0'} selected="selected"{/if}>Yes</option></select><br />
	    

            <label for="titlecolor">Title color: </label>
            &nbsp;&nbsp;<input type="text" name="titlecolor" size="10" maxlength="6" value="{$data.titlecolor}" /> (enter hex value)<br/>
            <label for="desccolor">Description color: </label>
            &nbsp;&nbsp;<input type="text" name="desccolor" size="10" maxlength="6" value="{$data.desccolor}" /> (enter hex value)<br/>
            <label for="linkcolor">Link color: </label>
            &nbsp;&nbsp;<input type="text" name="linkcolor" size="10" maxlength="6" value="{$data.linkcolor}" /> (enter hex value)<br/>
            <label for="aboutcolor">About color: </label>
            &nbsp;&nbsp;<input type="text" name="aboutcolor" size="10" maxlength="6" value="{$data.aboutcolor}" /> (enter hex value)<br/>
            <label for="hovercolor">Hover color: </label>
            &nbsp;&nbsp;<input type="text" name="hovercolor" size="10" maxlength="6" value="{$data.hovercolor}" /> (enter hex value)<br/>
            <label for="abouttext">About text: </label>
            &nbsp;&nbsp;<input type="text" name="abouttext" maxlength="30" value="{$data.abouttext}" /><br/>
            <label for="abouturl">About URL: </label>
            &nbsp;&nbsp;<input type="text" class="large" name="abouturl" maxlength="30" value="{$data.abouturl}" /><br/>
	    <label for="canclose">Allow to close ad: </label>
	    <select name="canclose"><option value="1"{if $data.canclose eq '1'} selected="selected"{/if}>Yes</option><option value="0"{if $data.canclose eq '0'} selected="selected"{/if}>Yes</option></select><br />
	    
	    <label for="defstart">Default start time (seconds)</label>
	    <input type="text" name="defstart" size="10" maxlength="4" value="{$data.defstart}" /><br /> 
	    <label for="defruntime">Default ad runtime (seconds)</label>
	    <input type="text" name="defruntime" size="10" maxlength="4" value="{$data.defruntime}" /><br /> 
	</fieldset>	    


	<div style="text-align: center;">
            <input type="submit" name="update" value="Update Midroll Settings" class="button">
        </div>
        </form>
        </div>
	</div>

        


        </div>
        </div>
     </div>
