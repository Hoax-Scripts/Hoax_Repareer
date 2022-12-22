function FormatErrorMessage(msg)
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(167, 26, 26, 1); border-radius: 3px;"><i class="fas fa-user"></i> {0} <br> </div>',
        args = { "[⚠] " .. msg }
    })
end

function FormatMessage(msg)
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(26, 24, 25, 0.8); border-radius: 3px;"><i class="fas fa-user"></i> {0} <br> </div>',
        args = { "[🔨] " .. msg }
    })
end

function FormatSuccesMessage(msg)
    TriggerEvent('chat:addMessage', {
        template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(10, 190, 26, 1); border-radius: 3px;"><i class="fas fa-user"></i> {0} <br> </div>',
        args = { "[✔] " .. msg }
    })
end

function Sleep(time)
    return Citizen.Wait(time)
end

function run(time, text, color)
    SendNUIMessage({
        action = 'run',
        time = time,
        text = text,
        color =  color,
    })
end

function stop()
    SendNUIMessage({
        action = 'stop',
    })
end

RegisterNetEvent('hoax_bar:drawBar')
AddEventHandler('hoax_bar:drawBar', function(time, text, color)
	run(time, text, color)
end)