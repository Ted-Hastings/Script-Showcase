Config = {}

-- Marker and Interaction Settings
Config.MarkerCoords = vector3(452.0411, -979.9375, 29.6896)
Config.MarkerDrawDistance = 20.0
Config.MarkerInteractDistance = 1.5
Config.MarkerInteractionKeybind = 51
Config.MarkerHelpText = "Press ~INPUT_CONTEXT~ to open the Armoury."
Config.MarkerLabel3D = "Sinner Street Police Station Armoury"

-- Menu title and subtitle
Config.MenuTitle = "Armoury"
Config.MenuSubtitle = "~b~Sinner Street Police Station Armoury"

-- Order in which your menus will be displayed
Config.MenuOrder = {
    "afoarmoury",
    "sroarmoury"
}

-- ACE Permissions for the armoury submenus
Config.AllowedMenus = {
    afoarmoury = {
        acePermissions = {
            "armoury.afo",
            "armoury.sro",
            "armoury.management"
        },
        loadoutKey = "AFO"
    },
    sroarmoury = {
        acePermissions = {
            "armoury.sro",
            "armoury.management"
        },
        loadoutKey = "SRO"
    }
}

-- Weapon loadouts (keys should match loadoutKey values above)
Config.Loadouts = {
    AFO = {
        name = "Authorised Firearms Officer",
        weapons = {
            { name = "Handcuffs", weaponHash = "WEAPON_SPEEDCUFFS", components = {} },
            { name = "Baton", weaponHash = "WEAPON_NIGHTSTICK", components = {} },
            { name = "Halligan", weaponHash = "WEAPON_HALI", components = {} },
            { name = "Flashbang", weaponHash = "WEAPON_FLASHBANG", components = {} },
            { name = "Taser 2", weaponHash = "WEAPON_STUNGUN", components = {} },
            { name = "Glock 19", weaponHash = "WEAPON_PISTOL_MK2", components = {} },
            { name = "G36", weaponHash = "WEAPON_C36", components = {"COMPONENT_MARKOMODSC36_GRIP_03", "COMPONENT_MARKOMODSC36_BARREL_04", "COMPONENT_MARKOMODSC36_CLIP_04", "COMPONENT_MARKOMODSC36_SCOPE_05"} },
            { name = "SIG MCX", weaponHash = "WEAPON_SIGMCX", components = {"COMPONENT_SIGMCX_SCOPE", "COMPONENT_AT_AR_FLSH"} },
            { name = "Baton Gun", weaponHash = "WEAPON_L104A1", components = {} }
        }
    },
    SRO = {
        name = "Specialists Rifles Officer",
        weapons = {
            { name = "SIG 716", weaponHash = "WEAPON_SIG716", components = {} },
            { name = "Tactical Sniper", weaponHash = "WEAPON_TACTICALSNIPER", components = {"COMPONENT_MARKOMODS_TACTICALSNIPER_BIPOD", "COMPONENT_MARKOMODS_SHARED_ZOOMSCOPE_04"} }
        }
    }
}