--require('ISUI/ISScrollingListBox')


LightSwitchInteraction = {
	switch = nil
}


LightSwitchInteraction.onInteraction = function (player, context, _worldobjects, test) 
	
	local pl = getPlayer(player)

	for i,v in ipairs(_worldobjects) do
		local name = v:getName() or v:getObjectName();
		if name == "LightSwitch" then
			LightSwitchInteraction.switch = v
		end
	end

	if not switch then return end
	pl:Say("There is a switch there")


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


-- function ISSwitchMenu:new(player, context)
--     ISSwitchMenu.player = getPlayer(player) -- Get user reference
--     ISSwitchMenu.inventory = ISSwitchMenu.player:getInventory() -- Get user inventory references
-- end

Events.OnFillWorldObjectContextMenu.Add(LightSwitchInteraction.onInteraction);