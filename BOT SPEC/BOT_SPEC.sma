#include <amxmodx>
#include <cstrike>
#include <fakemeta>
 
new szname_bot[] = "https://discord.gg/rWcyPfXpEc";                   ////////// NOME BOT 1
new szname_bot2[] = "+55 (41) 99896-0660 (Escanor)";                  ////////// NOME BOT 2
new szname_bot3[] = "+55 (61) 99964-7021 (Teixeira)";                 ////////// NOME BOT 3
 
new bool:bot_on, bot_id;
new bool:bot_on2, bot_id2;
new bool:bot_on3, bot_id3;
 
//Cvars
new cv_KickBots, cv_ConnectBots
 
public plugin_init()
{
    register_plugin("[ZP] botespectador", "1.0", "_|Polimpo4|_");
    
    cv_KickBots = register_cvar("cv_KickBots","26");                 
    cv_ConnectBots = register_cvar("cv_ConnectBots","16");
    
    bot_on=false;
    bot_on2=false;
    bot_on3=false;
    bot_id=0;
    bot_id2=0;
    bot_id3=0;
    set_task(1.4,"fake_make");
    set_task(1.4,"fake_make2");
    set_task(1.4,"fake_make3");
    return PLUGIN_CONTINUE
}
 
public fake_make()
{    
    new rj[128];
    if((!bot_on)&&(!bot_id))
    {
        bot_id=engfunc(EngFunc_CreateFakeClient,szname_bot);
        if(bot_id > 0)
        {
            engfunc(EngFunc_FreeEntPrivateData,bot_id);
            dllfunc(DLLFunc_ClientConnect,bot_id,szname_bot,"20.05.45.45.2",rj);
            if(is_user_connected(bot_id))
            {
                dllfunc(DLLFunc_ClientPutInServer, bot_id);
                set_pev(bot_id,pev_spawnflags,pev(bot_id,pev_spawnflags)|FL_FAKECLIENT);
                set_pev(bot_id,pev_flags,pev(bot_id,pev_flags)|FL_FAKECLIENT);
                cs_set_user_team(bot_id, CS_TEAM_SPECTATOR);
                bot_on = true;
            }        
        }        
    }
   
    return PLUGIN_CONTINUE;    
}  
 
public fake_make2()
{    
    new rj[128];
    if((!bot_on2)&&(!bot_id2))
    {
        bot_id2=engfunc(EngFunc_CreateFakeClient,szname_bot2);
        if(bot_id2 > 0)
        {
            engfunc(EngFunc_FreeEntPrivateData,bot_id2);
            dllfunc(DLLFunc_ClientConnect,bot_id2,szname_bot2,"20.05.45.45.2",rj);
            if(is_user_connected(bot_id2))
            {
                dllfunc(DLLFunc_ClientPutInServer, bot_id2);
                set_pev(bot_id2,pev_spawnflags,pev(bot_id2,pev_spawnflags)|FL_FAKECLIENT);
                set_pev(bot_id2,pev_flags,pev(bot_id2,pev_flags)|FL_FAKECLIENT);
                cs_set_user_team(bot_id2, CS_TEAM_SPECTATOR);
                bot_on2 = true;
            }        
        }        
    }
   
    return PLUGIN_CONTINUE;    
}  
public fake_make3()
{    
    new rj[128];
    if((!bot_on3)&&(!bot_id3))
    {
        bot_id3=engfunc(EngFunc_CreateFakeClient,szname_bot3);
        if(bot_id3 > 0)
        {
            engfunc(EngFunc_FreeEntPrivateData,bot_id3);
            dllfunc(DLLFunc_ClientConnect,bot_id3,szname_bot3,"20.05.45.45.2",rj);
            if(is_user_connected(bot_id3))
            {
                dllfunc(DLLFunc_ClientPutInServer, bot_id3);
                set_pev(bot_id3,pev_spawnflags,pev(bot_id3,pev_spawnflags)|FL_FAKECLIENT);
                set_pev(bot_id3,pev_flags,pev(bot_id3,pev_flags)|FL_FAKECLIENT);
                cs_set_user_team(bot_id3, CS_TEAM_SPECTATOR);
                bot_on3 = true;
            }        
        }        
    }
   
    return PLUGIN_CONTINUE;    
}
 
public client_disconnected(id)
{
    new players[32], num
    get_players(players, num, "c" )

    new szConnectBots = get_pcvar_num(cv_ConnectBots)
    
    if(num < szConnectBots && !bot_on)
    {
        fake_make()
        fake_make2()
        fake_make3()    
    }   
}
 
public client_connect(id)
{
    new players[32], num
    get_players(players, num, "c" )
 
    new szKickBots = get_pcvar_num(cv_KickBots)
 
    if(num >= szKickBots && bot_on)
    {
        bot_on = false 
        bot_on2 = false 
        bot_on3 = false     
        bot_id=0
        bot_id2=0
        bot_id3=0   
        server_cmd("kick ^"%s^"", szname_bot); 
        server_cmd("kick ^"%s^"", szname_bot2); 
        server_cmd("kick ^"%s^"", szname_bot3); 
    }
}  
