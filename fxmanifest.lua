fx_version 'adamant'

game 'gta5'

description 'ESX Weapon Shop'
lua54 'yes'
version '1.8.5'

shared_scripts {
	'@es_extended/imports.lua',
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua'
}

server_scripts {
	'server/main.lua'
}

client_scripts {
	'client/main.lua'
}

dependency 'es_extended'
