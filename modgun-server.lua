RegisterServerEvent('entityDeleter:deleteEntity')
AddEventHandler('entityDeleter:deleteEntity', function(netId)
    local _source = source
    if IsPlayerAceAllowed(_source, Config.AcePerm) then
        if DoesEntityExist(NetworkGetEntityFromNetworkId(netId)) then
            TriggerClientEvent('entityDeleter:deleteEntityForAll', -1, netId)
        end
    end
end)

RegisterCommand('delete_entity', function(source, args, rawCommand)
    if source == 0 then
        TriggerClientEvent('entityDeleter:deleteEntityForAll', -1, entity)
    end
end, true)