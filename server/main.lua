----LOCAL----
local robbery = false
local money = false
local spawned = true
local pedd = true
----EVENTS----
if GetCurrentResourceName() ~= 'dv_yacht' then
   print('[dv-yacht]: ^1You are not allowed to change the resource name ^0')
   return
end
print('[dv-yacht]: ^2Resource started successfuly^0')

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
      TriggerEvent('dv_yacht:server:ped')
   end
end)
RegisterNetEvent('dv_yacht:server:props', function()
TriggerClientEvent('dv_yahct:client:propis',-1)
 end)
RegisterNetEvent('dv_yacht:server:ped', function()
   if pedd == true then
   local d12 = Config.startlocation
   local ped = 0
      ped = CreatePed(4, Config.startped, d12.x, d12.y, d12.z, 180.0, true, true)
      SetPedArmour(ped, 100)
      FreezeEntityPosition(ped, true )
      pedd = false
   end
end)
RegisterNetEvent('dv_yacht:server:start', function()
   robbery = true
TriggerClientEvent('dv_yacht:client:start1',-1)
local name = GetPlayerName(source)
local license = GetPlayerIdentifier(source,0)
local id1 = GetPlayerIdentifier(source,1)
local id2 = GetPlayerIdentifier(source,2)
local id3 = GetPlayerIdentifier(source,4)
TriggerEvent('dv_yacht:server:log',"Robbery started","**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Discord:".."**"..' '..id1.."\n".."**".."Fivem:"..' '.."**"..id2.."\n".."**".."IP:"..' '.."**"..id3,EE2F06)
end)
RegisterNetEvent('dv_yacht:server:boat1', function()
  TriggerClientEvent('dv_yacht:client:boat1',-1)
 end)
RegisterNetEvent('dv_yacht:server:boat', function()
   local name = GetPlayerName(source)
   local license = GetPlayerIdentifier(source,0)
   local id1 = GetPlayerIdentifier(source,1)
   local id2 = GetPlayerIdentifier(source,2)
   local id3 = GetPlayerIdentifier(source,4)
   if robbery and spawned then
      if Config.framework == 'esx' then
      CreateVehicle(Config.boat,-1183.87, -1019.24, 0.67, 1.0, true, true)
      TriggerEvent('dv_yacht:server:log',"Boat spawned","**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Discord:".."**"..' '..id1.."\n".."**".."Fivem:"..' '.."**"..id2.."\n".."**".."IP:"..' '.."**"..id3,EE2F06)
      spawned = false
      end
   if Config.framework == 'qb' then
      TriggerClientEvent('dv_yacht:client:vehicle',source)
      TriggerEvent('dv_yacht:server:log',"Boat spawned","**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Discord:".."**"..' '..id1.."\n".."**".."Fivem:"..' '.."**"..id2.."\n".."**".."IP:"..' '.."**"..id3,EE2F06)
      spawned = false
   end
end
end)
RegisterNetEvent('dv_yacht:server:yacht:start', function()
   TriggerClientEvent('dv_yacht:client:yacht:start',-1)
end)
RegisterNetEvent('dv_yacht:server:hacking', function()
   if robbery then
      local src = source
      if Config.framework == 'qb' then
         local QBCore = exports['qb-core']:GetCoreObject()
      local Player = QBCore.Functions.GetPlayer(src)
         if Player.Functions.RemoveItem(Config.removeitem, 1) then
            TriggerClientEvent('dv_yacht:client:yacht:hack',src)
            money = true
         end
     end
   end
   if Config.framework == 'esx' then
   local ESX = exports["es_extended"]:getSharedObject()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.removeInventoryItem(Config.removeitem, 1)  then
      TriggerClientEvent('dv_yacht:client:yacht:hack',src)
      TriggerClientEvent('dv_yacht:client:yacht:hack1',-1)
      money = true
    end
   end
end)

RegisterNetEvent('dv_yacht:server:events', function(data)
    TriggerClientEvent('dv_yacht:client:money',-1,data)
end)
RegisterNetEvent('dv_yacht:server:GiveItem', function()
   if robbery  then
      if money  then
         local rand = math.random(Config.getMin, Config.getMax)
         local ped = GetPlayerPed(source)
         local playerCoords = GetEntityCoords(ped)
         local distance = #(playerCoords - vector3(-2047.57, -1032.21, 5.88))
         local name = GetPlayerName(source)
         local license = GetPlayerIdentifier(source,0)
         local id1 = GetPlayerIdentifier(source,1)
         local id2 = GetPlayerIdentifier(source,2)
         local id3 = GetPlayerIdentifier(source,4)
         if distance < 50 then
            if Config.framework == 'qb' then
            local QBCore = exports['qb-core']:GetCoreObject()
            local Player = QBCore.Functions.GetPlayer(source)
             Player.Functions.AddItem(Config.giveitem, rand) 
             TriggerEvent('dv_yacht:server:log',"Money collecting","**".."Money added:"..' '..rand .."**".."\n ".."**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Discord:".."**"..' '..id1.."\n".."**".."Fivem:"..' '.."**"..id2.."\n".."**".."IP:"..' '.."**"..id3,EE2F06)
            end
            if Config.framework == 'esx' then
               local ESX = exports["es_extended"]:getSharedObject()
               local xPlayer = ESX.GetPlayerFromId(source)
           xPlayer.addInventoryItem(Config.giveitem, rand)
               TriggerEvent('dv_yacht:server:log',"Money collecting","**".."Money added:"..' '..rand .."**".."\n ".."**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Discord:".."**"..' '..id1.."\n".."**".."Fivem:"..' '.."**"..id2.."\n".."**".."IP:"..' '.."**"..id3,EE2F06)
            end
            Wait(120000)
            money = false
            end
   else
      TriggerEvent('dv_yacht:server:log',"Danger collecting item","**".."Player is probaly using cheats because distance is:"..' '..distance .."**".."\n ".."**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Discord:".."**"..' '..id1.."\n".."**".."Fivem:"..' '.."**"..id2.."\n".."**".."IP:"..' '.."**"..id3,EE2F06)
   
      end
     end
end)

