(*
Export All Safari Tabs in All Open Windows to a Markdown File
April 21, 2022

// SCRIPT HISTORY
	Current version: https://github.com/neomanic/save_macos_browser_tabs
	A few changes: https://gist.github.com/unabridgedxcrpt/3f35aa5aec81289368858e2ba6009451
	Copy from dead website: https://gist.github.com/kshiteesh/b72e93d31d65008fcd11
	As markdown: https://web.archive.org/web/20161017151621/http://hegde.me/urlsafari/
	Original version, text export: http://veritrope.com/code/export-all-safari-tabs-to-a-text-file

// CHANGES COMPARED TO THE ORIGINAL SCRIPT
	1. (previously) Save URLs to .md instead of .txt
	2. (previously) Save URLs from all windows instead of just the first window
	3. ~~Save the file to Downloads/ instead of Desktop/~~ I prefer Desktop, changed it back. Should be user option?
	4. Added web hostname to end of tab title so it's easy to see when rendered to HTML.
	5. Added current date+time to filename and header in file.
	6. Save as UTF-8: https://gist.github.com/kshiteesh/b72e93d31d65008fcd11?permalink_comment_id=3471362#gistcomment-3471362
	7. Currently has a bunch of commented-out experiments. Will clean up later.
	
// DISCLAIMER
	I have made some minor changes to the orginal script which can be found at veritrope.com (full link given above). I'm not affiliated with veritrope.com.

// TERMS OF USE:
	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. 

	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*)
----------------------------------------------------------------------------------------
-- NAME OF REPORT TITLE
property report_Title : "URL List from Safari"

-- PREPARE THE LIST
set url_list to {}
set the date_stamp to ((the current date) as string)
set NoteTitle to "# Safari Tabs " & the date_stamp

-- GET TABS FROM SAFARI
set window_count to 1
tell application "Safari"
	activate
	set safariWindow to windows
	repeat with w in safariWindow
		try
			if (tabs of w) is not {} then
				copy ("## Window " & window_count & return) to the end of url_list
			end if
			--set tab_count to 1
			repeat with t in (tabs of w)
				--set TabHost to (DNS form of (host of (URL of t))) as string
				--set TabHost to (URL of t)
				--log class of TabHost
				--set TabTitle to ("[" & name of t & "(" & TabHost & ")]")
				set TabURL to ("(" & URL of t & ")")
				set CommandString to "echo " & quoted form of TabURL & " | sed -e 's|^[^/]*//||' -e 's|/.*$||'"
				set TabHost to do shell script CommandString
				set TabTitle to ("[" & name of t & " (" & TabHost & ")]")
				set TabInfo to ((index of t as string) & ". " & TabTitle & TabURL) -- tab_count
				copy TabInfo to the end of url_list
				--set tab_count to tab_count + 1
			end repeat
			copy "" to the end of url_list
		end try
		set window_count to window_count + 1
	end repeat
end tell

-- CONVERT URL_LIST TO TEXT
set old_delim to AppleScript's text item delimiters
set AppleScript's text item delimiters to return
set url_list to (NoteTitle & return & return & return & url_list) as text
set AppleScript's text item delimiters to old_delim

--set todayDate to current date
--set todayISO to (todayDate as «class isot» as string)
--set CommandString to "echo " & quoted form of TabURL & " | sed -e 's|^[^/]*//||' -e 's|/.*$||'"
set todayDate to do shell script "date +%Y-%m-%dT%H-%M"
set save_Filename to "Safari Tabs " & todayDate & ".md"
-- from https://forum.latenightsw.com/t/formatting-dates/841
--((the current date) as string) & ".md"

-- CHOOSE FILE NAME FOR EXPORT 
tell application "Finder"
	--activate
	--set save_File to choose file name with prompt "Name this file:" default name report_Title default location (path to downloads folder)
	set save_File to (make new file at (path to desktop) with properties {name:save_Filename}) as alias
end tell

--WRITE THE FILE
tell application "System Events"
	--set save_File to ((path to desktop) as string) & "Safari Tabs " & ((the current date) as string)
	--set save_Filename to "Safari Tabs " & ((the current date) as string) & ".md"
	--make new file at (path to desktop) with properties {name:save_Filename}
	--set save_Filename to ((path to desktop) as text) & save_Filename
	--set save_File to open for access (save_File & ".md" as string) with write permission
	set save_File to open for access save_File with write permission
	try
		write url_list to save_File as «class utf8»
	end try
	close access save_File
end tell
