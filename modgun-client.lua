local deleteKey = Config.DeleteKey
local deleteKey2 = Config.DeleteKey2

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if (IsControlPressed(0, deleteKey) or IsControlPressed(0, deleteKey2)) and IsPlayerFreeAiming(PlayerId()) then
            local entity = getEntityInPlayerCrosshair()
            if entity and NetworkGetEntityIsNetworked(entity) then
                TriggerServerEvent('entityDeleter:deleteEntity', NetworkGetNetworkIdFromEntity(entity))
            end
        end
    end
end)

function getEntityInPlayerCrosshair()
    local player = PlayerPedId()
    local result, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())
    if result then
        return entity
    end
    return nil
end

RegisterNetEvent('entityDeleter:deleteEntityForAll')
AddEventHandler('entityDeleter:deleteEntityForAll', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if DoesEntityExist(entity) then
        DeleteEntity(entity)
    end
end)