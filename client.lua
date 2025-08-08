-- Standalone: Blocks shooting from the driver seat for everyone

local checkInterval = 200 -- milliseconds

Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)

        if veh ~= 0 and GetPedInVehicleSeat(veh, -1) == ped then
            -- Player is driver
            SetPlayerCanDoDriveBy(PlayerId(), false)
            DisablePlayerFiring(ped, true)
        else
            -- Player is not driver or not in vehicle
            SetPlayerCanDoDriveBy(PlayerId(), true)
        end

        Citizen.Wait(checkInterval)
    end
end)
