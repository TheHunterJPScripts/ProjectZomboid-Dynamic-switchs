local Json = require("Json");

LinkedLightSwitchsData = {
    message = "Hello"
    dataTable = {
    }
}

function LinkedLightSwitchsData.load()
    -- print("[LinkedLightSwitchsData] Initializing data")
    -- local fileReaderObj = getFileReader("linkedLightSwitchsMod_data.json", true);
    -- local json = "";
    -- local line = fileReaderObj:readLine();
    -- while line ~= nil do
    --     json = json .. line;
    --     line = fileReaderObj:readLine()
    -- end
    -- fileReaderObj:close();

    -- if json and json ~= "" then
    --     theTable = Json.Decode(json);
    -- end
    -- LinkedLightSwitchsData.dataTable = theTable
end

function LinkedLightSwitchsData.save()
    print("[LinkedLightSwitchsData] Saving data")
    local fileWriterObj = getFileWriter("linkedLightSwitchsMod_data.json", true, false);
    local json = Json.Encode(LinkedLightSwitchsData.dataTable);
    fileWriterObj:write(json);
    fileWriterObj:close();
end

function LinkedLightSwitchsData.hasLinkedSwith(id)
    return LinkedLightSwitchsData.dataTable[key] ~= nil
end

function LinkedLightSwitchsData.addLinked(id)
    if LinkedLightSwitchsData.hasLinkedSwith(id) then return end
    LinkedLightSwitchsData.dataTable[id] = {}
end

function LinkedLightSwitchsData.addTargetToLinked(id, target)
    LinkedLightSwitchsData.addLinked(id)
    LinkedLightSwitchsData.dataTable[id][target.key] = target.value
end

function LinkedLightSwitchsData.removeLinked(id)
    if LinkedLightSwitchsData.hasLinkedSwith(id) then return end
    LinkedLightSwitchsData.dataTable[id] = nil
end

function LinkedLightSwitchsData.removeTargetToLinked(id, key)
    if LinkedLightSwitchsData.hasLinkedSwith(id) then return end
    LinkedLightSwitchsData.dataTable[id][key] = nil
end


Events.OnLoad.Add(LinkedLightSwitchsData.load)
Events.OnSave.Add(LinkedLightSwitchsData.save)

return LinkedLightSwitchsData