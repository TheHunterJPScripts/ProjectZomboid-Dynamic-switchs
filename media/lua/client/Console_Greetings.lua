

local function consoleGreetings(_keyPressed)
    local key = _keyPressed
    local playerObj = getPlayer(0)
    local playerInv = playerObj:getInventory()

    if key == 25 then
        playerInv:AddItem("Base.Screwdriver");
        print("[DS]: Added screwdriver to the inventory")
    end
end




Events.OnKeyPressed.Add(consoleGreetings)