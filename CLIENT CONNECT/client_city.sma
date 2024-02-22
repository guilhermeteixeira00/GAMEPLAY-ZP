#include <amxmodx>
#include <geoip>

#pragma compress 1

new client_connectado[33];

public plugin_init()
{
    register_plugin("[ZP] PLAYER CONNECT", "1.0", "Teixeira");
    register_dictionary("langconnect.txt")
}

public client_putinserver(id)
{
    if(is_user_bot(id)) return PLUGIN_CONTINUE;
    
    set_task(10.0, "CHAMADACONNECT", id)

    return PLUGIN_CONTINUE;
}

public client_disconnected(id)
{
    new szName[32], szUserIP[32], szCountry[32], szCity[32];
    get_user_name(id, szName, charsmax(szName));
    get_user_ip(id, szUserIP, charsmax(szUserIP), id);
    geoip_country_ex(szUserIP, szCountry, charsmax(szCountry), id);
    geoip_city(szUserIP, szCity, charsmax(szCity), 1);
    
    if(client_connectado[id] == 1)
    {
        client_print_color(0, print_team_default, "%L", LANG_PLAYER, "DISCONECT", szName); 
        client_connectado[id] = 0;
    }
}

public CHAMADACONNECT(id)
{
    if(is_user_connected(id))
    {
        new szName[32], szUserIP[32], szCountry[32], szCity[32];
        get_user_name(id, szName, charsmax(szName));
        get_user_ip(id, szUserIP, charsmax(szUserIP), id);
        geoip_country_ex(szUserIP, szCountry, charsmax(szCountry), id);
        geoip_city(szUserIP, szCity, charsmax(szCity), 1);
        
        client_print_color(0, print_team_default, "%L", LANG_PLAYER, "CONNECT", szName, szCountry, szCity);
        client_connectado[id] = 1;
    }
}
