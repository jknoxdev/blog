#android/rooting


Links: 
https://developer.android.com/studio/install.html
[Java SE Development Kit 9 - Downloads](http://www.oracle.com/technetwork/java/javase/downloads/jdk9-downloads-3848520.html)

And from this guys blog:
http://www.fixedbyvonnie.com/2014/06/install-android-apps-sd-card-default/#.WlMa5COZNQI




Option 1 - Using Homebrew
[[android - Installing ADB on MAC OS X - Stack Overflow](https://stackoverflow.com/questions/31374085/installing-adb-on-mac-os-x)]
This is the easiest way and will provide automatic updates.

Install homebrew
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
Install adb
`brew cask install android-platform-tools`
Start using adb
`adb devices`

Then, set the damn sd card as adoptable:
`adb shell sm set-force-adoptable true`