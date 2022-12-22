local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("debug", function(source, args)
    if not Config.Debug.enabled then return FormatErrorMessage("Debug staat uit.") end

   local subCommand = args[1]
   if not subCommand then
        FormatErrorMessage("Je hebt geen argumenten meegegeven. Probeer het volgende: (/debug sethealth health)")
   end

   if subCommand == "sethealth" then
        local health = args[2]
        SetVehicleHealth(health)
   end
end)

function SetVehicleHealth(health)
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)
    
    SetVehicleEngineHealth(vehicle, health)
end
