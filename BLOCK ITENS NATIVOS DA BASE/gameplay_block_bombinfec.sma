#include <amxmodx>
#include <zombie_plague_special>

new cvar_min_players;

public plugin_init()
{
	register_plugin("[ZP] Block Bomb INFEC", "1.0", "8K300FPS | Teixeira");
	cvar_min_players = register_cvar("grenade_min_players", "10");
}

public zp_extra_item_selected_pre(id, itemid) 
{
	if(itemid != EXTRA_INFBOMB) return PLUGIN_CONTINUE;

	static HmCount, MinPlayers;
	HmCount = zp_get_human_count(); // Executa o loop so uma vez (Loop ocorre no plugin principal)
	MinPlayers = get_pcvar_num(cvar_min_players);
	if(HmCount < MinPlayers)
	{
		zp_extra_item_textadd(fmt("\r[HM:%d/%d]", HmCount, MinPlayers));
		return ZP_PLUGIN_HANDLED;
	}
	zp_extra_item_textadd(fmt("\w[HM:%d/%d]", HmCount, MinPlayers));
	return PLUGIN_CONTINUE;
}