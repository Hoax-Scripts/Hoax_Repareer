local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function GetOnlineJob(source, jobStr)
    local xPlayers = ESX.GetPlayers()
    local xPlayer = ESX.GetPlayerFromId(source)
    
    local count = 0;
    for i = 1, #xPlayers, 1 do
        if xPlayer then
            if xPlayer.job.name == jobStr then
                count = count + 1
                return count
            end
        end
    end
end


