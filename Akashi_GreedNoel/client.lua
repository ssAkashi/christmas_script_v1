-- [[ My Discord : discord.gg/w5z4hTfxPN ]]
-- [[ My Discord : discord.gg/w5z4hTfxPN ]]
-- [[ My Discord : discord.gg/w5z4hTfxPN ]]
-- https://github.com/ssAkashi

print("^4Script By Akashi#0001 on Discord !")

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getGreedIslandV3', function(obj) ESX = obj end) -- changer le trigger par votre trigger du ex_extended, esx:GetSharedObject normalement.
		Citizen.Wait(100)
	end
end)

local fermer = false
local tempsAttente = false
local cooldown2 = false

function ButtonFermer()
    tempsAttente = true
    Citizen.SetTimeout(1000, function()
    end)
end

function CalendrierGreed()
        fermer = true
            Citizen.SetTimeout(1000, function()
        fermer = false
    end)
end

function VehicleNoel()
    local model = GetHashKey('bf400')
        RequestModel(model)
        while not HasModelLoaded(model) do Citizen.Wait(10) end
        local posVeh = GetEntityCoords(PlayerPedId())
        local vehicleDePoche = CreateVehicle(model, posVeh.x, posVeh.y, posVeh.z, 90.0, true, false)
            SetVehicleCustomPrimaryColour(vehicleDePoche, 255, 0, 0)
            SetVehicleCustomSecondaryColour(vehicleDePoche, 255, 0, 0)
            SetVehicleNumberPlateText(vehicleDePoche, 'GREED')
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicleDePoche, -1)
            fermer = true
                Citizen.SetTimeout(1800000, function()
        fermer = false
    end)
end

