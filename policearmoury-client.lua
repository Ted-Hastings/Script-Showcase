local _menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu(Config.MenuTitle, Config.MenuSubtitle)
_menuPool:Add(mainMenu)

local takenWeapons = {}

local function hasWeapon(weaponHash)
    return HasPedGotWeapon(PlayerPedId(), GetHashKey(weaponHash), false)
end

local function giveWeapon(weaponHash, components)
    GiveWeaponToPed(PlayerPedId(), GetHashKey(weaponHash), 100, false, true)
    for _, comp in ipairs(components) do
        GiveWeaponComponentToPed(PlayerPedId(), GetHashKey(weaponHash), GetHashKey(comp))
    end
    table.insert(takenWeapons, weaponHash)
end

local function removeWeapon(weaponHash, components)
    RemoveWeaponFromPed(PlayerPedId(), GetHashKey(weaponHash))
    for _, comp in ipairs(components) do
        RemoveWeaponComponentFromPed(PlayerPedId(), GetHashKey(weaponHash), GetHashKey(comp))
    end
    for i, v in ipairs(takenWeapons) do
        if v == weaponHash then
            table.remove(takenWeapons, i)
            break
        end
    end
end

local function updateWeaponItems(submenu, weapons, restoreIndex)
    submenu:Clear()

    for idx, weapon in ipairs(weapons) do
        local weaponHash = weapon.weaponHash
        local weaponName = weapon.name
        local components = weapon.components or {}

        local label = hasWeapon(weaponHash) and ("Return " .. weaponName) or ("Take " .. weaponName)
        local item = NativeUI.CreateItem(label, "")

        item.Activated = function(sender, selectedItem)
            if hasWeapon(weaponHash) then
                removeWeapon(weaponHash, components)
            else
                giveWeapon(weaponHash, components)
            end
            updateWeaponItems(submenu, weapons, idx)
        end

        submenu:AddItem(item)
    end

    if restoreIndex and restoreIndex <= #submenu.Items then
        submenu:CurrentSelection(restoreIndex - 1)
    end
end

local function createLoadoutMenu(menu, loadoutKey)
    local loadout = Config.Loadouts[loadoutKey]
    if not loadout then return nil end

    local submenu = _menuPool:AddSubMenu(menu, loadout.name)
    updateWeaponItems(submenu, loadout.weapons)
    return submenu
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        _menuPool:ProcessMenus()

        local playerCoords = GetEntityCoords(PlayerPedId())
        local distance = #(playerCoords - Config.MarkerCoords)

        if distance < Config.MarkerDrawDistance then
            DrawMarker(1, Config.MarkerCoords.x, Config.MarkerCoords.y, Config.MarkerCoords.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.3, 255, 140, 0, 150, false, false, 2, false, nil, nil, false)
            DrawText3D(Config.MarkerCoords.x, Config.MarkerCoords.y, Config.MarkerCoords.z + 1.5, Config.MarkerLabel3D)

            if distance < Config.MarkerInteractDistance then
                DisplayHelpText(Config.MarkerHelpText)
                if IsControlJustReleased(0, Config.MarkerInteractionKeybind) then
                    mainMenu:Visible(not mainMenu:Visible())
                    TriggerServerEvent("armoury:checkRolePoliceArmoury")
                end
            end
        end
    end
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px, py, pz) - vector3(x, y, z))
    local scale = 0.35
    local scaledScale = scale / dist * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    scaledScale = scaledScale * fov

    SetTextScale(0.0, scaledScale)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(_x, _y)
end

function DisplayHelpText(text)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

RegisterNetEvent("armoury:returnCheckPoliceArmoury")
AddEventHandler("armoury:returnCheckPoliceArmoury", function(permissions)
    mainMenu:Clear()
    for _, menuKey in ipairs(Config.MenuOrder) do
        if permissions[menuKey] then
            local loadoutKey = Config.AllowedMenus[menuKey].loadoutKey
            createLoadoutMenu(mainMenu, loadoutKey)
        end
    end
    _menuPool:RefreshIndex()
end)