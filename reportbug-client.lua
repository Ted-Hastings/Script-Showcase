local function createBugReportMenu()
    local input = lib.inputDialog(Config.MenuTitle, Config.BugReport.Fields)

    if input then
        local description = input[1]
        local steps = input[2]
        local severityInput = tonumber(input[3])
        local severityLabel = Config.BugReport.SeverityLabels[severityInput] or "Unknown"

        TriggerServerEvent("bugReport:submit", description, steps, severityLabel)

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
    createBugReportMenu()
end, false)

function ShowInfo(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end