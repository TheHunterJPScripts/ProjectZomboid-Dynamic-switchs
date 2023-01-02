local LinkedLightSwitchsData = require("../server/LinkedLightSwitchsData");


LightSwitchInteraction = {
	switch = nil
}

local switchSprite <const> = "linghting_indoor_01"

LightSwitchInteraction.onInteraction = function (player, context, _worldobjects, test) 
	local pl = getPlayer(player)

	for i,v in ipairs(_worldobjects) do
		
		spriteName = v:getSprite():getName()
		print("Check: ", switchSprite)
		print("To check ", spriteName)
		print("Match ", string.match(switchSprite, spriteName))

		if instanceof(v, "IsoLightSwitch") then

			if string.find(v:getSprite():getName(), switchSprite) then
				print("[DS]: Index: ", i, " Name: IsoLightSwitch Name: ", v:getSprite():getName())
				print("Position X: ", v:getSquare():getX(), " Y: ", v:getSquare():getY())
				LightSwitchInteraction.switch = v
				break
			else
				print("Not found")
			end
		end
	end

	if not switch then return end
	pl:Say("There is a switch there")


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

function isInLinkingMode(switch)
	return true
end

local function isLightSwitch(isoObject)
	if not instanceof(v, "IsoLightSwitch") then return false end

	sprite = v:getSprite():getName()
	if not	string.match(sprite, switchSprite) then return false end
	
	return true
end


-- function ISSwitchMenu:new(player, context)
--     ISSwitchMenu.player = getPlayer(player) -- Get user reference
--     ISSwitchMenu.inventory = ISSwitchMenu.player:getInventory() -- Get user inventory references
-- end

Events.OnFillWorldObjectContextMenu.Add(LightSwitchInteraction.onInteraction);