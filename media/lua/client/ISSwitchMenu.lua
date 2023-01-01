ISSwitchMenu = {}

ISSwitchMenu.switchMenu = function (player, context, worldobjects) 

    print("Context name: ", context.name)
    -- General menu
    local subMenu = nil;
    local buildOption = nil;
    -- Check the current open menus and search for the building menu.
    for i,v in ipairs(context.options) do	
        if v.name == getText("ContextMenu_Build") then		
            buildOption = v;		
            -- Retrieve the sub menu in case it is found.
            subMenu = context:getSubMenu(buildOption.subOption);	
        end
    end
    if subMenu then	
        subMenu:addOption(getText("ContextMenu_LightSwitchs"), worldobjects, onClickLightOption1);
    end
end

function onClickLightOption1() 
    print("[DS]: Click light option 1") -- TODO
end

Events.OnFillWorldObjectContextMenu.Add(ISSwitchMenu.switchMenu);