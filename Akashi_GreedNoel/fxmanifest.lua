-- [[ My Discord : discord.gg/w5z4hTfxPN ]]

fx_version 'adamant'
games { 'gta5' };

author 'Akashi' -- Akashi#0001 on Discord
description 'Menu pour GreedIsland ( discord.gg/greedisland ) que je release :) !'

client_scripts {
    "src/client/RMenu.lua",
    "src/client/menu/RageUI.lua",
    "src/client/menu/Menu.lua",
    "src/client/menu/MenuController.lua",

    "src/client/components/*.lua",

    "src/client/menu/elements/*.lua",

    "src/client/menu/items/*.lua",

    "src/client/menu/panels/*.lua",

    "src/client/menu/windows/*.lua",

}

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
}

dependencies {
  --  'es_extended',
    'skinchanger',
    -- 'dpemotes' c'est mieux :) 
}
