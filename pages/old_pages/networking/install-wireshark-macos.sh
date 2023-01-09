#!/bin/bash
brew update                           # Fetch latest version of homebrew and formula.
brew tap caskroom/cask                # Tap the Caskroom/Cask repository from Github using HTTPS.
brew search wireshark                 # Searches all known Casks for a partial or exact match.
brew cask info wireshark              # Displays information about the given Cask
brew cask install wireshark           # Install the given cask.
brew cleanup                          # Remove any older versions from the cellar.
