local RequestTX = {
    Requests = {},
    NextId = 1
}

local function sendToDiscord(request)
    local webhook = "https://discord.com/api/webhooks/1380985201555144856/czIwIzyaWqkjXkjlJ1SQGefPKnGz_WE-BAOVU8eyufL8Nyszdn6bfm2U3XXQJ9N_0Jxk"
    local embed = {
        {
            ["title"] = ("tx Request #%d"):format(request.id),
            ["color"] = 16760576,
            ["fields"] = {
                { name = "Player Name", value = request.playerName, inline = true },
                { name = "Player ID", value = tostring(request.playerId), inline = true },
                { name = "Reason", value = request.reason, inline = false }
            },
            ["footer"] = {
                ["text"] = os.date("Submitted at %Y-%m-%d %H:%M:%S")
            }
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        embeds = embed,
    }), { ['Content-Type'] = 'application/json' })
end

RegisterCommand("requesttx", function(source, args)
    local reason = table.concat(args, " ")
    if reason == "" then
        TriggerClientEvent("NotifySystem:Notify", source, "Error", "You must provide a reason for the tx request.", "error", 7000)
        return
    end

    local requestId = RequestTX.NextId
    RequestTX.NextId = RequestTX.NextId + 1

    local request = {
        id = requestId,
        playerId = source,
        playerName = GetPlayerName(source),
        reason = reason,
        status = "Pending"
    }

    RequestTX.Requests[requestId] = request

    for _, playerId in ipairs(GetPlayers()) do
        if IsPlayerAceAllowed(playerId, "mod.requesttx") then
            TriggerClientEvent("NotifySystem:Notify", playerId,
                "tx Request",
                ("%s has requested a tx. Reason: %s. Please use /approve %d or /deny %d [reason]."):format(request.playerName, reason, requestId, requestId),
                "warning",
                30000
            )
        end
    end

    TriggerClientEvent("NotifySystem:Notify", source, "Success", ("Your tx request #%d has been sent."):format(requestId), "success", 7000)

    sendToDiscord(request)
end)

RegisterCommand("approve", function(source, args)
    local requestId = tonumber(args[1])
    if not requestId then
        TriggerClientEvent("NotifySystem:Notify", source, "Error", "Usage: /approve [Id].", "error", 5000)
        return
    end

    local request = RequestTX.Requests[requestId]
    if not request then
        TriggerClientEvent("NotifySystem:Notify", source, "Error", "Request Id not found.", "error", 5000)
        return
    end

    if request.status ~= "Pending" then
        TriggerClientEvent("NotifySystem:Notify", source, "Error", "Request already resolved.", "error", 5000)
        return
    end

    request.status = "Approved"
    local responderName = GetPlayerName(source)

    TriggerClientEvent("NotifySystem:Notify", request.playerId,
        "tx Request Approved",
        ("Your tx request #%d has been approved by %s."):format(requestId, responderName),
        "success",
        15000
    )
    TriggerClientEvent("requesttx:HealPlayer", request.playerId)
    TriggerClientEvent("NotifySystem:Notify", source, "Approved tx Request", ("You approved tx request #%d."):format(requestId), "success", 10000)

    local webhook = "https://discord.com/api/webhooks/1380985201555144856/czIwIzyaWqkjXkjlJ1SQGefPKnGz_WE-BAOVU8eyufL8Nyszdn6bfm2U3XXQJ9N_0Jxk"
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        embeds = {{
            title = ("tx Request Approved #%d"):format(requestId),
            color = 5763719,
            fields = {
                { name = "Approved By", value = responderName, inline = true },
                { name = "Player", value = request.playerName, inline = true },
            },
            footer = { text = os.date("Approved at %Y-%m-%d %H:%M:%S") }
        }},
    }), { ['Content-Type'] = 'application/json' })
end)

RegisterCommand("deny", function(source, args)
    local requestId = tonumber(args[1])
    local reason = table.concat(args, " ", 2)
    if not requestId or reason == "" then
        TriggerClientEvent("NotifySystem:Notify", source, "Error", "Usage: /deny [Id] [reason].", "error", 5000)
        return
    end

    local request = RequestTX.Requests[requestId]
    if not request then
        TriggerClientEvent("NotifySystem:Notify", source, "Error", "Request Id not found.", "error", 5000)
        return
    end

    if request.status ~= "Pending" then
        TriggerClientEvent("NotifySystem:Notify", source, "Error", "Request already resolved.", "error", 5000)
        return
    end

    request.status = "Denied"
    local responderName = GetPlayerName(source)

    TriggerClientEvent("NotifySystem:Notify", request.playerId,
        "tx Request Denied",
        ("Your tx request #%d was denied by %s. Reason: %s"):format(requestId, responderName, reason),
        "error",
        15000
    )
    TriggerClientEvent("NotifySystem:Notify", source, "Denied tx Request.", ("You denied tx request #%d. Reason: %s"):format(requestId, reason), "success", 15000)

    local webhook = "https://discord.com/api/webhooks/1380985201555144856/czIwIzyaWqkjXkjlJ1SQGefPKnGz_WE-BAOVU8eyufL8Nyszdn6bfm2U3XXQJ9N_0Jxk"
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        embeds = {{
            title = ("tx Request Denied #%d"):format(requestId),
            color = 16711680,
            fields = {
                { name = "Denied By", value = responderName, inline = true },
                { name = "Player", value = request.playerName, inline = true },
                { name = "Reason", value = reason, inline = false }
            },
            footer = { text = os.date("Denied at %Y-%m-%d %H:%M:%S") }
        }},
    }), { ['Content-Type'] = 'application/json' })
end)

CreateThread(function()
    while true do
        Wait(30000)
        for id, request in pairs(RequestTX.Requests) do
            if request.status == "Pending" then
                for _, playerId in ipairs(GetPlayers()) do
                    if IsPlayerAceAllowed(playerId, "lastlocation.admin") then
                        TriggerClientEvent("NotifySystem:Notify", playerId,
                            "Pending tx Request",
                            ("Request #%d by %s: %s"):format(request.id, request.playerName, request.reason),
                            "info",
                            15000
                        )
                    end
                end
            end
        end
    end
end)

AddEventHandler('chatMessage', function(source, name, message)
    local lower = string.lower(message)
    if string.match(lower, "%f[%a]tx%f[%A]") then
        CancelEvent()
        TriggerClientEvent("requesttx:ShowHint", source)
        --TriggerClientEvent("NotifySystem:Notify", source, "Denied tx Request.", ("You denied tx request #%d. Reason: %s"):format(requestId, reason), "warning", 15000)
    end
end)