--------------------------------------------------------------------------
--          RAM Drive: creating disk in RAM
--          Autor: Dmitry Chushkin
--          Version: 2.1.0
--          Released under GNU Public License (GPL)
--          regdvc@gmail.com 				
--------------------------------------------------------------------------

use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions
use script "Myriad Tables Lib" version "1.0.13"


-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- 					  		 	Main
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Language auto selection
if (user locale of (system info)) = "ru_RU" then
	
	-- По-русски
	set msg_size to "Объем диска, МБ"
	set msg_volume to "Имя тома:"
	set msg_header to "Выберите объем и имя тома:"
	
else
	
	-- In English
	set msg_size to "Disk size, MB"
	set msg_volume to "Volume name:"
	set msg_header to "Select size and volume name:"
	
end if

set Table to make new table with data {{"4096", "RAM Disk"}, {"8192", "RAM Disk"}, {"16384", "RAM Disk"}} ¬
	initially selected rows {1} editable columns {1, 2} column headings {msg_size, msg_volume} row template {text, text} ¬
	with title "RAM Drive" with prompt msg_header
modify columns in table Table entry alignment align center columns list {1} with bold type and monospaced digits
set theResult to display table Table --with extended results

set drive_Selected to values selected of theResult

repeat with i in drive_Selected
	set the_Size to item 1 of i
	set the_Volume to item 2 of i
end repeat

-- Check if the_Volume is already mounted. If true, then rename the_Volume to the_Volume_n
tell application "System Events" to set diskNames to name of every disk
set the_Volume_ to "RAM Disk_"
repeat with i from 1 to (count diskNames)
	if i = 1 then
		if the_Volume is in diskNames then
			set the_Volume to the_Volume & "_" & i
		else
			exit repeat
		end if
	else
		if the_Volume is in diskNames then
			set the_Volume to the_Volume_ & i
		else
			exit repeat
		end if
	end if
end repeat

-- Converting megabytes to blocks
set the_Size to the_Size * 2048

-- Mount drive
set hdiutil to "`hdiutil attach -nomount ram://" & the_Size & "`"
do shell script "diskutil erasevolume HFS+ " & quoted form of the_Volume & " " & hdiutil
