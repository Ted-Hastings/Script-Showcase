RegisterServerEvent("methaneDeclared:submit")
AddEventHandler("methaneDeclared:submit", function(mideclared, location, type, hazards, access, number, emergencyservices)
    local src = source
    local webhook_url = Config.Webhook
    local role_id = Config.Ping.roleid

    local discordID
    for _, id in ipairs(GetPlayerIdentifiers(src)) do
        if string.sub(id, 1, 8) == "discord:" then
            discordID = string.sub(id, 9)
            break
        end
    end

    local userPing = discordID and "<@" .. discordID .. ">" or "Unknown User"

    local embed = {
        ["title"] = "METHANE Declared",
        ["fields"] = {
            {["name"] = "Major Incident declared?", ["value"] = mideclared, ["inline"] = false},
            {["name"] = "Exact Location", ["value"] = location, ["inline"] = false},
            {["name"] = "Type of incident", ["value"] = type, ["inline"] = false},
            {["name"] = "Harards present or suspected", ["value"] = hazards, ["inline"] = false},
            {["name"] = "Access - routes that are safe to use", ["value"] = access, ["inline"] = false},
            {["name"] = "Number, type, severity of casulties", ["value"] = number, ["inline"] = false},
            {["name"] = "Emergency services present and required", ["value"] = emergencyservices, ["inline"] = false}
        },
        ["color"] = Config.Colour
    }

    PerformHttpRequest(webhook_url, function(err, text, headers)
    end, 'POST', json.encode({
        content = "<@&" .. role_id .. "> ".. Config.Ping.message .. " " .. userPing,
        embeds = {embed}
    }), {['Content-Type'] = 'application/json'})   
end)