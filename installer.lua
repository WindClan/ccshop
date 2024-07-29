print("installing fwshop")
local files = {
    -- actual code
    "fwshop.lua",
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
local commitID = "287171e218b069feeb658490cff1c20da535ac97"

if args[1] then
    commitID = args[1]
end

local cdn = "https://raw.githubusercontent.com/windclan/fwshop/"..commitID.."/src/"

if not fs.exists("fwshop/settings.lua") then
    -- downloads example settings if settings.lua is missing
    table.insert(files, "settings-example.lua")
end

for k,v in pairs(files) do
    print("> Downloading file: "..v)

    local file = io.open("fwshop/"..v, "w")
    if file == nil then return end
    file:write(http.get(cdn..v).readAll())
    print("> Downloaded: "..v)
end

print("..")
print("this shop is intended for POWERUSERS.")
print("do NOT except a simple to use interface.")
print("..")
print("1. copy `fwshop/settings-example.lua` to `fwshop/settings.lua`")
print("2. edit `fwshop/settings.lua`")
print("3. start fwshop by `cd fwshop` `fwshop`. you can setup a startup script by")
print('   copying the startup.lua file from the github repository.')
