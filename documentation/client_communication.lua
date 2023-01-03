MyMod = MyMod or {};
MyMod.Data = MyMod.Data or {}; -- storing modData tables in here
MyMod.ServerCommands = MyMod.ServerCommands or {}; -- storing server commands handlers here

--- client function to send changes to the server
function MyMod.sendSomeChange(key, value)
    local args = { key = key, value = value };
    sendClientCommand("MyMod", "MyCommand", args);
end

--- Server Command Handler : UpdateSomeData
function MyMod.ServerCommands.UpdateSomeData(args)
    MyMod.Data.InfoStorageExample[args.key] = args.value;
end

--- handle initializing moddata
local function initGlobalModData(isNewGame)
    -- clear only if its a client, if it's single-player we dont need to clear
    if isClient() and ModData.exists("InfoStorageExample") then
        -- clear the current copy for a client cause it might be outdated
        ModData.remove("InfoStorageExample");
    end

    MyMod.Data.InfoStorageExample = ModData.getOrCreate("InfoStorageExample");
end

Events.OnInitGlobalModData.Add(initGlobalModData);

--- handle receiving moddata
local function receiveGlobalModData(name, data)
    if MyMod.Data[name] and type(data) == "table" then
        if #data > 0 then
            -- if the received data is an array table
            for _, value in ipairs(data) do
                table.insert(MyMod.Data[name], value);
            end
        else
            -- if the received data is a key/value table
            for key, value in pairs(data) do
                MyMod.Data[name][key] = value;
            end
        end
    end
end

Events.OnReceiveGlobalModData.Add(receiveGlobalModData);

--- handle receiving server commands
local function receiveServerCommand(module, command, args)
    if module ~= "MyMod" then return; end
    if MyMod.ServerCommands[command] then
        MyMod.ServerCommands[command](args);
    end
end

Events.OnServerCommand.Add(receiveServerCommand);
