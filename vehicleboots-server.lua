lib.callback.register('vehicle-boots:checkPermissions', function(source)
    return IsPlayerAceAllowed(source, 'lascommand.generalmanager')
end)