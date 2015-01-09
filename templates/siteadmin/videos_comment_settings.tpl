     <div id="rightcontent">
        {include file="myadmin/errmsg.tpl"}
        <div id="right">
        <div align="center">
        <h2>Comments Settings</h2>
        <div id="simpleForm">
        <form name="comments_settings" method="POST" action="videos.php?m=comment_settings">
        <fieldset>
        <legend>Comments Settings</legend>
            <label for="photo">Show sender photo: </label>
            <select name="photo">
            <option value="1"{if $comment.photo == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $comment.photo == '0'} selected="selected"{/if}>No</option>
            </select><br>

            <label for="allow_url">Allow clickable URLs: </label>
            <select name="allow_url">
            <option value="1"{if $comment.allow_url == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $comment.allow_url == '0'} selected="selected"{/if}>No</option>
            </select><br>

            <label for="allow_url">Allow edit comment by owner: </label>
            <select name="allow_edit">
            <option value="1"{if $comment.allow_edit == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $comment.allow_edit == '0'} selected="selected"{/if}>No</option>
            </select><br>

            <label for="allow_smileys">Use smileys: </label>
            <select name="allow_smileys">
            <option value="1"{if $comment.allow_smileys == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $comment.allow_smileys == '0'} selected="selected"{/if}>No</option>
            </select><br>

            <label for="max_smileys">Maximum smileys per comment: </label>
            <input type="text" name="max_smileys" value="{$comment.max_smileys}" /><br />

            <label for="min_length">Comment minimum length: </label>
            <input type="text" name="min_length" value="{$comment.min_length}" /><br />

            <label for="max_length">Comment maximum length: </label>
            <input type="text" name="max_length" value="{$comment.max_length}" /><br />

            <label for="per_page">Comments per page: </label>
            <input type="text" name="per_page" value="{$comment.per_page}" /><br />

            <label for="moderato">Moderator username: </label>
            <input type="text" name="moderator" value="{$comment.moderator}" /><br />

            <label for="ban_replace">Censored words replacement: </label>
            <input type="text" name="ban_replace" value="{$comment.ban_replace}" /><br />

            <label for="banlist">Censored words (1 per line): </label>
            <textarea rows="10" name="banlist">{$comment.banlist}</textarea><br />

            <label for="notify">Notify video owner: </label>
            <select name="notify">
            <option value="1"{if $comment.notify == '1'} selected="selected"{/if}>Yes</option>
            <option value="0"{if $comment.notify == '0'} selected="selected"{/if}>No</option>
            </select><br>

            <label for="email_subject">Notification email subject: </label>
            <input type="text" name="email_subject" class="large" value="{$comment.email_subject}" /><br />

            <label for="email">Notification email body: </label>
            <textarea rows="9" name="email_body">{$comment.email_body}</textarea><br /><br />
	    <label for="email"> </label>
	      <div style="font-size:11px;width:100%"">
	      <table border="0"><tr><td>
	      Constants (replaced in email with corresponding values): <br />
	      <strong>[username],  [video],  [sitename]</strong>
              </td></tr></table>
	      </div>
	      <br />

        </fieldset>
        <div style="text-align: center;">
            <input type="submit" name="update_comments" value="Update Comments Settings" class="button">
        </div>
        </form>
        </div>
        </div>
        </div>
     </div>