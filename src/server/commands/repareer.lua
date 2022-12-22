local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback("hoax_repareer:payRepair", function(source, cb, price)
    if price == nil then return end

    local player = ESX.GetPlayerFromId(source)

    local msg = "**" .. player.getName() .. "** heeft succesvol zijn autogemaakt voor: **€" .. price .. "** .Bij een van de pimp shops."

    if Config.Mechanic.required then
        if GetOnlineJob(source, "mechanic") < Config.Mechanic.onlineLimit then
            PayRepair(source, price)
            SendRepairWebhook(msg)
            cb(true)
        else
            FormatErrorMessage("Er zijn teveel ANWB online. Bel de Wegenwacht via je telefoon.")
            cb(false)
        end
    else
        SendRepairWebhook(msg)
        PayRepair(source, price)
        cb(true)
    end
 end)
