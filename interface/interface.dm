//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/client/verb/wiki(query as text)
	set name = "wiki"
	set desc = "Type what you want to know about.  This will open the wiki in your web browser. Type nothing to go to the main page."
	set hidden = TRUE
	var/wikiurl = CONFIG_GET(string/wikiurl)
	if(wikiurl)
		if(query)
			var/output = wikiurl + "/index.php?search=" + query
			src << link(output)
		else if (query != null)
			src << link(wikiurl)
	else
		to_chat(src, span_danger("The wiki URL is not set in the server configuration."))
	return

/client/verb/forum()
	set name = "forum"
	set desc = "Visit the forum."
	set hidden = TRUE
	var/forumurl = CONFIG_GET(string/forumurl)
	if(forumurl)
		if(tgui_alert(src, "This will open the forum in your browser. Are you sure?",, list("Yes","No"))!="Yes")
			return
		src << link(forumurl)
	else
		to_chat(src, span_danger("The forum URL is not set in the server configuration."))
	return

/client/verb/rules()
	set name = "rules"
	set desc = "Show Server Rules."
	set hidden = TRUE
	var/rulesurl = CONFIG_GET(string/rulesurl)
	if(rulesurl)
		if(tgui_alert(src, "This will open the rules in your browser. Are you sure?",, list("Yes","No"))!="Yes")
			return
		src << link(rulesurl)
	else
		to_chat(src, span_danger("The rules URL is not set in the server configuration."))
	return

/client/verb/github()
	set name = "github"
	set desc = "Visit Github"
	set hidden = TRUE
	var/githuburl = CONFIG_GET(string/githuburl)
	if(githuburl)
		if(tgui_alert(src, "This will open the Github repository in your browser. Are you sure?",, list("Yes","No"))!="Yes")
			return
		src << link(githuburl)
	else
		to_chat(src, span_danger("The Github URL is not set in the server configuration."))
	return

/client/verb/reportissue()
	set name = "report-issue"
	set desc = "Report an issue"
	set hidden = TRUE
	var/githuburl = CONFIG_GET(string/githuburl)
	if(githuburl)
		var/message = "This will open the Github issue reporter in your browser. Are you sure?"
		if(GLOB.revdata.testmerge.len)
			message += "<br>The following experimental changes are active and are probably the cause of any new or sudden issues you may experience. If possible, please try to find a specific thread for your issue instead of posting to the general issue tracker:<br>"
			message += GLOB.revdata.GetTestMergeInfo(FALSE)
		if(tgalert(src, message, "Report Issue","Yes","No")!="Yes")
			return
		var/static/issue_template = file2text(".github/ISSUE_TEMPLATE.md")
		var/servername = CONFIG_GET(string/servername)
		var/url_params = "Reporting client version: [byond_version].[byond_build]\n\n[issue_template]"
		if(GLOB.round_id || servername)
			url_params = "Issue reported from [GLOB.round_id ? " Round ID: [GLOB.round_id][servername ? " ([servername])" : ""]" : servername]\n\n[url_params]"
		DIRECT_OUTPUT(src, link("[githuburl]/issues/new?body=[url_encode(url_params)]"))
	else
		to_chat(src, span_danger("The Github URL is not set in the server configuration."))
	return

/client/verb/changelog()
	set name = "Changelog"
	set category = "OOC"
	var/datum/asset/simple/namespaced/changelog = get_asset_datum(/datum/asset/simple/namespaced/changelog)
	changelog.send(src)
	src << browse(changelog.get_htmlloader("changelog.html"), "window=changes;size=675x650")
	if(prefs.lastchangelog != GLOB.changelog_hash)
		prefs.lastchangelog = GLOB.changelog_hash
		prefs.save_preferences()
		winset(src, "infowindow.changelog", "font-style=;")
