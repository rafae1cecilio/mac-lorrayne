#! /bin/bash

sudo -S purge && 
sudo -S softwareupdate -i -a -R --agree-to-license --verbose && 

sudo defaults write com.apple.Finder AppleShowAllFiles true &&
sudo defaults write com.apple.finder AppleShowAllFiles -bool true &&
sudo chflags nohidden ~/Library &&

sudo defaults write com.apple.dock autohide-delay -int 0; defaults write com.apple.dock autohide-time-modifier -float 1.0; killall Dock &&

# The standard Reboot UI has the checkbox that could be toggled programmatically; On macOS Big Sur 11.6.2 running this command on the terminal will permanent disable reopening apps:
sudo defaults write com.apple.loginwindow TALLogoutSavesState -bool false; sudo defaults write -g ApplePersistence -bool no && 

#First close all applications (this is important). Then in a terminal do:
#sudo chown root ~/Library/Preferences/ByHost/com.apple.loginwindow* &&
#sudo chmod 000 ~/Library/Preferences/ByHost/com.apple.loginwindow* &&

#To undo:
#sudo rm -f ~/Library/Preferences/ByHost/com.apple.loginwindow*

#Set your screen to lock as soon as the screensaver starts:
sudo defaults write com.apple.screensaver askForPassword -int 1 &&
sudo defaults write com.apple.screensaver askForPasswordDelay -int 0 &&

#Disable crash reporter (the dialog which appears after an application crashes and prompts to report the problem to Apple):
sudo defaults write com.apple.CrashReporter DialogType none &&

#Show all filename extensions (so that "Evil.jpg.app" cannot masquerade easily).
sudo defaults write NSGlobalDomain AppleShowAllExtensions -bool true &&

sudo scutil --set ComputerName LORRA-MAC &&
sudo scutil --set LocalHostName LORRA-MAC &&

#To enable sshd and allow incoming ssh connections:
#sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist &&

sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on &&
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setloggingmode on &&
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on &&

NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/$USER/.zprofile &&
eval "$(/opt/homebrew/bin/brew shellenv)" &&

brew install mas &&
#mas install 6449873635 &&
#mas install 1320666476 &&
#mas install 1601151613 &&
#mas install 1544743900 &&
#mas install 1529448980 &&
#mas install 441258766 &&
mas install 937984704 &&
#mas install 1474276998 &&

brew install --cask google-chrome &&
#brew install --cask itau &&
#brew install --cask obsidian &&
brew install --cask transmission &&
#brew install --cask visual-studio-code &&
brew install --cask whatsapp &&
brew install --cask teamviewer &&
brew install --cask nordvpn &&
#brew install --cask appcleaner &&
brew install --cask signal &&
brew install --cask firefox &&
#sudo -u $USER brew install htop &&
#sudo -u $USER brew install docker && 
#sudo -u $USER brew install docker-compose &&

curl -O https://tinyurl.com/379r6axs &&
curl -O https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_setup.pkg &&
sudo -S installer -pkg /Users/$USER/warsaw_setup.pkg -target /Applications
#brew update -v && 
#brew upgrade -v && 
#brew cleanup && 
#brew autoremove &&

#sudo -S purge && 

#sudo -u $USER sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &&
#sudo -u $USER brew install zsh-syntax-highlighting &&

#sudo nvram -c