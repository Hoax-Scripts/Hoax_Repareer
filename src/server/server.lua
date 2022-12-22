local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function PayRepair(source, price)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer.getMoney() < price or xPlayer.getMoney() == nil then
        if xPlayer.getAccount("bank").money >= price then
            xPlayer.removeAccountMoney('bank', price)
        end
    else
        xPlayer.removeMoney(price)
    end
end

function SendRepairWebhook(message)
    local logs = Config.Logs
    if logs.webhook == "" then return print("[Hoax's Scripts] | Please enter a valid webhook url.") end

    local embed = {
        {
            title = logs.embed.title,
            description = message,
            color = logs.embed.color,
            footer = {
                text = logs.embed.footer,
            },
        }
    }

  PerformHttpRequest(logs.webhook, 
  function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' }) 
end
