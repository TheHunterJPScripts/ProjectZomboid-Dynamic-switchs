
-- local LinkedLightSwitchsData = require("../server/LinkedLightSwitchsData");


LightSwitchInteraction = {
	switch = nil
}

local switchSprite = "linghting_indoor_01"

function isLightSwitch(isoObject)
	print("Before isntance check")
	print("instance: ", instanceof(v, "IsoLightSwitch"))
	
	if not instanceof(v, "IsoLightSwitch") then return false end

	print("Process found check")
	spriteName = v:getSprite():getName()
	_, found = string.find(spriteName, switchSprite)
	print("Before found check")

	if not found then return false end

	print("Before after found check")
	
	return true
end

LightSwitchInteraction.onInteraction = function (player, context, _worldobjects, test) 
	-- Coment
	for i,v in ipairs(_worldobjects) do
		if isLightSwitch(v) then
			-- print("[DS]: Index: ", i, " Name: IsoLightSwitch Name: ", v:getSprite():getName())
			-- print("Position X: ", v:getSquare():getX(), " Y: ", v:getSquare():getY())
			print("Found")
			LightSwitchInteraction.switch = v
		end
	end

	-- local pl = getPlayer(player)
	-- pl:Say(LightSwitchInteraction.switch:getSprite():getName())

	-- if not LightSwitchInteraction.switch then return end
	-- pl:Say("There is a switch there")


	--LinkedLightSwitchsData.addLinked(v.getKeyId())

	-- Disable on/of option if the switch is on link mode
	-- if not isInLinkingMode(LightSwitchInteraction.switch) then return end
	--object:toggle()
	-- if instanceof(object, "IsoLightSwitch") then
    --     return ISObjectClickHandler.doClickLightSwitch(object, playerNum, playerObj)
    -- end



	-- TODO: add new menu option to link the switch
	-- TODO: Put the menu option to turn on and off the on red if the switch is on link mode
end



-- function ISSwitchMenu:new(player, context)
--     ISSwitchMenu.player = getPlayer(player) -- Get user reference
--     ISSwitchMenu.inventory = ISSwitchMenu.player:getInventory() -- Get user inventory references
-- end

Events.OnFillWorldObjectContextMenu.Add(LightSwitchInteraction.onInteraction);