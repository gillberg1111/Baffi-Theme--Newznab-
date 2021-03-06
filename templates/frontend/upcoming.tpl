<h2>{$page->title}</h2>

<center>
<div class="btn-group">
<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/upcoming/1">Box Office</a> | 
<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/upcoming/2">In Theatre</a> | 
<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/upcoming/3">Opening</a> | 
<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/upcoming/4">Upcoming</a> | 
<a class="btn btn-small" href="{$smarty.const.WWW_TOP}/upcoming/5">DVD Releases</a>
</div>
</center>
<br />
{$site->adbrowse}	

{if $data|@count > 0}

<table class="data highlight icons table table-striped" id="coverstable">
		<tr>
			<th style="width:140px;"></th>
			<th>Name</th>
		</tr>

		{foreach $data as $result}
		<tr class="{cycle values=",alt"}">
			<td class="mid">
				<div class="movcover">
					<center>
					<img class="shadow img img-polaroid" src="{$result->posters->profile}" width="120" border="0" alt="{$result->title|escape:"htmlall"}" />
					</center>
					<div class="movextra">
						<center>
						<a class="rndbtn badge badge-success" target="_blank" href="{$site->dereferrer_link}{$result->links->alternate}" title="View Rotten Tomatoes Details">Rotten</a>
						<a class="rndbtn badge badge-imdb" target="_blank" href="{$site->dereferrer_link}http://www.imdb.com/title/tt{$result->alternate_ids->imdb}" title="View Imdb Details">Imdb</a>				
						</center>
					</div>
				</div>
			</td>
			<td colspan="3" class="left">
				<h2><a href="{$smarty.const.WWW_TOP}/movies?imdb={$result->alternate_ids->imdb}">{$result->title|escape:"htmlall"}</a> (<a class="title" title="{$result->year}" href="{$smarty.const.WWW_TOP}/movies?year={$result->year}">{$result->year}</a>) {if $result->ratings->critics_score > 0}{$result->ratings->critics_score}/100{/if}</h2>
				{if $result->synopsis == ""}No synopsis. Check <a target="_blank" href="{$site->dereferrer_link}{$result->links->alternate}" title="View Rotten Tomatoes Details">Rotten Tomatoes</a> for more information.{else}{$result->synopsis}{/if}
				{if $result->abridged_cast|@count > 0}
					<br /><br />
					<b>Starring:</b> 
					{foreach from=$result->abridged_cast item=cast name=cast}
						<a href="{$smarty.const.WWW_TOP}/movies?actors={$cast->name|escape:"htmlall"}" title="Search for movies starring {$cast->name|escape:"htmlall"}">{$cast->name|escape:"htmlall"}</a>
						{if $smarty.foreach.cast.last}<br/><br/>{else},{/if}						
					{/foreach}
				{else}
					<br/><br/>
				{/if}

				{if $ourmovies[$result->alternate_ids->imdb] != ""}
					<a class="rndbtn btn btn-mini btn-success" href="{$smarty.const.WWW_TOP}/movies?imdb={$result->alternate_ids->imdb}">Download</a>
				{else}
					<a {if $userimdbs[$result->alternate_ids->imdb] != ""}style="display:none;"{/if} onclick="mymovie_add('{$result->alternate_ids->imdb}', this);return false;" class="rndbtn btn btn-mini btn-info" href="#">Add To My Movies</a>
				{/if}
				<a style="display:{if $userimdbs[$result->alternate_ids->imdb] != ""}inline{else}none;{/if}" onclick="mymovie_del('{$result->alternate_ids->imdb}', this);return false;" href="#" class="rndbtn btn btn-mini btn-danger">Remove From My Movies</a>
				<br/>


			</td>
		</tr>
		{/foreach}
</table>

{else}
<div class="alert">
	<strong>Ups!</strong>
	No results.
</div>
{/if}
