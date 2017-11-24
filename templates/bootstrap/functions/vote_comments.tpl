<script>
var my_base_url='{$my_base_url}';
var my_kliqqi_base='{$my_kliqqi_base}';
var anonymous_vote = {$anonymous_vote};
var Voting_Method = '{$Voting_Method}';
var KLIQQI_Visual_Vote_Cast = "{#KLIQQI_Visual_Vote_Cast#}";
var KLIQQI_Visual_Vote_Report = "{#KLIQQI_Visual_Vote_Report#}";
var KLIQQI_Visual_Vote_For_It = "{#KLIQQI_Visual_Vote_For_It#}";
var KLIQQI_Visual_Comment_ThankYou_Rating = "{#KLIQQI_Visual_Comment_ThankYou_Rating#}";

{literal}
function cvote (user, id, htmlid, md5, value)
{
    var anchor = $('#cxvote-'+htmlid+' > .btn.btn-default:'+(value>0 ? 'first' : 'last'));
    anchor.attr('disabled','disabled');

    var url = my_kliqqi_base + "/cvote.php";
    var mycontent = "id=" + id + "&user=" + user + "&md5=" + md5 + "&value=" + value;

    if (!anonymous_vote && user==0) {
        window.location= my_base_url + my_kliqqi_base + "/login.php?return="+location.href;
    } else {
    	$.post(url, mycontent, function (data) {
		if (data.match (new RegExp ("^ERROR:"))) {
			var tag = $("<div></div>");
			tag.html(data).dialog({modal: true}).dialog('open');
		} else {
			var anchor = $('#cxvote-'+htmlid+' > .'+(value>0 ? 'btn-danger' : 'btn-success'));
			if (anchor.length)
				anchor.removeClass(value>0 ? 'btn-danger' : 'btn-success')
					.attr('href', anchor.attr('href').replace(/cunvote/,'cvote'))
					.children('i').removeClass('fa-white');

			var anchor = $('#cxvote-'+htmlid+' > .btn.btn-default:'+(value>0 ? 'first' : 'last'));
			anchor.addClass(value>0 ? 'btn-success' : 'btn-danger')
				.attr('href', anchor.attr('href').replace(/cvote/,'cunvote'))
				.removeAttr('disabled')
				.children('i').addClass('fa-white');
				
			$('#cvote-'+htmlid).html(data.split('~')[0]);
		}
	}, "text");
    }
}

function cunvote (user, id, htmlid, md5, value)
{
    var anchor = $('#cxvote-'+htmlid+' > .'+(value<0 ? 'btn-danger' : 'btn-success'));
    anchor.attr('disabled','disabled');

    var url = my_kliqqi_base + "/cvote.php";
    var mycontent = "unvote=true&id=" + id + "&user=" + user + "&md5=" + md5 + "&value=" + value;
    if (!anonymous_vote && user==0) {
        window.location= my_base_url + my_kliqqi_base + "/login.php?return="+location.href;
    } else {
    	$.post(url, mycontent, function (data) {
		if (data.match (new RegExp ("^ERROR:"))) {
			var tag = $("<div></div>");
			tag.html(data).dialog({modal: true}).dialog('open');
		} else {
			var anchor = $('#cxvote-'+htmlid+' > .'+(value<0 ? 'btn-danger' : 'btn-success'));
			anchor.removeClass(value>0 ? 'btn-success' : 'btn-danger')
				.attr('href', anchor.attr('href').replace(/cunvote/,'cvote'))
				.removeAttr('disabled')
				.children('i').removeClass('fa-white');

			$('#cvote-'+htmlid).html(data.split('~')[0]);
		}
	}, "text");
    }
}
{/literal}
</script>

