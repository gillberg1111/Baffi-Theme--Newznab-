<div class="page-header">
	<h1>Browse Console</h1>
</div>

<form name="browseby" action="console">
<table class="rndbtn table" border="0">
	<tr>
		<th class="left"><label for="title">Title</label></th>
		<th class="left"><label for="platform">Platform</label></th>
		<th class="left"><label for="genre">Genre</label></th>
		<th class="left"><label for="category">Category</label></th>
		<th></th>
	</tr>
	<tr>
		<td><input input input-xlarge id="title" type="text" name="title" value="{$title}"/></td>
		<td><input input input-xlarge id="platform" type="text" name="platform" value="{$platform}" /></td>
		<td>
			<select id="genre" name="genre">
			<option class="grouping input input-medium" value=""></option>
			{foreach from=$genres item=gen}
				<option {if $gen.ID == $genre}selected="selected"{/if} value="{$gen.ID}">{$gen.title}</option>
			{/foreach}
			</select>
		</td>
		<td>
			<select id="category" name="t">
			<option class="grouping input input-medium" value="1000"></option>
			{foreach from=$catlist item=ct}
				<option {if $ct.ID==$category}selected="selected"{/if} value="{$ct.ID}">{$ct.title}</option>
			{/foreach}
			</select>
		</td>
		<td><input class="btn btn-success" type="submit" value="Go" /></td>
	</tr>
</table>
</form>
<p></p>

{$site->adbrowse}	

View: <b>Covers</b> | <a href="{$smarty.const.WWW_TOP}/browse?t={$category}">List</a><br />
<br/>

{if $results|@count > 0}

<form id="nzb_multi_operations_form" action="get">

