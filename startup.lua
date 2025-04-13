while true do
    a = peripheral.find("monitor")
    a.setTextScale(1)
    shell.run("ccshop/fwshop.lua")
    a.setBackgroundColor(colors.blue)
    a.setTextColor(colors.white)
    a.clear()
    a.setCursorPos(1,1)
    a.write("Offline! Restarting")
    sleep(3)
end
