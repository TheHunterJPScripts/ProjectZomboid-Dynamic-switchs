LinkedLightSwitchsData = {
    dataTable = nil
}

function LinkedLightSwitchsData.load()
    print("[LinkedLightSwitchsData] Initializing")
    LinkedLightSwitchsData.dataTable = "Hello"
    print("[LinkedLightSwitchsData] Initialized")
end

function LinkedLightSwitchsData.save()
    print("[LinkedLightSwitchsData] Saving")
    print("[LinkedLightSwitchsData] Content: ", LinkedLightSwitchsData.dataTable)
end


Events.OnLoad.Add(LinkedLightSwitchsData.load)
Events.OnSave.Add(LinkedLightSwitchsData.save)