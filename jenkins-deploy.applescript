on run argv
	if (count of argv) < 3 then
		display notification "need url, branch and env" sound name "Frog"
	end if
	set urlpath to item 1 of argv
	set branch to item 2 of argv
	set env to item 3 of argv
	return deploy(urlpath, branch, env)
end run

on deploy(urlpath, branch, env)
	tell application "Google Chrome" to activate
	tell application "System Events"
		display notification "deploying"
		key code 17 using command down -- cmd+t for new tab
		keystroke urlpath
		key code 36
		delay 2
		key code 34 -- i for insert mode for vimium
		key code 3 using command down
		delay 0.5
		keystroke "branch"
		delay 0.5
		key code 53
		key code 48
		delay 0.5
		keystroke branch
		delay 0.5
		key code 48
		keystroke env
		delay 0.5
		key code 3 using command down
		keystroke "restart pods"
		delay 0.5
		key code 53
		delay 0.5
		key code 48 using shift down
		delay 0.5
		key code 49
		delay 0.5
		key code 3 using command down
		keystroke "skip_cloud_scheduler"
		key code 53
		key code 48
		key code 36
	end tell
end deploy
