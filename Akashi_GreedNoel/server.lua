-- [[ My Discord : discord.gg/w5z4hTfxPN ]]
-- [[ My Discord : discord.gg/w5z4hTfxPN ]]
-- [[ My Discord : discord.gg/w5z4hTfxPN ]]

ESX = nil
TriggerEvent('esx:getGreedIslandV3', function(obj) ESX = obj end) -- changer le trigger par votre trigger du ex_extended, esx:GetSharedObject normalement.

local Checked = {} -- ne pas enlever

RegisterNetEvent('noeltahgreedisland:patochemangecroquette')
AddEventHandler('noeltahgreedisland:patochemangecroquette', function()
    local _source = source -- ne pas enlever
    local xPlayer = ESX.GetPlayerFromId(source) -- ne pas enlever
    local Identifier = xPlayer.identifier -- ne pas enlever 
    local akashi = 5001 
    local simon = 5000
    local nombreItem = math.random(30, 50)  -- aléatoire pour tout les joueurs, entre 30 et 50 pour le cuop 

          if akashi >= simon then -- faites pas attention à ça, j'avais sûrement fumé ptdrrrr
            if not Checked[Identifier] then
                Checked[Identifier] = true
                xPlayer.addInventoryItem('bread', nombreItem) -- commande pour ajouter un item dans l'inventaire du joueur, liste d'autres commande en bas :)
              TriggerClientEvent('esx:showAdvancedNotification', source, 'Menu Noël', '~b~Annonce Menu Noël', "Ouverture du jour 1 de votre calendrier de l\'avant, et vous avez reçu~g~ "..nombreItem.." Pains !", 'CHAR_MP_FM_CONTACT', 8)
            else
                if Checked[Identifier] then -- éviter le bug de pouvoir réouvrir en faisant un alt f4 ;)
                    TriggerClientEvent('esx:showAdvancedNotification', source, 'Menu Noël', '~b~Annonce Menu Noël', "~r~Vous avez déjà ouvert cette case !", 'CHAR_MP_FM_CONTACT', 8)

            end
        end
    end
end)

-- Mon Discord : Akashi#0001

--[[
    liste d'autres commandes que le xPlayer.addInventoryItem :
    Ajouter une arme : xPlayer.addWeapon("nom de l'arme") le nom des armes ici : https://wiki.rage.mp/index.php?title=Weapons
    Ajouter un item : xPlayer.addInventoryItem('nom de l'item') le nom de l'item doit correspondre au name de l'item présent dans votre tables items (bdd)
    Ajouter de l'argent : xPlayer.addMoney(Quantité d'argent)
    
    Il y en beaucoup d'autres, je vous invite à regarder sur cette documentation : https://esx-framework.github.io/es_extended/server/xplayer/functions/addaccountmoney/
    dans les xPlayer (functions) côté serveur
    
]]
