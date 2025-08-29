Config = {}

-- List of allowed weapons, all base weapon's can be found here: https://docs.fivem.net/docs/game-references/weapon-models/ simply add the weapon's Hash to the list.
Config.AllowedWeapons = {
    [`WEAPON_C36`] = { components = {"COMPONENT_MARKOMODSC36_GRIP_03", "COMPONENT_MARKOMODSC36_BARREL_04", "COMPONENT_MARKOMODSC36_CLIP_04", "COMPONENT_MARKOMODSC36_SCOPE_05"} },
    [`WEAPON_SIGMCX`] = { components = {"COMPONENT_SIGMCX_SCOPE", "COMPONENT_AT_AR_FLSH"} },
    [`WEAPON_L104A1`] = { components = {} },
    [`WEAPON_SNIPERRIFLE`] = { components = {} },
    [`WEAPON_SPECIALCARBINE`] = { components = {"COMPONENT_AT_AR_FLSH", "COMPONENT_AT_SCOPE_MEDIUM", "COMPONENT_AT_AR_AFGRIP"} }
}

-- Command configuration
Config.Command = {
    sling = "sling",
    unsling = "unsling"
}

-- Weapon position, change y to lower or lift the weapon, change x to move it forward or backwards, change z to move it left or right
Config.SlingPosition = {
    y = 0.10,
    x = 0.24,
    z = 0.-0.02,
}

-- Notification type: "ShowInfo" is the defult notification system, "NotifySystem" is our custom notification system (requiring our NotifySystem resource)
Config.NotificationType = "ShowInfo"

-- Notification messages
Config.Notification = {
    alreadyslung = "A weapon is already slung! Use /unsling to get it back.",
    cannotslung = "This weapon cannot be slung!",
    weaponslung = "Weapon slung successfully!",
    noweaponslung = "No weapon is slung!",
    weaponunslung = "Weapon unslung!"
}

return Config