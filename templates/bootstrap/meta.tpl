{************************************
***** Meta Properties Template ******
*************************************}
<!-- meta.tpl -->
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />	
{if $meta_description neq ""}
	<meta name="description" content="{$meta_description|truncate:"300"}" />
{elseif $pagename eq "search"}
	<meta name="description" content="{#KLIQQI_Visual_Search_SearchResults#} {$templatelite.get.search|sanitize:2|stripslashes}" />
{else}
	<meta name="description" content="{#KLIQQI_Visual_What_Is_Kliqqi_Text#|htmlentities}" />
{/if}
{if $meta_keywords neq ""}
	<meta name="keywords" content="{$meta_keywords}" />
{elseif $pagename eq "search"}
	<meta name="keywords" content="{$templatelite.get.search|sanitize:2|stripslashes}" />
{else}
	<meta name="keywords" content="{#KLIQQI_Visual_Meta_Keywords#}" />
{/if}
<meta name="Language" content="{#KLIQQI_Visual_Meta_Language#}" />
<meta name="Robots" content="All" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="generator" content="Kliqqi" />

<!-- Open Graph Protocol -->
<meta property="og:title" content="{$posttitle}" />
<meta property="og:description" content="{$meta_description|truncate:"300"}" />
{if $pagename eq "story"}
<meta property="og:image" content="{php} echo $_SESSION['uploaded_image']{/php}" />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />
<meta name="twitter:image" content="{php} echo $_SESSION['uploaded_image']{/php}" />
{/if}
<meta name="twitter:title" content="{$posttitle}" />
<meta name="twitter:description" content="{$meta_description|truncate:"300"}" />
<!--/meta.tpl -->