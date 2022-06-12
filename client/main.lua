----BLIPS----
local blip = nil
local blip1 = nil
----LOCAL----
local spawned = true
local robbery = false
local yacht = false
local hacked = false
local props = true
local m1  = false
local m2 = false
----THREADS----
CreateThread(function ()
    while true do
      Wait(0)
      local sleep = true
      local ped = PlayerPedId()
      local player = GetEntityCoords(ped)
      local distance = #(player - Config.Locations.Start)
      local distance1 = #(player - Config.Locations.Ending)
      local distance2 = #(player - Config.Locations.Boat)
      local distance3 = #(player - Config.Locations.Yacht)
      local distance4 = #(player - Config.Locations.hacking)
      local distance5 = #(player - Config.Locations.Collect[1])
      local distance6 = #(player - Config.Locations.Collect[2])
      if robbery == false then 
        if distance < Config.distance then
          sleep = false
          Draw3DText(Config.Locations.Start.x, Config.Locations.Start.y, Config.Locations.Start.z+0.25,  Config.DrawTexts[1])
          DrawMarker(27, Config.Locations.Start.x, Config.Locations.Start.y, Config.Locations.Start.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
      if IsControlJustReleased(0, 38) then
          start()
          TriggerServerEvent('dv_yacht:server:props')
        end
      end
    end
    if robbery  then 
      if distance1 < Config.distance then
        sleep = false
        Draw3DText(Config.Locations.Ending.x, Config.Locations.Ending.y, Config.Locations.Ending.z+0.25,  Config.DrawTexts[6])
        DrawMarker(27, Config.Locations.Ending.x, Config.Locations.Ending.y, Config.Locations.Ending.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
        endstart()
    end
  end
      if distance2 < Config.distance then
        sleep = false
        Draw3DText(Config.Locations.Boat.x, Config.Locations.Boat.y, Config.Locations.Boat.z+0.25,  Config.DrawTexts[2])
        DrawMarker(27, Config.Locations.Boat.x, Config.Locations.Boat.y, Config.Locations.Boat.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
        TriggerServerEvent('dv_yacht:server:boat1')
        end
      end
    if distance3 < Config.distance and yacht then
        sleep = false
        Draw3DText(Config.Locations.Yacht.x, Config.Locations.Yacht.y, Config.Locations.Yacht.z+0.25,  Config.DrawTexts[3])
        DrawMarker(27, Config.Locations.Yacht.x, Config.Locations.Yacht.y, Config.Locations.Yacht.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
        TriggerServerEvent('dv_yacht:server:yacht:start')
          end
        end
    if distance4 < Config.distance and hacked then
          sleep = false
          Draw3DText(Config.Locations.hacking.x, Config.Locations.hacking.y, Config.Locations.hacking.z+0.25,  Config.DrawTexts[4])
          DrawMarker(27, Config.Locations.hacking.x, Config.Locations.hacking.y, Config.Locations.hacking.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
      TriggerServerEvent('dv_yacht:server:hacking',GetPlayerServerId(PlayerId()))
    end
      end
    if distance5 < Config.distance and m1 then
         sleep = false
         Draw3DText(Config.Locations.Collect[1].x, Config.Locations.Collect[1].y, Config.Locations.Collect[1].z+0.25,  Config.DrawTexts[5])
         DrawMarker(27, Config.Locations.Collect[1].x, Config.Locations.Collect[1].y, Config.Locations.Collect[1].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
         money()
         m1 = false
        end
     end
    if distance6 < Config.distance and m2 then
         sleep = false
         Draw3DText(Config.Locations.Collect[2].x, Config.Locations.Collect[2].y, Config.Locations.Collect[2].z+0.25,  Config.DrawTexts[5])
         DrawMarker(27, Config.Locations.Collect[2].x, Config.Locations.Collect[2].y, Config.Locations.Collect[2].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
         money()
         m2 = false    
          end
       end
    end
    if sleep then
            Wait(1000)
        end
    end    
end)

----EVENTS----
RegisterNetEvent('dv_yahct:client:propis', function()
  if props then 
    local trolly = CreateObject(Config.moneyprop,-2070.64, -1019.95, 4.88, true, false, false)
      SetEntityHeading(trolly, 151.96)
      FreezeEntityPosition(trolly, true)
    local trolly2 = CreateObject(Config.moneyprop,-2094.04, -1008.2, 4.88, true, false, false)
      SetEntityHeading(trolly2, 151.96)
      FreezeEntityPosition(trolly2, true)
    props = false
    end
end)
function endstart()
  if Config.progressbar == 'qb' then
  local QBCore = exports['qb-core']:GetCoreObject()
  QBCore.Functions.Progressbar(Config.progressbartext[1], Config.progressbartext[1], math.random(3000, 10000), false, true, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = true,
    disableCombat = true,
  }, {}, {}, {},function() 
    TriggerServerEvent('dv_yacht:server:end')
end) 
elseif Config.progressbar == 'esx' then
    exports["esx_progressbar"]:Progressbar(Config.progressbartext[1], math.random(3000, 10000),{
            FreezePlayer = true, 
            onFinish = function()
            TriggerServerEvent('dv_yacht:server:end')
        end})
    end
end
 
function money()
  if Config.progressbar == 'qb' then
  local QBCore = exports['qb-core']:GetCoreObject()
  QBCore.Functions.Progressbar(Config.progressbartext[2], Config.progressbartext[2], math.random(3000, 7000), false, true, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = true,
  }, {}, {}, {},function() 
    TriggerServerEvent('dv_yacht:server:GiveItem',GetPlayerServerId(PlayerId()))
  end)  
  elseif Config.progressbar == 'esx' then
        exports["esx_progressbar"]:Progressbar(Config.progressbartext[2], math.random(3000, 10000),{
              FreezePlayer = true, 
              onFinish = function()
                TriggerServerEvent('dv_yacht:server:GiveItem',GetPlayerServerId(PlayerId()))
              end})
    end 
end
RegisterNetEvent('dv_yacht:client:start1', function()
  robbery = true
end)
RegisterNetEvent('dv_yacht:client:ending', function()
  ending()
end)
RegisterNetEvent('dv_yacht:client:boat', function()
  vehicle()
  blips()
  yacht = true
end)
RegisterNetEvent('dv_yacht:client:yacht:start', function()
  blip = nil
  yacht = false
  hacked = true
end)
RegisterNetEvent('dv_yacht:client:yacht:hack', function()
  TriggerEvent("mhacking:show")
  TriggerEvent("mhacking:start",8,35,hacking)
end)
RegisterNetEvent('dv_yacht:client:yacht:callpd:success', function()
  TriggerServerEvent('dv_yacht:hack','success')
  Wait(Config.successpdtime)
  TriggerServerEvent('dv_yacht:server:yacht:radio:pd')
end)
RegisterNetEvent('dv_yacht:client:yacht:callpd:fail', function()
  TriggerServerEvent('dv_yacht:hack','fail')
  Wait(Config.failpdtime)
  TriggerServerEvent('dv_yacht:server:yacht:radio:pd')
end)
----Functions----
function start()
  local blipcoorcs = Config.Locations.Boat
  blip = AddBlipForCoord(blipcoorcs)
  SetBlipSprite(blip, 410)
  SetBlipAsShortRange(blip, true)
  SetBlipScale(blip, 0.8)
  SetBlipColour(blip, 0)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(Config.blips[1])
  EndTextCommandSetBlipName(blip)
  TriggerServerEvent('dv_yacht:server:start')
end
function ending()
RemoveBlip(blip)
RemoveBlip(blip1)
blip = nil
blip1 = nil
robbery = false
yacht = false
spawned = true
hacked = false
end
function blips()
  local blipcoorcs1 = Config.Locations.Yacht
  blip1 = AddBlipForCoord(blipcoorcs1)
  SetBlipSprite(blip1, 455)
  SetBlipAsShortRange(blip1, true)
  SetBlipScale(blip1, 0.8)
  SetBlipColour(blip1, 0)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(Config.blips[2])
  EndTextCommandSetBlipName(blip1)
end
function vehicle()
  if Config.vehicle == 'qb'and spawned then
    local QBCore = exports['qb-core']:GetCoreObject()
    QBCore.Functions.SpawnVehicle(Config.boat, function(veh)
        exports['LegacyFuel']:SetFuel(veh, 100)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        spawned = false
    end, vector3(-1183.87, -1019.24, 0.67), true)
  elseif Config.vehicle == 'esx'and spawned then
    local ESX = exports["es_extended"]:getSharedObject()
    ESX.Game.SpawnVehicle(Config.boat, vector3(-1183.87, -1019.24, 0.67), 360, function (vehicle)
      spawned = false
    end)
  end
end
function hacking(success)
	if success then
		TriggerEvent('mhacking:hide')
    TriggerEvent('dv_yacht:client:yacht:callpd:success')
    hacked = false
    m1 = true
    m2 = true
	else
		TriggerEvent('mhacking:hide')
    TriggerEvent('dv_yacht:client:yacht:callpd:fail')
    hacked = true
  end
end
--drawtext
function Draw3DText(x, y, z, text)
  SetTextScale(0.35, 0.35)
  SetTextFont(4)
  SetTextProportional(1)
  SetTextColour(255, 255, 255, 215)
  SetTextEntry("STRING")
  SetTextCentre(true)
  AddTextComponentString(text)
  SetDrawOrigin(x,y,z, 0)
  DrawText(0.0, 0.0)
  local factor = (string.len(text)) / 370
  DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
  ClearDrawOrigin()
end