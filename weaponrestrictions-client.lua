local function checkRolePermissions(role)
    TriggerServerEvent('WeaponRestrictions:CheckPermissions', role)
end

CreateThread(function()
    while true do
        Wait(1000)
        if NetworkIsPlayerActive(PlayerId()) then
            for _, role in ipairs(Config.RoleCheck) do
                checkRolePermissions(role)
            end
        end
    end
end)

RegisterNetEvent('WeaponRestrictions:RemoveRestrictedWeapons')
AddEventHandler('WeaponRestrictions:RemoveRestrictedWeapons', function(role, restrictedWeapons)
    local playerPed = PlayerPedId()

    for _, weapon in ipairs(restrictedWeapons) do
        if HasPedGotWeapon(playerPed, GetHashKey(weapon.name), false) then
            RemoveWeaponFromPed(playerPed, GetHashKey(weapon.name))
            if Config.NotificationType == "NotifySystem" then
                TriggerEvent("NotifySystem:Notify", Config.Notification.Title, ("%s "):format(weapon.label) .. Config.Notification.Message, "error", 5000)
            else
                TriggerEvent("ShowInfo", ("%s "):format(weapon.label) .. Config.Notification.Message)
            end
            TriggerServerEvent('WeaponRestrictions:LogRemoval', role, weapon.label)
        end
    end
end)