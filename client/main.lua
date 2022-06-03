----BLIPS----
local blip = nil
local blip1 = nil
----LOCAL----
local robbery = false
local yacht = false
local hacked = false
local props = true
----THREADS----
CreateThread(function ()
    while true do
      Wait(0)
      if robbery == false then 
      local ped = PlayerPedId()
      local player = GetEntityCoords(ped)
      local distance = #(player - Config.Locations.Start)
      local sleep = true
    if distance < Config.distance then
        sleep = false
        Draw3DText(Config.Locations.Start.x, Config.Locations.Start.y, Config.Locations.Start.z+0.25,  Config.DrawTexts[1])
          DrawMarker(27, Config.Locations.Start.x, Config.Locations.Start.y, Config.Locations.Start.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
            TriggerEvent('dv_yacht:client:start')
            TriggerServerEvent('dv_yacht:server:props')
        end
      end
    if sleep then
            Wait(1000)
          end
       end
    end    
end)
CreateThread(function ()
    while true do
      Wait(0)
      local sleep = true
      if robbery == true then
      local ped = PlayerPedId()
      local player = GetEntityCoords(ped)
      local pos = Config.Locations.Boat
      local distance = #(player - pos)
    if distance < Config.distance then
        sleep = false
        Draw3DText(pos.x, pos.y, pos.z+0.25,  Config.DrawTexts[2])
        DrawMarker(27, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
            TriggerEvent('dv_yacht:client:boat')
            TriggerServerEvent('dv_yacht:server:boat1')
          end
        end
    end
    if sleep then
          Wait(1000)
      end
    end
end)
CreateThread(function ()
    while true do
      Wait(0)
      local sleep = true
      if robbery == true then
      if yacht == true then
      local ped = PlayerPedId()
      local player = GetEntityCoords(ped)
      local pos = Config.Locations.Yacht
      local distance = #(player - pos)
    if distance < Config.distance then
        sleep = false
        Draw3DText(pos.x, pos.y, pos.z+0.25,  Config.DrawTexts[3])
          DrawMarker(27, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
            TriggerServerEvent('dv_yacht:server:yacht:start')
            end
          end
        end
      end
    if sleep then
                Wait(1000)
        end
    end
end)
CreateThread(function ()
  while true do
    Wait(0)
    local sleep = true
  if robbery == true then
   if hacked == true then
    local ped = PlayerPedId()
    local player = GetEntityCoords(ped)
    local pos = Config.Locations.hacking
    local distance = #(player - pos)
  if distance < Config.distance then
      sleep = false
      Draw3DText(pos.x, pos.y, pos.z+0.25,  Config.DrawTexts[4])
        DrawMarker(27, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
  if IsControlJustReleased(0, 38) then
TriggerServerEvent('dv_yacht:server:hacking')
       end
     end
  end
end
  if sleep then
        Wait(1000)
      end
  end
end)
CreateThread(function ()
while true do
  Wait(0)
  local sleep = true
    if robbery  then
  for k, collect in pairs(Config.Locations.Collect) do 
  local ped = PlayerPedId()
  local player = GetEntityCoords(ped)
  local pos = collect
  local distance = #(player - pos)
    if distance < Config.distance then
    sleep = false
    Draw3DText(pos.x, pos.y, pos.z+0.25,  Config.DrawTexts[5])
      DrawMarker(27, pos.x, pos.y, pos.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
    if IsControlJustReleased(0, 38) then
  money()  
      end
   end
  end
end
if sleep then
          Wait(1000)
      end
   end
end)

CreateThread(function ()
  while true do
    Wait(0)
    local sleep = true
  if robbery == true then
    local ped = PlayerPedId()
    local player = GetEntityCoords(ped)
    local distance = #(player - Config.Locations.Ending)
  if distance < Config.distance then
      sleep = false
      Draw3DText(Config.Locations.Ending.x, Config.Locations.Ending.y, Config.Locations.Ending.z+0.25,  Config.DrawTexts[6])
        DrawMarker(27, Config.Locations.Ending.x, Config.Locations.Ending.y, Config.Locations.Ending.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001,2.0001,0.5001,0,155,255, 100, false, true, 2, false, false, false, false)
  if IsControlJustReleased(0, 38) then
  TriggerEvent('dv_yacht:client:endstart')
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
RegisterNetEvent('dv_yacht:client:endstart', function()
  if Config.framework == 'qb' then
    local QBCore = exports['qb-core']:GetCoreObject()
  QBCore.Functions.Progressbar(Config.progressbartext[1], Config.progressbartext[1], math.random(3000, 10000), false, true, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = true,
    disableCombat = true,
  }, {}, {}, {},function() 
    TriggerServerEvent('dv_yacht:server:end')
  end) 
end
  if Config.framework == 'esx' then
    exports["esx_progressbar"]:Progressbar(Config.progressbartext[1], math.random(3000, 10000),{
            FreezePlayer = true, 
            onFinish = function()
              TriggerServerEvent('dv_yacht:server:end')
        end})
    end
end)
function money()
  if Config.framework == 'qb' then
    local QBCore = exports['qb-core']:GetCoreObject()
  QBCore.Functions.Progressbar(Config.progressbartext[2], Config.progressbartext[2], math.random(3000, 7000), false, true, {
    disableMovement = true,
    disableCarMovement = false,
    disableMouse = false,
    disableCombat = true,
  }, {}, {}, {},function() 
    TriggerServerEvent('dv_yacht:server:GiveItem')
    end)  
end
      if Config.framework == 'esx' then
        exports["esx_progressbar"]:Progressbar(Config.progressbartext[2], math.random(3000, 10000),{
                FreezePlayer = true, 
                onFinish = function()
                  TriggerServerEvent('dv_yacht:server:GiveItem')
          end})
    end 
end

RegisterNetEvent('dv_yacht:client:start', function()
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
end)
RegisterNetEvent('dv_yacht:client:start1', function()
  robbery = true
end)
RegisterNetEvent('dv_yacht:client:ending', function()
RemoveBlip(blip)
RemoveBlip(blip1)
blip = nil
blip1 = nil
robbery = false
yacht = false
end)
RegisterNetEvent('dv_yacht:client:vehicle', function()
  if Config.framework == 'qb' then
      local QBCore = exports['qb-core']:GetCoreObject()
      QBCore.Functions.SpawnVehicle(Config.boatqb, function(veh)
          exports['LegacyFuel']:SetFuel(veh, 100)
          TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
      end, vector3(-1183.87, -1019.24, 0.67), true)
  end
  end)
RegisterNetEvent('dv_yacht:client:boat', function()
  TriggerServerEvent('dv_yacht:server:boat')
  local blipcoorcs1 = Config.Locations.Yacht
  blip1 = AddBlipForCoord(blipcoorcs1)
  SetBlipSprite(blip1, 455)
  SetBlipAsShortRange(blip1, true)
  SetBlipScale(blip1, 0.8)
  SetBlipColour(blip1, 0)
  BeginTextCommandSetBlipName("STRING")
  AddTextComponentString(Config.blips[2])
  EndTextCommandSetBlipName(blip1)
end)
RegisterNetEvent('dv_yacht:client:boat1', function()
  yacht = true
end)
RegisterNetEvent('dv_yacht:client:yacht:start', function()
  blip = nil
  yacht = false
  hacked = true
end)

RegisterNetEvent('dv_yacht:client:yacht:hack')
AddEventHandler('dv_yacht:client:yacht:hack', function()
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
function hacking(success)
	if success then
		TriggerEvent('mhacking:hide')
    TriggerEvent('dv_yacht:client:yacht:callpd:success')
    hacked = false
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