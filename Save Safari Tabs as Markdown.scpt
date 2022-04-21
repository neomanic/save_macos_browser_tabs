(*
Export All Safari Tabs in All Open Windows to a Markdown File
2018-01-25

// SCRIPT PAGE
	https://gist.github.com/unabridgedxcrpt/3f35aa5aec81289368858e2ba6009451

// ORIGINAL SCRIPT PAGE
	http://hegde.me/urlsafari KSHITEESH ON GIST.GITHUB.COM
   
// ORIGINAL-ORIGINAL SCRIPT ON WHICH THIS SCRIPT IS BUILT
	http://veritrope.com/code/export-all-safari-tabs-to-a-text-file

// CHANGES COMPARED TO THE ORIGINAL SCRIPT
	1. Save URLs to .md instead of .txt
	2. Save URLs from all windows instead of just the first window
	3. Save the file to Downloads/ instead of Desktop/

// CHANGES TO SCRIPT FORKED FROM KSHITEESH https://gist.github.com/kshiteesh/b72e93d31d65008fcd11#file-urlsafari
	1. Removed dialog asking for filename/location just save to downloads folder.
	2. Filename created uses time stamp YYYYMMDD-HHMMSS so we don't have filename clash in downloads folder.
	
// DISCLAIMER
	I have made some minor changes to the orginal script which can be found at veritrope.com (full link given above). I'm not affiliated with veritrope.com.

// TERMS OF USE:
	This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License. 

	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/3.0/ or send a letter to Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.
*)
----------------------------------------------------------------------------------------
-- NAME OF REPORT TITLE
property report_Title : "URLs from Safari "

-- PREPARE THE LIST
set url_list to {}
set the date_stamp to ((the current date) as string)
set NoteTitle to "# " & the date_stamp

-- GET DATE FOR FILENAME - COULD HAVE USED DATESTAMP FROM APPLESCRIPT, BUT THIS WAS SHORTER
set now to do shell script "date '+%Y%m%d-%H%M%S'"

-- GET TABS FROM SAFARI
set window_count to 1
tell application "Safari"
	activate
	set safariWindow to windows
	repeat with w in safariWindow
		try
			if (tabs of w) is not {} then
				copy ("## Window " & window_count & ":" & return) to the end of url_list
			end if
			repeat with t in (tabs of w)
				set TabTitle to ("[" & name of t & "]")
				set TabURL to ("(" & URL of t & ")")
				set TabInfo to (TabTitle & TabURL & return)
				copy TabInfo to the end of url_list
			end repeat
		end try
		set window_count to window_count + 1
	end repeat
end tell

-- CONVERT URL_LIST TO TEXT
set old_delim to AppleScript's text item delimiters
set AppleScript's text item delimiters to return
set url_list to (NoteTitle & return & return & return & url_list) as text
set AppleScript's text item delimiters to old_delim

-- SET FILE PATH AND NAME FOR EXPORT 
set save_File to (path to downloads folder as string) & (report_Title as string) & (now as string)

--WRITE THE FILE
tell application "System Events"
	set save_File to open for access (save_File & ".md" as string) with write permission
	try
		write url_list to save_File
	end try
	close access save_File
end tell