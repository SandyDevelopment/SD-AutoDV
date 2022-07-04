--[[
Copyright (c) 2022, Sandy Development
All rights reserved.
This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. 
--]]

local webhook_url = "WEBHOOK_URL_HERE"

RegisterCommand("autodv", function(source) 
    local src = source
    if IsPlayerAceAllowed(src, "sd_autodv") then
        TriggerClientEvent('chatMessage', -1, '[COMPOUND] ^5Our minds think all vehicles will clear in 10 seconds.')
        Wait(5000)
        TriggerClientEvent('chatMessage', -1, '[COMPOUND] ^5Our minds think all vehicles will clear in 5 seconds.')
        Wait(5000)
        TriggerClientEvent('chatMessage', -1, '[COMPOUND] ^5Our minds think all vehicles will clear now.')
        Wait(0)
        TriggerClientEvent("clearallvehicles", src)
        TriggerEvent('SD-AutoDV:Logging', webhook_url, SystemName, '```css\n' .. GetPlayerName(src) .. ' triggered autodv```', SystemAvatar, false)
    else
        TriggerClientEvent('chatMessage', src, "[^3SD-AutoDV^0] Access Denied")
    end
end)

RegisterServerEvent('SD-AutoDV:Logging')
AddEventHandler('SD-AutoDV:Logging', function(Webhook, Name, Message, External, Source, TTS)
	PerformHttpRequest(Webhook, function(Error, Content, Head) end, 'POST', json.encode({username = "SD-AutoDV", content = Message, tts = TTS}), {['Content-Type'] = 'application/json'})
end)