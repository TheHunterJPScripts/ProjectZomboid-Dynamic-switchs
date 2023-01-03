MyServerMod = MyServerMod or {};
MyServerMod.Data = MyServerMod.Data or {}; -- storing moddata table here
MyServerMod.ClientCommands = MyServerMod.ClientCommands or {}; -- storing client command handlers here

-- Client Command Handler : MyCommand
MyServerMod.ClientCommands.MyCommand(player, args)
    if isDebugEnabled() or player:getAccessLevel() == "Admin" then -- example of possible check to validate client commands
        -- data will be changed on server, if its single-player it will be changed on the "client" too.
        MyServerMod.Data.InfoStorageExample[args.key] = args.value;

        -- send the change to all clients, will not send if single-player not needed anyway
        sendServerCommand("MyMod", "UpdateSomeData", args);

        -- if we want to simulate sending it to a client in singleplayer we can just triggerEvent OnServerCommand
        -- triggerEvent("OnServerCommand", "MyMod", "UpdateSomeData", args);
    end
end

--- handle initialization of moddata
local function initGlobalModData(isNewGame)
    MyServerMod.Data.InfoStorageExample = ModData.getOrCreate("InfoStorageExample");
end
Events.OnInitGlobalModData.Add(initGlobalModData);

--- handle receiving client commands
local function receiveClientCommand(module, command, player, args)
    if module ~= "MyMod" then return; end
    if MyServerMod.ClientCommands[command] then
        MyServerMod.ClientCommands[command](player, args);
    end
end
Events.OnClientCommand.Add(receiveClientCommand);