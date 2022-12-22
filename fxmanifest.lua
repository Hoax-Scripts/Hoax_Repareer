fx_version 'cerulean'
game 'gta5'

author 'Hoaxs Scripts'
description 'Repareer je voertuig bij de pimp shops'
version '1.0.0'

shared_script 'config.lua'


shared_scripts {
	-- "@es_extended/locale.lua",
	-- "@es_extended/imports.lua",
	"src/client/client.lua",
	"src/shared/*.lua"
}

client_scripts {
	'src/client/*.lua*',
	'src/client/commands/*.lua*',
} 

server_scripts {
	'src/server/*.lua',
	'src/server/commands/*.lua'
}  

files {
    'src/html/index.html',
    'src/html/style.css',
    'src/html/main.js',
}

ui_page 'src/html/index.html'


dependencies {
	'es_extended'
}