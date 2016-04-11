# dexcom-osx-menu-item

## Install

Currently, these instructions are for those that are relatively tech savvy. Time pending, I may clean this up to simplify install. 

### Dependencies

1. Install [openaps](https://github.com/openaps/openaps) so you can interact with your Dexcom
2. Install jq to parse the json from the device <code>brew install jq</code>
3. Install BitBar so you can pipe data from the script to a menu item <code>brew cask install bitbar</code>

### Script

1. Clone the git repo <code>git clone git@github.com:DanGodfrey/dexcom-osx-menu-item.git</code>
2. Modify the env config section of the script as needed for your setup
3. Launch BitBar
4. If you have not set a Plugin Folder, it will ask you to provide one. Point it at the bin directory of the git repo
5. If you are not prompted, open BitBar's preferences and do the same.
6. If you want to use the American units of mg/dL, replace <code>$proper_glucose</code> with <code>$american_glucose</code> at the end of the script
