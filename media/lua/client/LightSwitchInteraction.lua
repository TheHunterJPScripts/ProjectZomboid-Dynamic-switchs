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

local function getSwitchActiveFromServer(switch)
	return switch:getModData()["active"] == nil or switch:getModData()["active"] ~= "true" -- TODO: Move to the server using event system
end

local function setSwitchActiveFromServer(switch, active)
	switch:getModData()["active"] = active -- TODO: Move to the server using event system
	switch:transmitModData()
end

local function activateLinking(isoObject)
	setSwitchActiveFromServer(isoObject, "true")
end

local function deactivateLinking(isoObject)
	setSwitchActiveFromServer(isoObject, "false")
end

local function setLightSwitchMenu(context, targetSwitch)
	for _, option in ipairs(context.options) do
		local name = option.name

		if name == getText("ContextMenu_Turn_On") or name == getText("ContextMenu_Turn_Off") then
			local active = getSwitchActiveFromServer(targetSwitch)

			if active then
				local toolTip = ISToolTip:new()
				toolTip:initialise();
				toolTip:setVisible(false);
				toolTip.description = " <LINE> <RGB:1,0,0> " .. getText("ContextMenu_LightSwitchs_ToolTip_Disabled")
				option.toolTip = toolTip
				option.notAvailable = true

				local menuOption = context:insertOptionAfter(option.name, getText("ContextMenu_LightSwitchs_ON"), targetSwitch,
					activateLinking)
				local toolTip = ISToolTip:new()
				toolTip:initialise();
				toolTip:setVisible(false);
				toolTip:setName(getText("ContextMenu_LightSwitchs_ToolTip_Title"));
				toolTip.description = getText("ContextMenu_LightSwitchs_ToolTip_Description_ON")
				menuOption.toolTip = toolTip
			else
				local menuOption = context:insertOptionAfter(option.name, getText("ContextMenu_LightSwitchs_OFF"), targetSwitch,
					deactivateLinking)
				local toolTip = ISToolTip:new()
				toolTip:initialise();
				toolTip:setVisible(false);
				toolTip:setName(getText("ContextMenu_LightSwitchs_ToolTip_Title"));
				toolTip.description = getText("ContextMenu_LightSwitchs_ToolTip_Description_OFF")
				menuOption.toolTip = toolTip
			end

		end

	end
end

LightSwitchInteraction.onInteraction = function(player, context, _worldobjects, test)

	local switch = nil
	for i, v in ipairs(_worldobjects) do
		if isLightSwitch(v) then
			switch = v
			break
		end
	end

	if not switch then return end

	local pl = getPlayer(player)
	pl:Say("There is a switch there")

	setLightSwitchMenu(context, switch)
end

Events.OnFillWorldObjectContextMenu.Add(LightSwitchInteraction.onInteraction);
