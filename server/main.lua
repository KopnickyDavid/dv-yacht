----LOCAL----
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
if Config.usable == 'qb' then
   local QBCore = exports['qb-core']:GetCoreObject()
         QBCore.Functions.CreateUseableItem("cashroll", function(source)
      if exports['dv-lib']:RemoveItem(source,'cashroll',1)  then
         exports['dv-lib']:AddMoney(source,'cash',Config.cashroll)
  end
end)
elseif Config.usable == 'esx' then
      local ESX = exports["es_extended"]:getSharedObject()
      ESX.RegisterUsableItem("cashroll", function(source)
         if  exports['dv-lib']:RemoveItem(source,'cashroll',1)  then
            exports['dv-lib']:AddMoney(source,'cash',Config.cashroll)
         end
   end)
end
RegisterNetEvent('dv_yacht:server:start', function()
  local name = GetPlayerName(source)
  local license = GetPlayerIdentifier(source,0)
  local id1 = GetPlayerIdentifier(source,1)
  local id2 = GetPlayerIdentifier(source,2)
  local id3 = GetPlayerIdentifier(source,4)
    robbery = true
    TriggerClientEvent('dv_yacht:client:start1',-1)
    log("Robbery started","**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Discord:".."**"..' '..id1.."\n".."**".."Fivem:"..' '.."**"..id2.."\n".."**".."IP:"..' '.."**"..id3,EE2F06)
end)
RegisterNetEvent('dv_yacht:server:boat1', function()
   TriggerClientEvent('dv_yacht:client:boat',-1)
 end)
RegisterNetEvent('dv_yacht:server:yacht:start', function()
   TriggerClientEvent('dv_yacht:client:yacht:start',-1)
   TriggerClientEvent('dv_yahct:client:propis',-1)
end)
RegisterNetEvent('dv_yacht:server:hacking', function(source)
   if  exports['dv-lib']:RemoveItem(source,Config.removeitem,1) then
      TriggerClientEvent('dv_yacht:client:yacht:hack',source)
   end  
end)
RegisterNetEvent('dv_yacht:server:events', function(data)
    TriggerClientEvent('dv_yacht:client:money',-1,data)
end)
RegisterNetEvent('dv_yacht:server:GiveItem', function(source)
       local rand = math.random(Config.getMin, Config.getMax)
       local license = GetPlayerIdentifier(source,0)
       local id1 = GetPlayerIdentifier(source,1)
       local id2 = GetPlayerIdentifier(source,2)
       local id4 = GetPlayerIdentifier(source,3)
       local id3 = GetPlayerIdentifier(source,4)
       local id5 = GetPlayerIdentifier(source,6)
       local ped = GetPlayerPed(source)
       local playerCoords = GetEntityCoords(ped)
       local distance = #(playerCoords - vector3(-2094.4231, -1008.6356, 4.8843))
       local name = GetPlayerName(source)
   if  distance < 60  then 
       exports['dv-lib']:GiveItem(source,Config.giveitem,rand)
   else
       log("Danger collecting item","**".."Player is probaly using cheats because distance is:"..' '..distance .."**".."\n ".."**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Xbox:".."**"..' '..id1.."\n".."**".."Live:"..' '.."**"..id2.."\n".."**".."Fivem:"..' '.."**"..id3.."\n".."**".."Discord:"..' '.."**"..id4.."\n".."**".."IP:"..' '.."**"..'||'..id5..'||',EE2F06)
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
      log("Robbery ended","**".."Steam name:"..' '.."**"..name.."\n ".."**".."License:".."**"..' '..license.."\n".."**".."Discord:".."**"..' '..id1.."\n".."**".."Fivem:"..' '.."**"..id2.."\n".."**".."IP:"..' '.."**"..id3,EE2F06)
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
   if robbery  then
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