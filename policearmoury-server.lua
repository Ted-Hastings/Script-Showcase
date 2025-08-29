RegisterServerEvent("armoury:checkRolePoliceArmoury")
AddEventHandler("armoury:checkRolePoliceArmoury", function()
    local src = source
    local playerMenus = {}

    for menuKey, menuData in pairs(Config.AllowedMenus) do
        for _, perm in ipairs(menuData.acePermissions) do
            if IsPlayerAceAllowed(src, perm) then
                playerMenus[menuKey] = true
                break
            end
        end
    end

    TriggerClientEvent("armoury:returnCheckPoliceArmoury", src, playerMenus)
end)