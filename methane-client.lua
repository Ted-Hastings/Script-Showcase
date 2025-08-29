local function createmethaneDeclaredMenu()
    local input = lib.inputDialog('Declare METHANE', {
        {type = 'input', label = 'Major Incident declared?', description = 'Has a major incident been declared?', required = true, min = 1, max = 255},
        {type = 'input', label = 'Exact Location', description = 'What is the location of the incident?', required = true, min = 1, max = 255},
        {type = 'input', label = 'Type of incident', description = 'What type of incident?', required = true, min = 1, max = 255},
        {type = 'input', label = 'Hazards present or suspected', description = 'What hazards are present or suspected?', required = true, min = 1, max = 255},
        {type = 'input', label = 'Access - routes that are safe to use', description = 'Which routes are safe for access?', required = true, min = 1, max = 255},
        {type = 'input', label = 'Number, type, severity of casualties', description = 'How many casualties, what are their injuries and severity?', required = true, min = 1, max = 255},
        {type = 'input', label = 'Emergency services present and required', description = 'Which services are present and which are required?', required = true, min = 1, max = 255},        
    })

    if input then
        local mideclared = input[1]
        local location = input[2]
        local type = input[3]
        local hazards = input[4]
        local access = input[5]
        local number = input[6]
        local emergencyservices = input[7]

        TriggerServerEvent("methaneDeclared:submit", mideclared, location, type, hazards, access, number, emergencyservices)

        if Config.NotificationType == "NotifySystem" then
            TriggerEvent("NotifySystem:Notify", Config.Notifications.successtitle, Config.Notifications.success, "success", 5000)
        else
            TriggerEvent("ShowInfo", Config.Notifications.success)
        end  
    else
        if Config.NotificationType == "NotifySystem" then
            TriggerEvent("NotifySystem:Notify", Config.Notifications.errortitle, Config.Notifications.error, "error", 5000)
        else
            TriggerEvent("ShowInfo", Config.Notifications.error)
        end  
    end
end

RegisterCommand(Config.Command, function()
    createmethaneDeclaredMenu()
end, false)