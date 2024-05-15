local monitor = peripheral.find("monitor")


local function writeLine(text)
    monitor.clear()
    monitor.write(text)  -- Schrijf de tekst op de huidige regel
    _, y = monitor.getCursorPos()
    monitor.setCursorPos(1,y + 1)  -- Verplaats de cursor naar de volgende regel
end

function print_inventory_on_monitor(chest, monitor)
    chest = peripheral.find("minecraft:chest")
    for slot, item in pairs(chest.list()) do
        local item_name = string.sub(item.name, 11)
        writeLine(string.format("%dx %s", item.count, item_name))
    end
end

-- De while loop om elke 10 seconden de monitor te updaten
while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("minecraft:chest")

    print_inventory_on_monitor(chest, monitor)
    sleep(10)  -- Wait for 10 seconds before the next update
end
