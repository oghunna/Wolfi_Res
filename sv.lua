ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterNetEvent("hubercik_resolution:KickPlayer")
AddEventHandler("hubercik_resolution:KickPlayer", function()
	DropPlayer(source, 'Zostałeś wyrzucony z serwera z powodu złej roździelczości, zmień ją na 16:9 lub 16:19.')
end)

ESX.RegisterServerCallback('hubercik_resolution:Permisja', function(source, cb)
	es = GetPlayerIdentifiers(source)[1]
	es = es:gsub("steam:", "")
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier', {
        ['@identifier'] = es
    })
    local bypass = result[1].resbypass
    if bypass == 'true' then
        cb(true)
    else
        cb(false)
    end
end)