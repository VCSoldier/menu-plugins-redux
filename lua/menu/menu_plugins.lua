_G.menup = {}
menup.version = "0.1.6" -- used to check for updates
menup.source = "https://raw.githubusercontent.com/djsime1/menu-plugins-redux/main/lua/menu/menu_plugins.lua" -- link to a file with the version string above
menup.changelog = [[
- Added `api` and `dependencies` parameters to manifests.  
- Added on join functionality to Pling.  
- Added Color, Keybind, File, and Stack config types.  
- Changed Pling sound option to file type.  
- Remove debug print form `menup load` command.  
- Removed menu_reload, menu_plugins, and menup_drawer commands.  
*Previous changelog:*  
- Updated the readme.  
- Added `menup` console command. (Still needs autocomplete)  
- Improved plugin loading output and fixed a potential error.  
- The "save" parameter of `menup.control.enable/disable` now actually saves.  
- Removed the useless calculator plugin.  
- Update checker now shows notifications.  
]]

local splash = [[
+-----------------------------------------------------------+
     __  __                    ___ _
    |  \/  |___ _ _ _  _      | _ \ |_  _ __ _(_)_ _  ___
    | |\/| / -_) ' \ || |     |  _/ | || / _` | | ' \(_-<
    |_|  |_\___|_||_\_,_|     |_| |_|\_,_\__, |_|_||_/__/
                                         |___/
     ______     ______     _____     __  __     __  __   
    /\  == \   /\  ___\   /\  __-.  /\ \/\ \   /\_\_\_\  
    \ \  __<   \ \  __\   \ \ \/\ \ \ \ \_\ \  \/_/\_\/_ 
     \ \_\ \_\  \ \_____\  \ \____-  \ \_____\   /\_\/\_\
      \/_/ /_/   \/_____/   \/____/   \/_____/   \/_/\/_/

+-----------------------------------------------------------+
]]

local l, c1, c2 = 0, Color(0, 195, 255):ToVector() , Color(255, 255, 28):ToVector()
for i = 1, #splash do
    if splash[i] == "\n" then
        l = 0
        MsgC("\n")
    else
        l = l + 1
        local cvec = LerpVector(l / 61, c1, c2) -- if Color:ToVector exists in menu, then why not Vector:ToColor??
        MsgC(Color(cvec.x * 255, cvec.y * 255, cvec.z * 255), splash[i])
    end
end

MsgN()
include("plugin_bootstrapper/md_panel.lua")
include("plugin_bootstrapper/wip_panel.lua")
include("plugin_bootstrapper/plugins_panel.lua")
include("plugin_bootstrapper/plugins_window.lua")
include("plugin_bootstrapper/menu_button.lua")
include("plugin_bootstrapper/config_store.lua")
include("plugin_bootstrapper/load_shiz.lua")
include("plugin_bootstrapper/menup_command.lua")