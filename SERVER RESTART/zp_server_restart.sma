#include <amxmodx>
#include <amxmisc>
#include <amxconst>

#define PLUGIN "[ZP] Server Restart"
#define VERSION "1.0"
#define AUTHOR "Teixeira"

public plugin_init() 
{
	register_plugin(PLUGIN, VERSION, AUTHOR)
	register_clcmd("say /rr", "cmd_restartround")
	register_clcmd("say .rr", "cmd_restartround")
	register_clcmd("say rr", "cmd_restartround")
	register_dictionary("sv_restart.txt")
}

public cmd_restartround(id)
{
	new szName[32]; 
	get_user_name(id, szName, charsmax(szName))
	if((get_user_flags(id) & ADMIN_RCON))
	{
		server_cmd("sv_restartround 1")
		client_print_color(0, print_team_default, "%L", id, "SVRESTARTDONO", szName) // ^4[ZP]^1 O^4 DONO^1:^4 %s ^1deu restart no round
	}
	else if((get_user_flags(id) & ADMIN_LEVEL_B))
	{
		server_cmd("sv_restartround 1")
		client_print_color(0, print_team_default, "%L", id, "SVRESTARTSTAFF", szName) // ^4[ZP]^1 O^4 STAFF^1:^4 %s ^1deu restart no round
	}
	else 
	{
		client_print_color(0, print_team_default, "^4[ZP]^1 Voce nao tem acesso !", szName)
	}
	return PLUGIN_CONTINUE;
}