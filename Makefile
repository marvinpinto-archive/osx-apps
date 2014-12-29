pkgpath = pkgs
osxapps = chrome-new-window chrome-incognito

chrome-new-window_version = 1.0
chrome-incognito_version = 1.0

all: $(osxapps) postclean

$(osxapps): clean
	@echo Generating new $(@).app, version $($(@)_version)
	@mkdir -p $(pkgpath)/$(@).app/Contents/MacOS
	@mkdir -p $(pkgpath)/$(@).app/Contents/Resources
	@cp $(@)/$(@).icns $(pkgpath)/$(@).app/Contents/Resources/$(@).icns
	@cp Info.plist $(pkgpath)/$(@).app/Contents/Info.plist
	@sed -i "" 's/APPNAME/$(@)/g' "$(pkgpath)/$(@).app/Contents/Info.plist"
	@sed -i "" 's/VERSION/$($(@)_version)/g' "$(pkgpath)/$(@).app/Contents/Info.plist"
	@cp $(@)/$(@).sh $(pkgpath)/$(@).app/Contents/MacOS/$(@)
	@find pkgs/$(@).app -type d -exec chmod 755 {} \;
	@find pkgs/$(@).app -type f -exec chmod 644 {} \;
	@chmod +x $(pkgpath)/$(@).app/Contents/MacOS/$(@)
	@echo Replacing ~/Dropbox/osx-apps/$(@).app
	@rm -rf ~/Dropbox/osx-apps/$(@).app
	@mv $(pkgpath)/$(@).app ~/Dropbox/osx-apps/$(@).app

postclean:
	@echo Cleaning out the $(pkgpath) directory
	@rm -rf $(pkgpath)

clean:
	@echo Cleaning out the $(pkgpath) directory
	@rm -rf $(pkgpath)
