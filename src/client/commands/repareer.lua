local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand(Config.command.name, function()
    local ped = GetPlayerPed(-1)
    local coords = GetEntityCoords(ped)
    
    if not IsPedInAnyVehicle(ped, false) then return FormatErrorMessage("Je moet een voertuig besturen voordat je deze commando kan uitvoeren.") end
    
    local vehicle = GetVehiclePedIsIn(ped)
    local health = GetVehicleEngineHealth(vehicle)

    local price = CalculatePrice(health)
    
    for i, v in pairs(Config.Locations) do
        local distance = #(vector3(coords.x, coords.y, coords.z) - vector3(v.Pos.x, v.Pos.y, v.Pos.z))
        
        if distance < 100 then
            ESX.TriggerServerCallback("hoax_repareer:payRepair", function(paid) 
                if not paid then return end
                Repair(ped, price)
            end, price)
        end
    end
end)

function Repair(ped, price)
    StartEmote(ped, price)
    SetVehicleProperties(ped)
end

function SetVehicleProperties(vehicle)
    SetVehicleFixed(vehicle)
    SetVehicleDeformationFixed(vehicle)
    SetVehicleUndriveable(vehicle, false)
    SetVehicleEngineOn(vehicle, true, true)
end

function DrawRepairBar(time, text, color)
    return TriggerEvent('hoax_bar:drawBar', time, text, color, function()
	end)
end

function StartEmote(ped, price)
    local vehicle = GetVehiclePedIsIn(ped, false)
    TaskLeaveVehicle(ped, vehicle)
    Sleep(2000)
    DrawRepairBar(10, "Aan het repareren", "#1e81b0")
    
    if not IsPedInAnyVehicle(ped, false) then
        TaskStartScenarioInPlace(ped, 'PROP_HUMAN_BUM_BIN', 0, true)
    end
    
    Sleep(10000)
    FormatSuccesMessage("Je hebt je voertuig succesvol gemaakt voor de prijs van:  €" .. price .. " euro.")
    ClearPedTasksImmediately(ped)
    SetVehicleProperties(vehicle)
end

