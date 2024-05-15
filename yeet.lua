function print_inventory_on_monitor(chest, monitor)
    
    local function writeLine(text)
        monitor.write(text)  -- Schrijf de tekst op de huidige regel
        _, y = monitor.getCursorPos()
        monitor.setCursorPos(1,y + 1)  -- Verplaats de cursor naar de volgende regel
    end
    
    
        monitor.clear()  -- Clear the monitor screen
        monitor.setCursorPos(1, 1)  -- Reset cursor position to top left corner
    for slot, item in pairs(chest.list()) do
        local item_name = string.sub(item.name, 11)
        writeLine(string.format("%dx %s\n", item.count, item_name))
    end
end

-- De while loop om elke 10 seconden de monitor te updaten
while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("chest")

    print_inventory_on_monitor(chest, monitor)
    sleep(10)  -- Wait for 10 seconds before the next update
end