RMenu.Add('noel', 'main', RageUI.CreateMenu("", "~b~Menu By Akashi for Greed-Island", nil, nil, "banniere", "banniere"))
RMenu.Add('noel', 'menu', RageUI.CreateMenu("", "~b~Actions Menu Noël", nil, nil, "banniere", "banniere"))
RMenu.Add('noel', 'animations', RageUI.CreateMenu("", "~b~Menu Animations", nil, nil, "banniere", "banniere"))
RMenu.Add('noel', 'calendrier', RageUI.CreateMenu("", "~b~Calendriers de l\'avant", nil, nil, "banniere", "banniere"))
RMenu.Add('noel', 'couleurs', RageUI.CreateMenu("", "~b~Menu Couleurs", nil, nil, "banniere", "banniere"))
RMenu.Add('noel', 'couleurs', RageUI.CreateMenu("", "~b~Menu Couleurs", nil, nil, "banniere", "banniere"))

Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('noel', 'main'), true, true, true, function()

            
            RageUI.ButtonWithStyle("Menu Noël", "~b~Accèder au Menu Noël", { RightLabel = "→→" },true, function()
            end, RMenu:Get('noel', 'menu'))

            RageUI.ButtonWithStyle("Menu Animations", "~b~Accèder au Menu Animations", { RightLabel = "→→" },true, function()
            end, RMenu:Get('noel', 'animations'))

            RageUI.ButtonWithStyle("Calendrier de l\'avant", "~b~Accèder au Calendrier de l\'avant", { RightLabel = "→→" },true, function()
            end, RMenu:Get('noel', 'calendrier'))

            RageUI.ButtonWithStyle("Menu Couleurs", "~b~Accèder au Menu Couleur", { RightLabel = "→→" },true, function()
            end, RMenu:Get('noel', 'couleurs'))
        
        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('noel', 'menu'), true, true, true,function()

            RageUI.Separator("~r~↓↓↓ ~b~Menu Boules de Neiges ~r~↓↓↓", nil, {}, true, function(_, _, _)
            end)

            RageUI.ButtonWithStyle("Ramasser des boules", "~b~Ramasser des boules de neiges", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    ExecuteCommand("me ramasse des boules de neige")
                    RamasserBoules()
                end
            end)
            
            RageUI.Separator("~r~↓↓↓ ~b~Menu Vêtements Noël ~r~↓↓↓", nil, {}, true, function(_, _, _)
            end)

            RageUI.ButtonWithStyle("Mettre Son bonnet de noël", "~b~Mettre son Bonnet de Noël", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RequestAnimDict('missheist_agency2ahelmet')
                    TaskPlayAnim(PlayerPedId(), 'missheist_agency2ahelmet', 'take_off_helmet_stand', 8.0, -1, -1, 0, 0, 0, 0, 0)
                    Wait(1500)
                    changeBonnet() -- appel de la fonction
                    ESX.ShowAdvancedNotification('Menu Noël', '~b~Annonce Menu Noël', 'Vous venez de mettre un bonnet de Noël !', 'CHAR_MP_FM_CONTACT', 8)

                end
            end)

            RageUI.ButtonWithStyle("~r~Enlever son bonnet", "~b~Enlever son Bonnet de Noël 3", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RequestAnimDict('missheist_agency2ahelmet')
                    TaskPlayAnim(PlayerPedId(), 'missheist_agency2ahelmet', 'take_off_helmet_stand', 8.0, -1, -1, 0, 0, 0, 0, 0)
                    Wait(1500)
                    removeBonnet()
                    ESX.ShowAdvancedNotification('Menu Noël', '~b~Annonce Menu Noël', 'Vous venez d\'enlever votre bonnet de Noël !', 'CHAR_MP_FM_CONTACT', 8)
                end
            end)

            RageUI.Separator("~r~↓↓↓ ~b~Menu Véhicules de Neiges ~r~↓↓↓", nil, {}, true, function(_, _, _)
            end)


            descrption = "~b~Sortir son véhicule de Noël"
            if fermer == true then
                descrption = "~r~Votre véhicule est déjà sortis et n\'est pas, ou n\'a pas été rangé dans les dernières 30 minutes !"
            end
            RageUI.ButtonWithStyle("Sortir sa moto de neige", ""..descrption.." ", { RightLabel = "~b~Executer →→" }, not fermer, function(Hovered, Active, Selected)
                if (Selected) then
                    FreezeEntityPosition(PlayerPedId(), true)
                    ExecuteCommand('me la personne sort sa moto de neige')
                    RageUI.Popup({message = "La magie de noël vous prépare votre moto..."})
                    Wait(2500)
                    FreezeEntityPosition(PlayerPedId(), false)
                    VehicleNoel()
                end
            end)

            RageUI.ButtonWithStyle("~r~Ranger sa moto de neige", "~b~Ranger sa moto de neige", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    local vehicle = ESX.Game.GetVehicleInDirection()
                
                    if IsPedInAnyVehicle(PlayerPedId(), true) then
                        vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
                    else
                        ESX.ShowAdvancedNotification('Menu Noël', '~b~Annonce Menu Noël', 'Vous n\'êtes pas sur votre moto de neige !', 'CHAR_MP_FM_CONTACT', 8)
                    end
                
                    if DoesEntityExist(vehicle) then
                        ExecuteCommand("me range sa moto de neige")
                        ESX.Game.DeleteVehicle(vehicle)
                        fermer = false
                    end
                end
            end)

            RageUI.ButtonWithStyle("Retourner au Menu Principal", "~b~Accèder au menu Principal", { RightLabel = "→→" },true, function()
            end, RMenu:Get('noel', 'main'))

        end, function()
        end)

        RageUI.IsVisible(RMenu:Get('noel', 'animations'), true, true, true, function()

            RageUI.Separator("~r~↓↓↓ ~b~Menu Animations de Noël ~r~↓↓↓", nil, {}, true, function(_, _, _)
            end)

            RageUI.ButtonWithStyle("Donner un cadeau", "~b~Donner un cadeau", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RequestAnimDict('anim@heists@box_carry@')
                   -- ExecuteCommand("e box") -- à activer si vous avez le dpemotes, vous aurez la boite dans les mains.
                    TaskPlayAnim(PlayerPedId(), 'anim@heists@box_carry@', 'idle', 8.0, -1, -1, 0, 0, 0, 0, 0)
                    -- dans le TaskPlayAnim présent, je n'ai pas ajouté la boite qui est un props. Je trouve ça inutile pour ce script, il vous faudra le dpemotes si vous le souhaitez.
                end
            end)

            RageUI.ButtonWithStyle("Donner une rose", "~b~Donner une rose", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RequestAnimDict('anim@heists@humane_labs@finale@keycards')
                --    ExecuteCommand("e rose") -- à activer si vous avez le dpemotes, vous aurez la rose dans les mains
                    TaskPlayAnim(PlayerPedId(), 'anim@heists@humane_labs@finale@keycards', 'ped_a_enter_loop', 8.0, -1, -1, 0, 0, 0, 0, 0) -- à désactiver si vous avez le dpemotes
                -- dans le TaskPlayAnim présent, je n'ai pas ajouté la rose qui est un props. Je trouve ça inutile pour ce script, il vous faudra le dpemotes si vous le souhaitez.
                end
            end)
            
            RageUI.ButtonWithStyle("S\'allonger sur la neige", "~b~S\'allonger sur la neige", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RequestAnimDict('amb@world_human_sunbathe@male@back@base')
                    TaskPlayAnim(PlayerPedId(), 'amb@world_human_sunbathe@male@back@base', 'base', 8.0, -1, -1, 0, 0, 0, 0, 0)
                end
            end)

            RageUI.ButtonWithStyle("S\'asseoir sur la neige", "~b~S\'asseoir sur la neige", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RequestAnimDict('anim@amb@business@bgen@bgen_no_work@')
                    TaskPlayAnim(PlayerPedId(), 'anim@amb@business@bgen@bgen_no_work@', 'sit_phone_phoneputdown_idle_nowork', 8.0, -1, -1, 0, 0, 0, 0, 0)
                end
            end)

            RageUI.ButtonWithStyle("Se nettoyer la neige du corps", "~b~S\'enlever la neige", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                    RequestAnimDict('move_m@_idles@shake_off')
                TaskPlayAnim(PlayerPedId(), 'move_m@_idles@shake_off', 'shakeoff_1', 8.0, -1, -1, 0, 0, 0, 0, 0)
            end
            end)

            RageUI.ButtonWithStyle("~r~Stopper l\'animation", "~b~Arrêter l\'animation", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                 --   ClearPedTasksImmediately(PlayerPedId()) -- à activer si vous voulez arrêter une animation (CA NE CLEAR PAS LES PROPS !) Pour delete le props passez par une boucle et un DeleteEntity()
                   ESX.ShowAdvancedNotification('Menu Noël', '~b~Annonce Menu Noël', 'Appuyez sur la touche « X » de votre clavier.', 'CHAR_MP_FM_CONTACT', 8)
                -- généralement c'est X suivant votre F5 / dpemotes. Sinon changer simplement la notif x)
             end
        end)

            RageUI.ButtonWithStyle("Retourner au Menu Principal", "~b~Accèder au menu Principal", { RightLabel = "→→" },true, function()
            end, RMenu:Get('noel', 'main'))

        end, function()
        end)
        RageUI.IsVisible(RMenu:Get('noel', 'calendrier'), true, true, true,function()

            RageUI.Separator("~r~↓↓↓ ~b~Calendrier de l\'avant ~r~↓↓↓", nil, {}, true, function(_, _, _)
            end)

            description = "~b~Ouvrir le jour 1 du Calendrier de l\'avant"
            if tempsAttente == true then
                description = "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !"
            end
            RageUI.ButtonWithStyle("Jour 1", ""..description.." ", { RightLabel = "~b~Ouvrir →→" }, not tempsAttente, function(Hovered, Active, Selected)
                if (Selected) then
                TriggerServerEvent('noeltahgreedisland:patochemangecroquette')
                PlaySoundFrontend( -1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
                Wait(2000)
                description = "Test"
                tempsAttente = true
                end
            end)

             RageUI.ButtonWithStyle("Jour 2", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
             end)

             RageUI.ButtonWithStyle("Jour 3", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
             end)

             RageUI.ButtonWithStyle("Jour 4", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
             end)

             RageUI.ButtonWithStyle("Jour 5", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
             end)

             RageUI.ButtonWithStyle("Jour 6", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
             end)


             RageUI.ButtonWithStyle("Jour 7", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
             end)


             RageUI.ButtonWithStyle("Jour 8", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
             end)
    

             RageUI.ButtonWithStyle("Jour 9", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
             end)

             RageUI.ButtonWithStyle("Jour 10", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
             end)

            RageUI.ButtonWithStyle("Jour 11", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 12", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 13", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 14", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 15", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 16", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 17", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 18", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 19", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 20", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 21", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 22", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 23", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 24", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

            RageUI.ButtonWithStyle("Jour 25", "~r~Vous ne pouvez pas ouvrir cette case, ce jour a été dépassé ou pas encore atteint !", { RightLabel = "~b~Ouvrir →→" }, cooldown2, function(Hovered, Active, Selected)
            end)

         RageUI.ButtonWithStyle("Retourner au Menu Principal", "~b~Accèder au menu Principal", { RightLabel = "→→" },true, function()
         end, RMenu:Get('noel', 'main'))
            

        end, function()
        end)


        RageUI.IsVisible(RMenu:Get('noel', 'couleurs'), true, true, true,function()

            RageUI.ButtonWithStyle("Couleur Amplifiées (Pour la neige)", "~b~Avec ça, vous aurez une meilleur vision de la neige !", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                    if (Selected) then
                    DoScreenFadeIn(2000)
                    DoScreenFadeOut(2000) 
                    LoadingPrompt("Changement de couleur en cours...", 3)
                    Citizen.Wait(2000)
                    DoScreenFadeIn(2000)
                    RemoveLoadingPrompt()
                    SetTimecycleModifier('rply_saturation')
                    RageUI.Popup({message = "Changement de couleur terminé ✅ !"})
                end
             end)

             RageUI.ButtonWithStyle("Couleur Normal (remise à zéro)", "~b~Avec ça, votre vision reviendra à zéro !", { RightLabel = "~b~Executer →→" }, true, function(Hovered, Active, Selected)
                if (Selected) then
                DoScreenFadeIn(2000)
                DoScreenFadeOut(2000) 
                LoadingPrompt("Changement de couleur en cours...", 3)
                Citizen.Wait(2000)
                DoScreenFadeIn(2000)
                RemoveLoadingPrompt()
                SetTimecycleModifier('')
                RageUI.Popup({message = "Changement de couleur terminé ✅ !"})
            end
         end)

         RageUI.ButtonWithStyle("Retourner au Menu Principal", "~b~Accèder au menu Principal", { RightLabel = "→→" },true, function()
         end, RMenu:Get('noel', 'main'))
            
        end, function()
        end)

        Citizen.Wait(0)
    end
end)

function removeBonnet(model)
    clothesSkin = {}

    if model == GetHashKey("mp_m_freemode_01") then
        clothesSkin = {
            ['helmet_1'] = -1, ['helmet_2'] =  0,
        }
    else
      clothesSkin = {
          ['helmet_1'] = -1, ['helmet_2'] =  0,
     }
    end

    for k,v in pairs(clothesSkin) do
        TriggerEvent("skinchanger:change", k, v)
   end
end

function changeBonnet(model)
    clothesSkin = {}

    if model == GetHashKey("mp_m_freemode_01") then
        clothesSkin = {
            ['helmet_1'] = 22, ['helmet_2'] =  0,
        }
    else
        clothesSkin = {
          ['helmet_1'] = 22, ['helmet_2'] =  0,
      }
    end

    for k,v in pairs(clothesSkin) do
        TriggerEvent("skinchanger:change", k, v)
   end
end

function RamasserBoules()
    local snowballs = math.random(1,5)
    RequestAnimDict('anim@mp_snowball')
    TaskPlayAnim(PlayerPedId(), 'anim@mp_snowball', 'pickup_snowball', 8.0, -1, -1, 0, 0, 0, 0, 0)
    FreezeEntityPosition(PlayerPedId(), true)
    Citizen.Wait(2000)
    FreezeEntityPosition(PlayerPedId(), false)
    GiveWeaponToPed(PlayerPedId(), GetHashKey('WEAPON_SNOWBALL'), snowballs, false, true)
    ESX.ShowAdvancedNotification('Menu Noël', '~b~Annonce Menu Noël', 'Vous avez ramassé '..snowballs..' boules de neiges !', 'CHAR_MP_FM_CONTACT', 8)
end

function OpenMenuNoel()
    RageUI.Visible(RMenu:Get('noel', 'main'), not RageUI.Visible(RMenu:Get('noel', 'main')))
end

RegisterCommand("noel", function(source, args, rawCommand)
    OpenMenuNoel()
end, false)