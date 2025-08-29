local function hasWeaponPermission(player, ace)
    return IsPlayerAceAllowed(player, ace)
end

RegisterNetEvent('WeaponRestrictions:CheckPermissions')
AddEventHandler('WeaponRestrictions:CheckPermissions', function(role)
    local player = source
    local rolePerm = Config.WeaponPermissions[role]
    local adminPerm = Config.WeaponPermissions.ADMIN

    if not hasWeaponPermission(player, rolePerm) and not hasWeaponPermission(player, adminPerm) then
        TriggerClientEvent('WeaponRestrictions:RemoveRestrictedWeapons', player, role, Config.RestrictedWeapons[role])
    end
end)

RegisterNetEvent('WeaponRestrictions:LogRemoval')
AddEventHandler('WeaponRestrictions:LogRemoval', function(role, weaponLabel)
    local player = source
    local playerName = GetPlayerName(player)
    local msg = ("Removed weapon: %s (%s)"):format(weaponLabel, role)
    LogToDiscord(playerName, msg)
end)

function LogToDiscord(playerName, report)
    local embedPayload = {
        embeds = {
            {
                ["title"] = Config.Title,
                ["color"] = Config.EmbedColour,
                ["fields"] = {
                    {["name"] = "Weapon", ["value"] = report},
                    {["name"] = "Player", ["value"] = playerName}
                }
            }
        }
    }

    PerformHttpRequest(Config.Webhook, function() end, "POST", json.encode(embedPayload), {
        ["Content-Type"] = "application/json"
    })
end