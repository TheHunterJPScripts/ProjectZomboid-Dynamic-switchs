DynamicSwitchServerMod = DynamicSwitchServerMod or {};
DynamicSwitchServerMod.Data = DynamicSwitchServerMod.Data or {}; -- storing moddata table here
DynamicSwitchServerMod.ClientCommands = DynamicSwitchServerMod.ClientCommands or {}; -- storing client command handlers here

-- Client Command Handler : MyCommand
MyServerMod.ClientCommands.MyCommand(player, args)
    -- data will be changed on server, if its single-player it will be changed on the "client" too.
    DynamicSwitchServerMod.Data.InfoStorageExample[args.key] = args.value;

    -- send the change to all clients, will not send if single-player not needed anyway
    sendServerCommand("DynamicSwitchMod", "UpdateSomeData", args);

    -- if we want to simulate sending it to a client in singleplayer we can just triggerEvent OnServerCommand
    -- triggerEvent("OnServerCommand", "MyMod", "UpdateSomeData", args);
end

--- handle initialization of moddata
local function initGlobalModData(isNewGame)
    DynamicSwitchServerMod.Data.InfoStorageExample = ModData.getOrCreate("InfoStorageExample");
end
Events.OnInitGlobalModData.Add(initGlobalModData);

--- handle receiving client commands
local function receiveClientCommand(module, command, player, args)
    if module ~= "DynamicSwitchMod" then return; end
    if DynamicSwitchServerMod.ClientCommands[command] then
        DynamicSwitchServerMod.ClientCommands[command](player, args);
    end
end

Events.OnClientCommand.Add(receiveClientCommand);