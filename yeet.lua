-- Function to move forward with error handling
local function moveForward()
    while not turtle.forward() do
        if turtle.detect() then
            -- If there's an obstacle, try digging in front
            if turtle.dig() then
                -- If successful, try moving forward again
                turtle.forward()
            else
                print("Unable to move forward. Stuck at obstacle.")
                return false
            end
        elseif turtle.getFuelLevel() == 0 then
            -- If fuel is depleted, print error message
            print("Unable to move forward. Out of fuel.")
            return false
        end
    end
    return true
end

-- Harvest a block in front
turtle.dig()

-- Move forward with error handling
if moveForward() then
    -- Dig down
    turtle.digDown()

    -- Move down
    turtle.down()
end
