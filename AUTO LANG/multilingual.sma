#include <amxmodx>
#include <amxmisc>
#include <fakemeta>
#include <Geoip>

#pragma compress 1

#define PLUGIN "MENU DE LINGUAGEM"
#define VERSION "2.5.0"
#define AUTHOR "Teixeira"

const KEYSMENU = MENU_KEY_1|MENU_KEY_2|MENU_KEY_3|MENU_KEY_4|MENU_KEY_5|MENU_KEY_6|MENU_KEY_7|MENU_KEY_8|MENU_KEY_9|MENU_KEY_0
const OFFSET_CSMENUCODE = 206

#define MAX_EN 39
#define MAX_DE 3
#define MAX_FR 25
#define MAX_NL 2
#define MAX_SP 20

new langatual_en[33], langatual_es[33], langatual_bp[33], playerip[17], ccode[3], lang[33], geoip_check[3];

new lang_sp[MAX_SP][] = {"ES", "AR", "BO", "CL", "CO", "CR", "CU", "DO", "EC", "SV", "GQ", "GT", "HN", "MX", "NI", "PA", "PY", "PE", "UY", "VE"}
new lang_en[MAX_EN][] = {"US", "GB", "AG", "AU", "BS", "BB", "BZ", "BW", "CA", "DM", "GM", "GH", "GD", "GY", "JM", "LR", "MW", "MH", "MR", "FM", "NZ", "NG", "PG", "SL", "SB", "KN", "LC", "VC", "TT", "ZM", "ZW", "VI", "VG", "UM", "NF", "MS", "KY", "IO", "GI"}

public plugin_init() 
{
	register_plugin(PLUGIN, VERSION, AUTHOR);
	register_dictionary("multilingual.txt")
	register_dictionary("common.txt")
	register_dictionary("languages.txt")
	
	register_clcmd("say", "chat_comandos");
	register_clcmd("say_team", "chat_comandos");
	register_clcmd("amx_langmenu", "SHOW_MENULANG", ADMIN_ALL)
	register_cvar("Auto Lang", "10", FCVAR_SERVER|FCVAR_SPONLY) 

	register_menu("Menu Principal", KEYSMENU, "menu_principal_cases");
}

public client_connect(id)
{
	lang[id] = 0
}

public client_putinserver(id)
{
	if((!is_user_bot(id)) || (!is_user_hltv(id)))
	{
		set_task(2.0, "disp_Info", id)
	}
}

public client_disconnected(id)
{
	remove_task(id)
	lang[id] = 0
}

public disp_Info(id)
{
	if (is_user_bot(id))
		return;

	new i
	get_user_info(id, "lang", geoip_check, 2)
	lang[id] = str_to_num(geoip_check)
	get_user_ip(id, playerip, 16, 1)
	geoip_code2_ex(playerip, ccode)
	
	if (!equali(lang[id], ccode))
	{
		if (equali(ccode, "err"))
		{
			set_user_info(id, "lang", "en")
			langatual_en[id] = 1;
			return;
		}
		
		for (i = 0; i < MAX_EN; ++i)
		{
			if (equali(lang_en[i], ccode))
			{
				set_user_info(id, "lang", "en")
				langatual_en[id] = 1;
				return;
			}
		}
			
		for (i = 0; i < MAX_SP; ++i)
		{
			if (equali(lang_sp[i], ccode))
			{
				set_user_info(id, "lang", "es")
				langatual_es[id] = 1;
				return;
			}
		}

		set_user_info(id, "lang", "bp") // <--- Linguagem setada por padrão caso o player não tenha suport a sua linguagem
		langatual_bp[id] = 1;
	}
	
	return;
}

public SHOW_MENULANG(id)
{
	static menu[999], len; len = 0

	len += formatex(menu[len], charsmax(menu) - len, "%L^n", id, "LANG_MENU");
	len += formatex(menu[len], charsmax(menu) - len, "%L^n^n", id, "LANG_MENU_SUPORT");

	len += formatex(menu[len], charsmax(menu) - len, "\d[\r1\d]\w. Inglês \d[\yEN\d]\w - \d[%s\d] ^n", langatual_en[id] ? "\rX" : "");
	len += formatex(menu[len], charsmax(menu) - len, "\d[\r2\d]\w. Espanhol \d[\yES\d]\w - \d[%s\d]^n", langatual_es[id] ? "\rX" : "")
	len += formatex(menu[len], charsmax(menu) - len, "\d[\r3\d]\w. Português brasil \d[\yBR\d]\w - \d[%s\d]^n^n", langatual_bp[id] ? "\rX" : "")

	len += formatex(menu[len], charsmax(menu) - len, "\r0. \w%L", id, "SAIR");

	set_pdata_int(id, OFFSET_CSMENUCODE, 0);
	show_menu(id, KEYSMENU, menu, -1, "Menu Principal");

	return PLUGIN_CONTINUE
}

public menu_principal_cases(id, key)
{
	switch(key)
	{
		case 0:
		{
			if(langatual_bp[id] == 1 || langatual_es[id] == 1)
			{
				set_user_info(id, "lang", "en");
				langatual_en[id] = 1;
				langatual_bp[id] = 0;
				langatual_es[id] = 0;
				SHOW_MENULANG(id);
			}
			else 
			{
				set_user_info(id, "lang", "en");
				langatual_en[id] = 1;
				langatual_bp[id] = 0;
				langatual_es[id] = 0;
				SHOW_MENULANG(id);
			}
		}
		case 1:
		{
			if(langatual_bp[id] == 1 || langatual_en[id] == 1)
			{
				set_user_info(id, "lang", "es");
				langatual_es[id] = 1;
				langatual_en[id] = 0;
				langatual_bp[id] = 0;
				SHOW_MENULANG(id);
			}
			else
			{
				set_user_info(id, "lang", "es");
				langatual_es[id] = 1;
				langatual_en[id] = 0;
				langatual_bp[id] = 0;
				SHOW_MENULANG(id);
			}
		}
		case 2:
		{
			if(langatual_en[id] == 1 || langatual_es[id] == 1)
			{
			set_user_info(id, "lang", "bp");
			langatual_bp[id] = 1;
			langatual_en[id] = 0;
			langatual_es[id] = 0;
			SHOW_MENULANG(id);
			}
			else 
			{
				set_user_info(id, "lang", "bp");
				langatual_bp[id] = 1;
				langatual_en[id] = 0;
				langatual_es[id] = 0;
				SHOW_MENULANG(id);
			}
		}
	}
	return PLUGIN_HANDLED
}

public chat_comandos(id)
{
	new text[70], arg1[32], arg2[32], arg3[6]
	read_args(text, sizeof(text) - 1); remove_quotes(text)
	arg1[0] = '^0'; arg2[0] = '^0'; arg3[0] = '^0'
	parse(text, arg1, sizeof(arg1) - 1, arg2, sizeof(arg2) - 1, arg3, sizeof(arg3) - 1)

	if (equali(arg1, "/", 1) || equali(arg1, ".", 1)) format(arg1, 31, arg1[1])

	if (arg3[0]) return PLUGIN_CONTINUE

	if (equali(arg1, "idioma") || equali(arg1, "language") || equali(arg1, "lang"))
	{
		SHOW_MENULANG(id)
		return PLUGIN_HANDLED
	}
	return PLUGIN_CONTINUE;
}