---Coded by Jeremiah:0420
RegisterCommand("bcso", function(source,args,rawCommand)
    spawnped("s_m_y_sheriff_01")
    giveWeapon("weapon_combatpistol")
    giveWeapon("weapon_tazer")
    giveWeapon("weapon_carbinerifle")
    giveWeapon("weapon_flare")
    giveWeapon("weapon_pumpshotgun")
    giveWeapon("weapon_stungun")
    DisplayNotification("Loadout changed to BCSO.")
end, false)


---Spawn Model Code
function spawnped(pedhash)
    local ped = PlayerId()
    local model = GetHashKey(pedhash)
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(ped, model)
    SetModelAsNoLongerNeeded(model)
end

---Give Weapon Code
function giveWeapon(gunhash)
    GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(gunhash), 999, false)
    SetPedArmour(GetPlayerPed(-1), 100)
end

function DisplayNotification( text )
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
    DrawNotification( false, false )
end