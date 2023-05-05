ESX                           = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100000)
	end
end)

CreateThread(function()	
	while true do
		Citizen.Wait(5000)
        local rozdzialka = GetIsWidescreen()
        if not rozdzialka and not jestGit then
            ESX.TriggerServerCallback('hubercik_resolution:Permisja', function(bajpas)
                print(bajpas)
                if not bajpas then
                    licznik()
                    jestGit = true
                end
            end)
        elseif rozdzialka and jestGit then
            jestGit = false
        end
	end
end)

function licznik()
	local czasownik = 60
	CreateThread(function()
		while czasownik > 0 and jestGit do
			Citizen.Wait(1000)

			if czasownik > 0 then
                czasownik = czasownik - 1
                if czasownik == 0 then
                    TriggerServerEvent("hubercik_resolution:KickPlayer")
                end
			end
		end
	end)
	CreateThread(function()
		while true do
			Citizen.Wait(2000)
            if jestGit then
                ESX.ShowNotification('Za 60s zostaniesz wyrzucony z złą roździelczość. Dozwolone 16:9')
                PlaySound(-1, "SELECT", 'HUD_MINI_GAME_SOUNDSET', 0, 0, 1)
                Citizen.Wait(10000)
                ESX.ShowNotification('Za 50s zostaniesz wyrzucony z złą roździelczość. Dozwolone 16:9')
                PlaySound(-1, "SELECT", 'HUD_MINI_GAME_SOUNDSET', 0, 0, 1)
                Citizen.Wait(10000)
                ESX.ShowNotification('Za 40s zostaniesz wyrzucony z złą roździelczość. Dozwolone 16:9')
                PlaySound(-1, "SELECT", 'HUD_MINI_GAME_SOUNDSET', 0, 0, 1)
                Citizen.Wait(10000)
                ESX.ShowNotification('Za 30s zostaniesz wyrzucony z złą roździelczość. Dozwolone 16:9')
                PlaySound(-1, "SELECT", 'HUD_MINI_GAME_SOUNDSET', 0, 0, 1)
                Citizen.Wait(10000)
                ESX.ShowNotification('Za 20s zostaniesz wyrzucony z złą roździelczość. Dozwolone 16:9')
                PlaySound(-1, "SELECT", 'HUD_MINI_GAME_SOUNDSET', 0, 0, 1)
                Citizen.Wait(10000)
                ESX.ShowNotification('Za 10s zostaniesz wyrzucony z złą roździelczość. Dozwolone 16:9')
                Citizen.Wait(10000)
            else
                SetScaleformMovieAsNoLongerNeeded(scaleform)
            end
		end
	end)
end