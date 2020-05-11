tell application "Docker" to activate
tell application "Secure Pipes" to activate

tell application "iTerm"
	activate

	set promptDelay to 1

	set uiCmd to "cd ~/code/ml/ui-looking-glass; nvm use; npm run start"
	set apiCmd to "cd ~/code/ml/api-looking-glass; nvm use; sleep 3 && yarn start:watch"
	set dockerCmd to "cd ~/code/ml/api-looking-glass; nvm use; sleep 3 && docker-compose up"
	set loginCmd to "cd ~/code/ml/service-login; nvm use; PORT=3002 npm start"
	set annotationsCmd to "cd ~/code/ml/service-annotations; nvm use; PORT=3012 yarn start:watch"
	-- set pdfCmd to "cd ~/code/ml/service-pdf; nvm use; PORT=3007 yarn start"
	set emailCmd to "cd ~/code/ml/service-email; nvm use; PORT=3005 npm start"
	set mlDataCmd to "cd ~/code/ml/service-ml-data; nvm use; PORT=3009 npm run start:watch"

	set myterm to (create window with default profile)

	set uiSession to (current session of myterm)

	tell uiSession
		set columns to 85 * 2
		set rows to 50

		set apiSession to (split vertically with same profile)
		set loginSession to (split horizontally with same profile)

		tell apiSession
			set dockerSession to (split horizontally with same profile)
			set annotationsSession to (split horizontally with same profile)
		end tell

		tell loginSession
			set emailSession to (split horizontally with same profile)
			set mlDataSession to (split horizontally with same profile)
		end tell
	end tell

	tell uiSession
		set name to "ui-looking-glass"
		write text ""
		delay promptDelay

		write text uiCmd
	end tell

	tell apiSession
		set name to "api-looking-glass"
		write text ""
		delay promptDelay
		write text apiCmd
	end tell

	tell loginSession
		set name to "service-login"
		write text ""
		delay promptDelay
		write text loginCmd
	end tell

	tell annotationsSession
		set name to "annotations-pdf"
		write text ""
		delay promptDelay
		write text annotationsCmd
	end tell

	tell emailSession
		set name to "service-email"
		write text ""
		delay promptDelay
		write text emailCmd
	end tell

	tell mlDataSession
		set name to "service-ml-data"
		write text ""
		delay promptDelay

		write text mlDataCmd
	end tell

    tell dockerSession
		set name to "docker-compose"
		write text ""
		delay promptDelay

		write text dockerCmd
	end tell
end tell
