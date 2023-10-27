#include <amxmodx>
#include <geoip>

#define MAX_EN 39
#define MAX_DE 3
#define MAX_FR 25
#define MAX_NL 2
#define MAX_SP 20

new playerip[17]
new ccode[3]
new lang[33]
new geoip_check[3]

new lang_sp[MAX_SP][] = {"ES", "AR", "BO", "CL", "CO", "CR", "CU", "DO", "EC", "SV", "GQ", "GT", "HN", "MX", "NI", "PA", "PY", "PE", "UY", "VE"}
new lang_en[MAX_EN][] = {"US", "GB", "AG", "AU", "BS", "BB", "BZ", "BW", "CA", "DM", "GM", "GH", "GD", "GY", "JM", "LR", "MW", "MH", "MR", "FM",
			 "NZ", "NG", "PG", "SL", "SB", "KN", "LC", "VC", "TT", "ZM", "ZW", "VI", "VG", "UM", "NF", "MS", "KY", "IO", "GI"}
new lang_de[MAX_DE][] = {"DE", "AT", "LI"}
new lang_fr[MAX_FR][] = {"FR", "BJ", "BF", "CD", "CF", "CI", "GA", "GN", "ML", "MC", "NE", "SN", "TG", "ZR", "MQ", "GP", "RE", "GY", "PF", "PM",
			 "NC", "WF", "YT", "TF", "GF"}
new lang_nl[MAX_NL][] = {"NL", "SR"}

public plugin_init()
{
	register_plugin("\r[ZP] \wAuto Lang", "1.0", "Teixeira")
	register_cvar("Auto Lang", "10", FCVAR_SERVER|FCVAR_SPONLY) 
}

public client_connect(id)
{
	lang[id] = 0
}

public client_putinserver(id)
{
	if (!is_user_bot(id))
	{
		set_task(3.0, "disp_Info", id)
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
		return PLUGIN_CONTINUE

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
			client_print_color(id, print_team_default, "^4[ZP]^1 You are on LAN or couldn't autodetect your country. Your Language will be set to English.")
			return PLUGIN_CONTINUE
		}
		
		if (equali(ccode, "SE"))
		{
			set_user_info(id, "lang", "sv")
			client_print_color(id, print_team_default, "^4[ZP]^1 Ditt sprak har automatiskt identifierats och installt pa svenska.")
			return PLUGIN_CONTINUE
		}
		
		if (equali(ccode, "DK"))
		{
			set_user_info(id, "lang", "da")
			client_print_color(id, print_team_default, "^4[ZP]^1 Dit sprog er blevet autoregistreret og indstillet til dansk.")
			return PLUGIN_CONTINUE
		}
		
		if (equali(ccode, "PL"))
		{
			set_user_info(id, "lang", "pl")
			client_print_color(id, print_team_default, "^4[ZP]^1 Your Language has been autodetected and set to Polish.")
			return PLUGIN_CONTINUE
		}
		
		if (equali(ccode, "TR"))
		{
			set_user_info(id, "lang", "tr")
			client_print_color(id, print_team_default, "^4[ZP]^1 Diliniz otomatik olarak algılandı ve Turkce olarak ayarlandı.")
			return PLUGIN_CONTINUE
		}
		
		if (equali(ccode, "BR"))
		{
			set_user_info(id, "lang", "bp")
			client_print_color(id, print_team_default, "^4[ZP]^1 Seu idioma foi detectado automaticamente e definido como Portugues Brasil.")
			return PLUGIN_CONTINUE
		}
		
		if (equali(ccode, "CZ"))
		{
			set_user_info(id, "lang", "cz")
			client_print_color(id, print_team_default, "^4[ZP]^1 Your Language has been autodetected and set to Czech.")
			return PLUGIN_CONTINUE
		}

		if (equali(ccode, "FI"))
		{
			set_user_info(id, "lang", "fi")
			client_print_color(id, print_team_default, "^4[ZP]^1 Kielesi on tunnistettu automaattisesti ja asetettu suomeksi.")
			return PLUGIN_CONTINUE
		}
		
		for (i = 0; i < MAX_NL; ++i)
		{
			if (equali(lang_nl[i], ccode))
			{
        			set_user_info(id, "lang", "nl")
				client_print_color(id, print_team_default, "^4[ZP]^1 Uw taal is automatisch gedetecteerd en ingesteld op Nederlands.")
				return PLUGIN_CONTINUE
			}
		}

		for (i = 0; i < MAX_DE; ++i)
		{
			if (equali(lang_de[i], ccode))
			{
       				set_user_info(id, "lang", "de")
				client_print_color(id, print_team_default, "^4[ZP]^1 Ihre Sprache wurde automatisch erkannt und auf Deutsch eingestellt.")
				return PLUGIN_CONTINUE
			}
		}

		for (i = 0; i < MAX_EN; ++i)
		{
			if (equali(lang_en[i], ccode))
			{
       				set_user_info(id, "lang", "en")
				client_print_color(id, print_team_default, "^4[ZP]^1 Your Language has been autodetected and set to English.")
				return PLUGIN_CONTINUE
			}
		}

		for (i = 0; i < MAX_FR; ++i)
		{
			if (equali(lang_fr[i], ccode))
			{
       				set_user_info(id, "lang", "fr")
				client_print_color(id, print_team_default, "^4[ZP]^1 Votre langue a ete detectee automatiquement et definie sur FR.")
				return PLUGIN_CONTINUE
			}
		}
			
		for (i = 0; i < MAX_SP; ++i)
		{
			if (equali(lang_sp[i], ccode))
			{
       				set_user_info(id, "lang", "es")
				client_print_color(id, print_team_default, "^4[ZP]^1 Su idioma se ha detectado automaticamente y se ha establecido en espanol.")
				return PLUGIN_CONTINUE
			}
		}

		set_user_info(id, "lang", "en")
		client_print_color(id, print_team_default, "^4[ZP]^1 Your Language couldn't be autodetected, it will be set to English.")
	}
	
	return PLUGIN_CONTINUE
}