<div class="well">
	<div class="nzb_multi_operations">
		With Selected:
		<div class="btn-group">
			<input type="button" class="nzb_multi_operations_download btn btn-small btn-success" value="Download NZBs" />
			<input type="button" class="nzb_multi_operations_cart btn btn-small btn-info" value="Add to Cart" />
			{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab btn btn-small btn-primary" value="Send to SAB" />{/if}
		</div>
	</div>
</div>

{$pager}

<table style="width:100%;" class="data highlight icons" id="coverstable">
	<tr>
		<th width="130">
			<input type="checkbox" class="nzb_check_all" />
		</th>
		<th width="140" >title<br/>
			<a title="Sort Descending" href="{$orderbytitle_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbytitle_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
			
		<th>platform<br/>
			<a title="Sort Descending" href="{$orderbyplatform_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyplatform_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		
		<th>genre<br/>
			<a title="Sort Descending" href="{$orderbygenre_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbygenre_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		
		<th>release date<br/>
			<a title="Sort Descending" href="{$orderbyreleasedate_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyreleasedate_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
		
		<th>posted<br/>
			<a title="Sort Descending" href="{$orderbyposted_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyposted_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
			
		<th>size<br/>
			<a title="Sort Descending" href="{$orderbysize_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbysize_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
			
		<th>files<br/>
			<a title="Sort Descending" href="{$orderbyfiles_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbyfiles_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
			
		<th>stats<br/>
			<a title="Sort Descending" href="{$orderbystats_desc}">
				<i class="fa-icon-caret-down"></i>
			</a>
			<a title="Sort Ascending" href="{$orderbystats_asc}">
				<i class="fa-icon-caret-up"></i>
			</a>
		</th>
			
	</tr>

	{foreach from=$results item=result}
		<tr class="{cycle values=",alt"}">
			<td class="mid">
				<div class="movcover">
					<center>
						<a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">
							<img class="shadow img img-polaroid" src="{$smarty.const.WWW_TOP}/covers/console/{if $result.cover == 1}{$result.consoleinfoID}.jpg{else}no-cover.jpg{/if}" 
							width="120" border="0" alt="{$result.title|escape:"htmlall"}" />
						</a>
					</center>
					<div class="movextra">
						<center>
						{if $result.nfoID > 0}<a href="{$smarty.const.WWW_TOP}/nfo/{$result.guid}" title="View Nfo" class="rndbtn modal_nfo badge" rel="nfo">Nfo</a>{/if}
						{if $result.url != ""}<a class="rndbtn badge badge-amaz" target="_blank" href="{$site->dereferrer_link}{$result.url}" name="amazon{$result.consoleinfoID}" title="View amazon page">Amazon</a>{/if}
						<a class="rndbtn badge" href="{$smarty.const.WWW_TOP}/browse?g={$result.group_name}" title="Browse releases in {$result.group_name|replace:"alt.binaries":"a.b"}">Grp</a>
						</center>
					</div>
				</div>
			</td>
			<td colspan="8" class="left" id="guid{$result.guid}">
				<h2><a class="title" title="View details" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/{$result.searchname|escape:"seourl"}">{$result.title|escape:"htmlall"} - {$result.platform|escape:"htmlall"}</a></h2>
				{if $result.genre != ""}<b>Genre:</b> {$result.genre}<br />{/if}
				{if $result.esrb != ""}<b>Rating:</b> {$result.esrb}<br />{/if}
				{if $result.publisher != ""}<b>Publisher:</b> {$result.publisher}<br />{/if}
				{if $result.releasedate != ""}<b>Released:</b> {$result.releasedate|date_format}<br />{/if}
				{if $result.review != ""}<b>Review:</b> {$result.review|escape:'htmlall'}<br />{/if}
				<br />
				<div class="movextra">
					<b>{$result.searchname|escape:"htmlall"}</b> <a class="rndbtn btn btn-mini" href="{$smarty.const.WWW_TOP}/console?platform={$result.platform}" title="View similar nzbs">Similar</a>
					{if $isadmin}
						<a class="rndbtn btn btn-mini btn-warning" href="{$smarty.const.WWW_TOP}/admin/release-edit.php?id={$result.releaseID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Edit Release">Edit</a> <a class="rndbtn confirm_action btn btn-mini btn-danger" href="{$smarty.const.WWW_TOP}/admin/release-delete.php?id={$result.releaseID}&amp;from={$smarty.server.REQUEST_URI|escape:"url"}" title="Delete Release">Delete</a>
					{/if}
					<br />
					<b>Info:</b> {$result.postdate|timeago},  {$result.size|fsize_format:"MB"},  <a title="View file list" href="{$smarty.const.WWW_TOP}/filelist/{$result.guid}">{$result.totalpart} files</a>,  <a title="View comments for {$result.searchname|escape:"htmlall"}" href="{$smarty.const.WWW_TOP}/details/{$result.guid}/#comments">{$result.comments} cmt{if $result.comments != 1}s{/if}</a>, {$result.grabs} grab{if $result.grabs != 1}s{/if}
					<br />
					<div class="icon">
						<input type="checkbox" class="nzb_check" value="{$result.guid}" />
					</div>
					<div class="icon icon_nzb">
						<a title="Download Nzb" href="{$smarty.const.WWW_TOP}/getnzb/{$result.guid}/{$result.searchname|escape:"url"}">
							<img src="{$smarty.const.WWW_TOP}/views/images/icons/nzbup.png"/>
						</a>
					</div>
					<div class="icon icon_cart" title="Add to Cart">
						<img src="{$smarty.const.WWW_TOP}/views/images/icons/cartup.png"/>
					</div>
					{if $sabintegrated}
					<div class="icon icon_sab" title="Send to my Sabnzbd">	
						<img src="{$smarty.const.WWW_TOP}/views/images/icons/sabup.png"/>
					</div>
					{/if}
				</div>
			</td>
		</tr>
	{/foreach}
	
</table>

<br/>

{$pager}

{if $results|@count > 10}
<div class="well">
	<div class="nzb_multi_operations">
		With Selected:
		<div class="btn-group">
			<input type="button" class="nzb_multi_operations_download btn btn-small btn-success" value="Download NZBs" />
			<input type="button" class="nzb_multi_operations_cart btn btn-small btn-info" value="Add to Cart" />
			{if $sabintegrated}<input type="button" class="nzb_multi_operations_sab btn btn-small btn-primary" value="Send to SAB" />{/if}
		</div>
		{if $isadmin}
		<div class="btn-group pull-right">	
			Admin: 		
			<input type="button" class="nzb_multi_operations_edit btn btn-small btn-warning" value="Edit" />
			<input type="button" class="nzb_multi_operations_delete btn btn-small btn-danger" value="Delete" />
		</div>
		{/if}	
	</div>
</div>
{/if}

</form>

{else}
<div class="alert">
	<button type="button" class="close" data-dismiss="alert">&times;</button>
	<strong>Ups!</strong> Either some amazon key is wrong, or there is nothing in this section.
</div>
{/if}

