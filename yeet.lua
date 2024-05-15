-- Installeer deze code op een mining turtle in Minecraft

-- Variabelen instellen
local stripWidth = 3 -- Breedte van elke strip
local stripLength = 20 -- Lengte van de strip mijnoperatie

-- Functie om één strip te mijnen
local function mineStrip()
    for i = 1, stripWidth do
        turtle.dig()
        turtle.forward()
    end
end

-- Functie om naar het begin van de volgende strip te bewegen
local function moveToNextStrip()
    turtle.turnRight()
    turtle.dig()
    turtle.forward()
    turtle.turnRight()
end

-- Hoofdprogramma
for strip = 1, stripLength do
    mineStrip()
    if strip < stripLength then
        moveToNextStrip()
    end
end

-- Terugkeren naar het startpunt
turtle.turnLeft()
for i = 1, stripLength do
    turtle.forward()
end
turtle.turnRight()
