Config = {}

-- List of roles to check
Config.RoleCheck = {
    "AFO",
    "ERPT",
    "CIV",
    "MANAGEMENT"
}

-- Ace Permissions relating to the different roles
Config.WeaponPermissions = {
    AFO = "weapons.afo",
    ERPT = "weapons.erpt",
    CIV = "weapons.civ",
    MANAGEMENT = "weapons.management",
    ADMIN = "weapons.all" -- all access (do not remove)
}

-- Webhook
Config.Webhook = "https://discord.com/api/webhooks/1381385368166862879/E1syN838HehyxtZ3nu1NGaJsQFg4k_6oMsefOKmcVizXxy0KdXaF-NTRwIzi_8_YdjBj"

-- Embed title
Config.Title = "Weapon Restriction Alert"

-- Embed colour
Config.Colour = 15158332

-- Notification Settings
Config.Notification = {
    Message = "has been removed due to insufficient permissions.",
    Title = "Weapon Removed"
}

-- Restricted weapon lists
Config.RestrictedWeapons = {
    AFO = {
        {name = "WEAPON_HALI", label = "Halligan"},
        {name = "WEAPON_FLASHBANG", label = "Flashbang"},
        {name = "WEAPON_PISTOL_MK2", label = "Glock 19"},
        {name = "WEAPON_SIGMCX", label = "SIG MCX"},
        {name = "WEAPON_C36", label = "G36"},
        {name = "WEAPON_L104A1 Baton Gun", label = "Baton Gun"},
        {name = "WEAPON_SIG716", label = "SIG 716"},
        {name = "WEAPON_TACTICALSNIPER", label = "Tactical Sniper"}
    },
    ERPT = {
        {name = "WEAPON_SPEEDCUFFS", label = "Handcuffs"},
        {name = "WEAPON_NIGHTSTICK", label = "Baton"},
        {name = "WEAPON_STUNGUN", label = "Taser 2"}
    },
    CIV = {
        {name = "WEAPON_PISTOL", label = "Glock 17"},
        {name = "WEAPON_COMPACTRIFLE", label = "Compact Rifle"},
        {name = "WEAPON_PISTOLXM3", label = "Pistol XM3"},
        {name = "WEAPON_SNSPISTOL", label = "SNS Pistol"},
        {name = "WEAPON_FLAREGUN", label = "Flare Gun"},
        {name = "WEAPON_MINISMG", label = "Mini SMG"},
        {name = "WEAPON_TEPISTOL", label = "Tactical Pistol"},
        {name = "WEAPON_MUSKET", label = "Musket"},
        {name = "WEAPON_PIPEBOMB", label = "Pipebomb"}
    },
    MANAGEMENT = {
        {name = "WEAPON_MINIGUN", label = "Minigun"},
        {name = "WEAPON_RPG", label = "RPG"},
        {name = "WEAPON_GRENADELAUNCHER", label = "Grenade Launcher"},
        {name = "WEAPON_GRENADELAUNCHER_SMOKE", label = "Smoke Grenade Launcher"},
        {name = "WEAPON_RAILGUN", label = "Railgun"},
        {name = "WEAPON_HOMINGLAUNCHER", label = "Homing Launcher"},
        {name = "WEAPON_COMPACTLAUNCHER", label = "Compact Launcher"},
        {name = "WEAPON_RAYMINIGUN", label = "Ray Minigun"},
        {name = "WEAPON_GRENADE", label = "Grenade"},
        {name = "WEAPON_RAYCARBINE", label = "Ray Carbine"},
        {name = "WEAPON_RAYPISTOL", label = "Ray Pistol"},
        {name = "WEAPON_APPPISTOL", label = "AP Pistol"},
        {name = "WEAPON_ADVANCEDRIFLE", label = "Advanced Rifle"},
        {name = "WEAPON_ASSAULTRIFLE_MK2", label = "Assault Rifle Mk II"},
        {name = "WEAPON_SMG", label = "MP5"},
        {name = "WEAPON_SPECIALCARBINE_MK2", label = "G36"},
        {name = "WEAPON_ASSAULTSMG", label = "Assault SMG"},
        {name = "WEAPON_ASSAULTSHOTGUN", label = "Assault Shotgun"},
        {name = "WEAPON_MARKSMANRIFLE_MK2", label = "Hk G28"},
        {name = "WEAPON_SNIPERRIFLE", label = "M24 SWS"},
        {name = "WEAPON_BZGAS", label = "BZ Gas"},
        {name = "WEAPON_BULLPUPRIFLE", label = "Bullpup Rifle"},
        {name = "WEAPON_BULLPUPRIFLE_MK2", label = "Bullpup Rifle Mk II"},
        {name = "WEAPON_BULLPUPSHOTGUN", label = "Bullpup Shotgun"},
        {name = "WEAPON_COMBATMG", label = "Combat MG"},
        {name = "WEAPON_COMBATMG_MK2", label = "Combat MG Mk II"},
        {name = "WEAPON_COMBATPDW", label = "Combat PDW"},
        {name = "WEAPON_COMPACTGRENADELAUNCHER", label = "Compact Grenade Launcher"},
        {name = "WEAPON_GRENADE", label = "Grenade"},
        {name = "WEAPON_GRENADELAUNCHER", label = "Grenade Launcher"},
        {name = "WEAPON_GRENADELAUNCHERSMOKE", label = "Smoke Grenade Launcher"},
        {name = "WEAPON_GUSENBERG", label = "Gusenberg Sweeper"},
        {name = "WEAPON_HEAVYPISTOL", label = "Heavy Pistol"},
        {name = "WEAPON_HEAVYSHOTGUN", label = "Heavy Shotgun"},
        {name = "WEAPON_HEAVYSNIPER", label = "Heavy Sniper"},
        {name = "WEAPON_HEAVYSNIPER_MK2", label = "Heavy Sniper Mk II"},
        {name = "WEAPON_HOMINGLAUNCHER", label = "Homing Launcher"},
        {name = "WEAPON_MG", label = "MG"},
        {name = "WEAPON_MARKSMANPISTOL", label = "Marksman Pistol"},
        {name = "WEAPON_MARKSMANRIFLE", label = "Marksman Rifle"},
        {name = "WEAPON_MINIGUN", label = "Minigun"},
        {name = "WEAPON_NIGHTVISION", label = "Night Vision"},
        {name = "WEAPON_PARACHUTE", label = "Parachute"},
        {name = "WEAPON_PISTOL50", label = "Pistol .50"},
        {name = "WEAPON_RPG", label = "RPG"},
        {name = "WEAPON_RAILGUN", label = "Railgun"},
        {name = "WEAPON_REVOLVER", label = "Revolver"},
        {name = "WEAPON_REVOLVER_MK2", label = "Revolver Mk II"},
        {name = "WEAPON_SMG_MK2", label = "SMG Mk II"},
        {name = "WEAPON_SNSPISTOL_MK2", label = "SNS Pistol Mk II"},
        {name = "WEAPON_AUTOSHOTGUN", label = "Auto Shotgun"},
        {name = "WEAPON_DOUBLEACTION", label = "Double-Action Revolver"},
        {name = "WEAPON_MICROSMG", label = "Micro SMG"},
        {name = "WEAPON_PUMPSHOTGUN", label = "Pump Shotgun"},
        {name = "WEAPON_PUMPSHOTGUN_MK2", label = "Pump Shotgun Mk II"},
        {name = "WEAPON_SAWNOFFSHOTGUN", label = "Sawed-Off Shotgun"},
        {name = "WEAPON_BZGAS", label = "BZ Gas"},
        {name = "WEAPON_FLARE", label = "Flare"},
        {name = "WEAPON_PETROLCAN", label = "Jerry Can"},
        {name = "WEAPON_PROXMINE", label = "Proximity Mine"},
        {name = "WEAPON_PRECISIONRIFLE", label = "Percision Rifle"},
        {name = "WEAPON_MILITARYRIFLE", label = "Military Rifle"},
        {name = "WEAPON_HEAVYRIFLE", label = "Heavy Rifle"},
        {name = "WEAPON_TACTICALRIFLE", label = "Tactical Rifle"},
        {name = "WEAPON_DBSHOTGUN", label = "Shotgun"},
        {name = "WEAPON_COMBATSHOTGUN", label = "Combat Shotgun"},
        {name = "WEAPON_EMPLAUNCHER", label = "EMP Launcher"},
        {name = "WEAPON_RAILGUN", label = "Railgun"},
        {name = "WEAPON_FIREWORK", label = "Firework"},
        {name = "WEAPON_RAILGUNXM3", label = "Railgun"},
        {name = "WEAPON_SNSPISTOL_MK2", label = "SNS Pistol"},
        {name = "WEAPON_VINTAGEPISTOL", label = "Vintage Pistol"},
        {name = "WEAPON_CERAMICPISTOL", label = "Ceramic Pistol"},
        {name = "WEAPON_NAVYREVOLVER", label = "Navy Revolver"},
        {name = "WEAPON_GADGETPISTOL", label = "Gadget Pistol"},
        {name = "WEAPON_STICKYBOMB", label = "Sticky Bomb"},
        {name = "WEAPON_SMOKEGRENADE", label = "Tear Gas"},
        {name = "WEAPON_FIREEXTINGUISHER", label = "Fire Extinguisher"},
        {name = "WEAPON_FERTILIZERCAN", label = "Fertilizer Can"},
        {name = "WEAPON_HAZARDCAN", label = "Hazard Can"},
        {name = "WEAPON_PETROLCAN", label = "Petrol Can"},
        {name = "WEAPON_ACIDPACKAGE", label = "Acid Package"},
        {name = "WEAPON_BOTTLE", label = "Bottle"},
        {name = "WEAPON_DAGGER", label = "Dagger"},
        {name = "WEAPON_HATCHET", label = "Hatchet"},
        {name = "WEAPON_BATTLEAXE", label = "Battle Axe"},
        {name = "WEAPON_STONE_HATCHET", label = "Stone Hatchet"},
        {name = "WEAPON_CANDYCANE", label = "Candy Cane"},
        {name = "WEAPON_M4", label = "M4 Rifle"},
        {name = "WEAPON_MACHINEPISTOL", label = "Machine Pistol"},
        {name = "WEAPON_ASSAULTRIFLE", label = "Assault Rifle"}
    }
}    