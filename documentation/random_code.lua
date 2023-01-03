local function getIsoObjectCoords(isoObject)
    local x = isoObject:getSquare():getX()
    local y = isoObject:getSquare():getY()
    local z = isoObject:getSquare():getZ()
    return x, y, z
end

local function playerSay(playerNumber, str)
    local pl = getPlayer(playerNumber)
    pl:Say("There is a switch there")
end

-- Subscribe to Events.OnKeyPressed to get the key pressed
local function addItemOnKeyPress(player, _keyPressed, keyDesired, itemBase)
    local key = _keyPressed
    local playerObj = getPlayer(player)
    local playerInv = playerObj:getInventory()

    if key == keyDesired then
        playerInv:AddItem(itemBase);
    end
end