RegisterServerEvent('dv_yacht:server:end')
AddEventHandler('dv_yacht:server:end', function()
   local name = GetPlayerName(source)
   local license = GetPlayerIdentifier(source,0)
   local id1 = GetPlayerIdentifier(source,1)
   local id2 = GetPlayerIdentifier(source,2)
   local id3 = GetPlayerIdentifier(source,4)
   if robbery then
      robbery = false
      TriggerClientEvent('dv_yacht:client:ending',-1)
      TriggerEvent('dv_yacht:server:log',"Robbery ended","**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Discord:".."**"..' '..id1.."\n".."**".."Fivem:"..' '.."**"..id2.."\n".."**".."IP:"..' '.."**"..id3,EE2F06)
end
end)
RegisterNetEvent('dv_yacht:hack', function(data)
    if data == 'success' then
       TriggerClientEvent('dv_yacht:client:yacht:hack1','false')
    end
    if data == 'fail' then
      TriggerClientEvent('dv_yacht:client:yacht:hack1','true')
    end
end)
RegisterNetEvent('dv_yacht:server:yacht:callpd', function()
   if robbery == true then
      if Config.alert == 'linden' then
         local data = {displayCode = '211', description = 'Robbery', isImportant = 0, recipientList = {'police'}, length = '50000', infoM = 'fa-info-circle', info = 'Yacht Heist'}
         local dispatchData = {dispatchData = data, caller = 'Alarm', coords = vector3(-2083.6292, -1018.2227, 12.7819, 56.7514)}
         TriggerEvent('wf-alerts:svNotify', dispatchData)
     elseif Config.alert == 'QB' then
         local alertData = {
             title = "Yacht Heist",
             coords = {x =  -2083.6292, y =  -1018.2227, z = 12.7819},
             description = "Yacht is under robbery",
             }
         TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
  end
end
end)
if Config.framework == 'qb' then
   local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateUseableItem("cashroll", function(source, item)
   local Player = QBCore.Functions.GetPlayer(source)
   if Player.Functions.RemoveItem(item.name, 1) then
       Player.Functions.AddMoney('cash', Config.cashroll)
   end
end)
end
if Config.framework == 'esx' then
   local ESX = exports["es_extended"]:getSharedObject()
   ESX.RegisterUsableItem("cashroll", function(source)
       local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem('cashroll', 1) 
        xPlayer.addMoney(Config.cashroll)
   end)
end
RegisterNetEvent('dv_yacht:server:yacht:radio:pd', function()
      local coords = Config.ped[1]
      local coords1 = Config.ped[2]
      local coords2 = Config.ped[3]
      local coords3 = Config.ped[4]
      local coords4 = Config.ped[5]
         local ped = CreatePed(4, Config.peds[1], coords.x, coords.y, coords.z, 180.0, true, true)
         SetPedArmour(ped, Config.pedarmour)
         GiveWeaponToPed(ped,Config.pedweapon,500)
         local ped1 = CreatePed(4, Config.peds[1], coords1.x, coords1.y, coords1.z, 180.0, true, true)
         SetPedArmour(ped1, Config.pedarmour)
         GiveWeaponToPed(ped1,Config.pedweapon,500)
         local  ped2 = CreatePed(4, Config.peds[1], coords2.x, coords2.y, coords2.z, 180.0, true, true)
         SetPedArmour(ped2, Config.pedarmour)
         GiveWeaponToPed(ped2,Config.pedweapon,500)
         local  ped3 = CreatePed(4,Config.peds[2], coords3.x, coords3.y, coords3.z, 180.0, true, true)
         SetPedArmour(ped3, Config.pedarmour)
         GiveWeaponToPed(ped3,Config.pedweapon,500)
         local ped4 = CreatePed(4, Config.peds[2], coords4.x, coords4.y, coords4.z, 180.0, true, true)
         SetPedArmour(ped4, Config.pedarmour)
         GiveWeaponToPed(ped4,Config.pedweapon,500)
      TriggerEvent('dv_yacht:server:yacht:callpd')
end)

RegisterNetEvent('dv_yacht:server:log', function(name, message, color)
   local connect = {
       {
           ["color"] = color,
           ["title"] = "**".. name .."**",
           ["description"] = message,
           ["footer"] = {
           ["text"] = "Los Santos",
           },
       }
   }
 PerformHttpRequest(Config.webhook, function(err, text, headers) end, 'POST', json.encode({username =  "dv_yacht", embeds = connect, avatar_url = "https://cdn.discordapp.com/icons/866965773623623691/d2013f3fb9135be5492dc98e45df0f4d.webp?size=128"}), { ['Content-Type'] = 'application/json' })
end)