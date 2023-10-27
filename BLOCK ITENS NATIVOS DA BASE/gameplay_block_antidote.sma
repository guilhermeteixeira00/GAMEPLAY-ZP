#include <amxmodx>
#include <zombie_plague_special>

new cvar_min_players;

public plugin_init()
{
	register_plugin("[ZP] Block ANTIDOTE", "1.0", "8K300FPS | Teixeira");
	cvar_min_players = register_cvar("antidote_min_players", "7");
}

public zp_extra_item_selected_pre(id, itemid) 
{
	if(itemid != EXTRA_ANTIDOTE) return PLUGIN_CONTINUE;

	static ZmCount, MinPlayers;
	ZmCount = zp_get_zombie_count(); // Executa o loop so uma vez (Loop ocorre no plugin principal)
	MinPlayers = get_pcvar_num(cvar_min_players);
	if(ZmCount < MinPlayers)
	{
		zp_extra_item_textadd(fmt("\r[ZM:%d/%d]", ZmCount, MinPlayers));
		return ZP_PLUGIN_HANDLED;
	}
	zp_extra_item_textadd(fmt("\y[ZM:%d/%d]", ZmCount, MinPlayers));
	return PLUGIN_CONTINUE;
}