--[[
Copyright (c) 2022, Sandy Development
All rights reserved.
This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. 
--]]

RegisterNetEvent('clearallvehicles', function()
	ClearAreaOfVehicles(0.0, 0.0, 0.0, 500000.0, false, false, false, false, false)
end)

CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, true)
        if IsVehicleSeatFree(veh, -1) and DoesEntityExist(veh) then
            SetEntityAsNoLongerNeeded(veh)
        end
    	Wait(3000)
    end
end)
