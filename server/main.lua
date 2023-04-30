----LOCAL----
if Config.framework == 'qb' then
   QBCore = exports['qb-core']:GetCoreObject()
elseif Config.framework == 'esx' then
   ESX = exports['es_extended']:getSharedObject()
end
local robbery = false
local pedd = nil
----EVENTS----
if GetCurrentResourceName() ~= 'dv-yacht' then
   print('[dv-yacht]: ^1You are not allowed to change the resource name ^0')
   return
end
print('[dv-yacht]: ^2Resource started successfuly^0')

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
      pedd = CreatePed(4, Config.startped, Config.startlocation.x, Config.startlocation.y, Config.startlocation.z, 180.0, true, true)
      SetPedArmour(pedd, 100)
      FreezeEntityPosition(pedd, true )
   end
end)

AddEventHandler('onResourceStop', function(resource)
   if resource == GetCurrentResourceName() then
      DeleteEntity(pedd)
   end
end)
if Config.framework == 'qb' then
   QBCore.Functions.CreateUseableItem(Config.giveitem, function(source, item)
       local Player = QBCore.Functions.GetPlayer(source)
       if  Player.Functions.RemoveItem(Config.giveitem,  1) then
        Player.Functions.AddMoney('cash', Config.cashroll)
       end
   end)
end
if Config.framework == 'esx' then
   ESX.RegisterUsableItem(Config.giveitem, function(playerId)
       local xPlayer = ESX.GetPlayerFromId(playerId)
       xPlayer.removeInventoryItem(Config.giveitem,  1)
       xPlayer.addMoney(Config.cashroll)
     end)
     
     
end
RegisterNetEvent('dv_yacht:server:start', function()
   local source = source
   local name = GetPlayerName(source)
   local license = GetPlayerIdentifier(source, 0)
   robbery = true
   TriggerClientEvent('dv_yacht:client:start1', -1)
   log("Robbery started", "**Steam name:** " .. name .. "\n**License:** " .. license, EE2F06)
end)

RegisterNetEvent('dv_yacht:server:boat1', function()
   TriggerClientEvent('dv_yacht:client:boat',-1)
 end)
RegisterNetEvent('dv_yacht:server:yacht:start', function()
   TriggerClientEvent('dv_yacht:client:yacht:start',-1)
   TriggerClientEvent('dv_yahct:client:propis',-1)
end)
RegisterNetEvent('dv_yacht:server:hacking', function(source)
   if Config.framework == 'qb' then
      local Player = QBCore.Functions.GetPlayer(source)
     if  Player.Functions.RemoveItem(Config.removeitem,  1) then
      TriggerClientEvent('dv_yacht:client:yacht:hack',source)
     end
  elseif Config.framework == 'esx' then
      local xPlayer = ESX.GetPlayerFromId(source)
      if xPlayer.getInventoryItem(Config.removeitem).count >= 1 then
      xPlayer.removeInventoryItem(Config.removeitem,  1)
      TriggerClientEvent('dv_yacht:client:yacht:hack',source)
      end
  end 
end)
RegisterNetEvent('dv_yacht:server:events', function(data)
    TriggerClientEvent('dv_yacht:client:money',-1,data)
end)
RegisterNetEvent('dv_yacht:server:GiveItem', function(source)
   local rand = math.random(Config.getMin, Config.getMax)
   local ped = GetPlayerPed(source)
   local playerCoords = GetEntityCoords(ped)
   local distance = #(playerCoords - vector3(-2094.4231, -1008.6356, 4.8843))
   local name = GetPlayerName(source)
   local license = GetPlayerIdentifier(source, 0)
   
   if distance < 60 then 
       if Config.framework == 'qb' then
           local Player = QBCore.Functions.GetPlayer(source)
           Player.Functions.AddItem(Config.giveitem, rand)
       elseif Config.framework == 'esx' then
           local xPlayer = ESX.GetPlayerFromId(source)
           xPlayer.addInventoryItem(Config.giveitem, rand)
       end 
   else
       local message = string.format(
           "Danger collecting item!\n\nPlayer is probably using cheats because distance is: %s\n\nSteam name: %s\n\nLicense: %s",
           distance,
           name,
           license
       )
       log("dv_yacht", message, "EE2F06")
   end
end)

RegisterServerEvent('dv_yacht:server:end', function()
   local src = source
   local name = GetPlayerName(src)
   local license = GetPlayerIdentifier(src, 0)
   local distance = #(GetEntityCoords(GetPlayerPed(src)) - Config.Locations.Start)
   if robbery then
       robbery = false
       TriggerClientEvent('dv_yacht:client:ending', -1)
       log("Robbery ended", "**Steam name:** " .. name .. "\n**License:** " .. license .. "\n**Distance from start point:** " .. distance, EE2F06)
   end
end)

RegisterNetEvent('dv_yacht:hack', function(data)
    if data == 'success' then
       TriggerClientEvent('dv_yacht:client:yacht:hack1','false')
    elseif data == 'fail' then
      TriggerClientEvent('dv_yacht:client:yacht:hack1','true')
    end
end)
RegisterNetEvent('dv_yacht:server:yacht:callpd', function()
   if robbery then
     if Config.alert == 'linden' then
       local data = {
         displayCode = '211',
         description = 'Robbery',
         isImportant = 0,
         recipientList = {'police'},
         length = '50000',
         infoM = 'fa-info-circle',
         info = 'Yacht Heist'
       }
       local dispatchData = {
         dispatchData = data,
         caller = 'Alarm',
         coords = vector3(-2083.6292, -1018.2227, 12.7819, 56.7514)
       }
       TriggerEvent('wf-alerts:svNotify', dispatchData)
     elseif Config.alert == 'QB' then
       local alertData = {
         title = "Yacht Heist",
         coords = {x = -2083.6292, y = -1018.2227, z = 12.7819},
         description = "Yacht is under robbery",
       }
       TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
     elseif Config.alert == 'CD' then
       TriggerClientEvent('cd_dispatch:AddNotification', -1, {
         job_table = {'police'},
         coords = vector3(-2083.6292, -1018.2227, 12.7819, 56.7514),
         title = '211 - Yacht',
         message = 'Yacht is being robbed',
         flash = 0,
         unique_id = tostring(math.random(0000000,9999999)),
         blip = {
           sprite = 455,
           scale = 1.2,
           colour = 3,
           flashes = false,
           text = '211 - Yacht',
           time = (5 * 60 * 1000),
           sound = 1,
         }
       })
     end
   end
 end)
 

RegisterNetEvent('dv_yacht:server:yacht:radio:pd', function()
   for i, coords in ipairs(Config.ped) do
      local pedModel = Config.peds[i % 2 + 1]
      local ped = CreatePed(4, pedModel, coords.x, coords.y, coords.z, 180.0, true, true)
         SetPedArmour(ped, Config.pedarmour)
         GiveWeaponToPed(ped, Config.pedweapon, 500, false, true)
   end
      TriggerEvent('dv_yacht:server:yacht:callpd')
end)

function log(name, message, color)
   local connect = {
      {
          ["color"] = color,
          ["title"] = "**".. name .."**",
          ["description"] = message,
          ["footer"] = {
          ["text"] = "DV-Scripts",
          },
      }
  }
PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode({username =  "dv-yacht", embeds = connect, avatar_url = "https://cdn.discordapp.com/icons/866965773623623691/d2013f3fb9135be5492dc98e45df0f4d.webp?size=128"}), { ['Content-Type'] = 'application/json' })
end
