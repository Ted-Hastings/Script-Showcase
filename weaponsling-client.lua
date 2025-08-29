local HasWeaponSlung = false
local SlungWeapon = nil
local WeaponToSling = nil
local AmmoInWeapon = 0
local WeaponComponents = {}

local allowedWeapons = Config.AllowedWeapons

local function ShowInfo(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(true, false)
end

local function NotifyPlayer(title, message, notifType, duration)
    if Config.NotificationType == "NotifySystem" then
        TriggerEvent("NotifySystem:Notify", title, message, notifType, duration)
    else
        ShowInfo(message)
    end
end

RegisterCommand(Config.Command.sling, function(source, args, rawCommand)
    local player = GetPlayerPed(-1)
    local selectedWeapon = GetSelectedPedWeapon(player)

    if HasWeaponSlung then
        NotifyPlayer("Error", Config.Notification.alreadyslung, "error", 5000)
        return
    end

    if not allowedWeapons[selectedWeapon] then
        NotifyPlayer("Error", Config.Notification.cannotslung, "error", 4000)
        return
    end

    WeaponToSling = selectedWeapon
    AmmoInWeapon = GetAmmoInPedWeapon(player, WeaponToSling)
    WeaponComponents = {}

    for _, component in ipairs(allowedWeapons[selectedWeapon].components or {}) do
        if HasPedGotWeaponComponent(player, WeaponToSling, component) then
            table.insert(WeaponComponents, component)
        end
    end

    SlungWeapon = CreateWeaponObject(WeaponToSling, 50, 1.0, 1.0, 1.0, true, 1.0, 0)

    for _, component in ipairs(WeaponComponents) do
        GiveWeaponComponentToWeaponObject(SlungWeapon, component)
    end

    RemoveWeaponFromPed(player, WeaponToSling)

    local boneIndex = GetPedBoneIndex(player, 24816)
    AttachEntityToEntity(SlungWeapon, player, boneIndex, Config.SlingPosition.y, Config.SlingPosition.x, Config.SlingPosition.z, 0.0, 320.0, 175.0, 1, 1, 0, 0, 2, 1)

    HasWeaponSlung = true
    SetCurrentPedWeapon(player, `WEAPON_UNARMED`, true)

    NotifyPlayer("Success", Config.Notification.weaponslung, "success", 3500)
end)

RegisterCommand(Config.Command.unsling, function(source, args, rawCommand)
    local player = GetPlayerPed(-1)

    if not HasWeaponSlung then
        NotifyPlayer("Error", Config.Notification.noweaponslung, "error", 5000)
        return
    end

    GiveWeaponToPed(player, WeaponToSling, AmmoInWeapon, false, true)

    for _, component in ipairs(WeaponComponents) do
        GiveWeaponComponentToPed(player, WeaponToSling, component)
    end

    if DoesEntityExist(SlungWeapon) then
        DeleteEntity(SlungWeapon)
    end

    HasWeaponSlung = false
    WeaponToSling = nil
    AmmoInWeapon = 0
    SlungWeapon = nil
    WeaponComponents = {}

    NotifyPlayer("Success", Config.Notification.weaponunslung, "success", 3500)
end)