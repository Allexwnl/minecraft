-- Find the monitor peripheral
local monitor = peripheral.find("monitor")

-- Function to write a line of text on the monitor
local function writeLine(text)
    monitor.write(text)  -- Write the text on the current line
    _, y = monitor.getCursorPos()
    monitor.setCursorPos(1,y + 1)  -- Move the cursor to the next line
end

-- Function to print the inventory of a chest on the monitor
function print_inventory_on_monitor(chest, monitor)
    chest = peripheral.find("minecraft:chest")  -- Find the chest peripheral
    for slot, item in pairs(chest.list()) do
        term.setTextColor(colors.green)
        local item_count = item.count
        term.setTextColor(colors.white)
        local item_name = string.sub(item.name, 11)  -- Get the item name
        writeLine(string.format("%dx %s", item_count, item_name))  -- Write the item count and name on the monitor
    end
end

-- While loop to update the monitor every 10 seconds
while true do
    local chest = peripheral.find("chest")  -- Find the chest peripheral
    monitor.clear()  -- Clear the monitor
    monitor.setCursorPos(1, 1)  -- Move the cursor to the next line

    print_inventory_on_monitor(chest, monitor)  -- Print the inventory on the monitor
    sleep(10)  -- Wait for 10 seconds before the next update
end
