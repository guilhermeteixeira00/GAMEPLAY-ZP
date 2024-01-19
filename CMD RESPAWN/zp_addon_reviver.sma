#include <amxmodx>
#include <zombie_plague_special>

#pragma compress 1

#define PLUGIN "[ZP] Addon reviver"
#define VERSION "3.0"
#define AUTHOR "Leozinho | [P]erfec[T] [S]cr[@]s[H] | Teixeira"

new allow_respawn

public plugin_init()
{  
	register_plugin(PLUGIN, VERSION, AUTHOR)
	say_text("reviver", "cmd_respawn")
	say_text("revive", "cmd_respawn")
	say_text("reanimar", "cmd_respawn")
	register_clcmd("respawn", "cmd_respawn")
}

public client_putinserver(id)
{
	if(!is_user_bot(id)){
		if(!is_user_alive(id)){
			set_task(3.0, "cmd_autorespawn", id)
		}
	} 
}

public cmd_autorespawn(id)
{
	if(!is_user_alive(id)){
		cmd_respawn(id)
	}
} 

public zp_round_started(gamemode){
	if(gamemode == MODE_INFECTION || gamemode == MODE_MULTI)
		allow_respawn = true
	else 
		allow_respawn = false
}

public cmd_respawn(id)
{
	if(!is_user_connected(id))
		return PLUGIN_HANDLED

	if(allow_respawn) {
		if(!is_user_alive(id)) {
			zp_respawn_user(id, ZP_TEAM_ZOMBIE)
			return PLUGIN_HANDLED
		}
	}
	return PLUGIN_HANDLED
}


stock say_text(szsay[], szfunction[])
{
	new sztemp[64]
	formatex(sztemp, 63 , "say /%s", szsay)
	register_clcmd(sztemp, szfunction)
	
	formatex(sztemp, 63 , "say .%s", szsay)
	register_clcmd(sztemp, szfunction)
	
	formatex(sztemp, 63 , "say_team /%s", szsay)
	register_clcmd(sztemp, szfunction )
	
	formatex(sztemp, 63 , "say_team .%s", szsay)
	register_clcmd(sztemp, szfunction)
}