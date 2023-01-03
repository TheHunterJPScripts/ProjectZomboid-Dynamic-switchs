LightSwitchInteraction = {
	switch = nil
}

local switchSprite = "linghting_indoor_01"


local function isLightSwitch(isoObject)
	if not instanceof(isoObject, "IsoLightSwitch") then return false end

	sprite = isoObject:getSprite():getName()
	if string.find(sprite, switchSprite) ~= nil then return false end

	return true
end

LightSwitchInteraction.onInteraction = function(player, context, _worldobjects, test)

	local switch = nil
	for i, v in ipairs(_worldobjects) do
		if isLightSwitch(v) then
			switch = v
		end
	end

	if not switch then return end
	local pl = getPlayer(player)
	pl:Say("There is a switch there")

	-- General menu
	local subMenu = nil;
	local buildOption = nil;
	-- Check the current open menus and search for the building menu.

	menu = context:getNew()
	for i, v in ipairs(context.options) do
		if v.name == getText("ContextMenu_Build") then
			buildOption = v;
			-- Retrieve the sub menu in case it is found.
			subMenu = context:getSubMenu(buildOption.subOption);
		end
	end
	if subMenu then
		subMenu:addOption(getText("ContextMenu_LightSwitchs"), worldobjects, onClickLightOption1);
	end

	-- TODO: Disable on/of option if the switch is on link mode
	-- TODO: add new menu option to link the switch
	-- TODO: Put the menu option to turn on and off the on red if the switch is on link mode
end


Events.OnFillWorldObjectContextMenu.Add(LightSwitchInteraction.onInteraction);
