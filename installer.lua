print("installing ccshop")
local files = {
    -- actual code
    "ccshop.lua",
    "krist.lua",
    "stock.lua",
    "topbar.lua",
    "shopsync.lua",
    -- libs
    "lib/abstractInvLib.lua",
    "lib/Krypton.lua",
    "lib/split.lua"
}
local args = {...}

local commitID = "main"

if args[1] then
    commitID = args[1]
end

local cdn = "https://raw.githubusercontent.com/windclan/ccshop/"..commitID.."/src/"

if not fs.exists("ccshop/settings.lua") then
    -- downloads example settings if settings.lua is missing
    table.insert(files, "settings-example.lua")
end

for k,v in pairs(files) do
    print("> Downloading file: "..v)

    local file = io.open("ccshop/"..v, "w")
    if file == nil then return end
    file:write(http.get(cdn..v).readAll())
    print("> Downloaded: "..v)
end

print("..")
print("this shop is intended for POWERUSERS.")
print("do NOT except a simple to use interface.")
print("..")
print("1. copy `ccshop/settings-example.lua` to `ccshop/settings.lua`")
print("2. edit `ccshop/settings.lua`")
print("3. start ccshop by `cd ccshop` `ccshop`. you can setup a startup script by")
print('   copying the startup.lua file from the github repository.')
