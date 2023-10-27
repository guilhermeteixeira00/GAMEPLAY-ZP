#include <amxmodx>
#include <fakemeta>
#include <zombie_plague_special>

new pl_current[ 55 ]
new cvar_limit;

new gMaxPlayer
public plugin_init()
{
	register_plugin("[ZP] Block Furia", "1.0", "8K300FPS | Teixeira");
	register_logevent("round_End", 2, "1=Round_End")
	cvar_limit = register_cvar("limit", "7");
	
	gMaxPlayer = get_maxplayers()
}

public client_putinserver(id)
{
	pl_current[id] = 0;
}

public zp_extra_item_selected_pre(player, itemid) 
{
	if(itemid != EXTRA_MADNESS) return PLUGIN_CONTINUE;

	zp_extra_item_textadd(fmt("\y[LMT:%d/%d]", pl_current[player], get_pcvar_num(cvar_limit)));

	if(pl_current[player] >= get_pcvar_num(cvar_limit))
		return ZP_PLUGIN_HANDLED
	
	return PLUGIN_CONTINUE;
}

public zp_extra_item_selected(player, itemid)
{
	if (itemid != EXTRA_MADNESS) 
		return;

	pl_current[player]++
}

public round_End() 
{
	for (new id = 1; id <= gMaxPlayer; id++) 
		pl_current[id] = 0;
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang1046\\ f0\\ fs16 \n\\ par }
*/
