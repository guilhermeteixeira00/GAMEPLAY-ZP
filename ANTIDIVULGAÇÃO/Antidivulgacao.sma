#include <amxmodx>
#include <geoip>
#include <fakemeta> 

new const noob_nicks[][] = 
{ 
	"<Warrior> Player",
	"<Warrior> Player(1)",
	"<Warrior> Player(2)",
	"<Warrior> Player(3)",
	"<Warrior> Player(4)",
	"<Warrior> Player(5)",
	"(1)<Warrior> Player",
	"(2)<Warrior> Player",
	"(3)<Warrior> Player",
	"(4)<Warrior> Player",
	"(5)<Warrior> Player",
	"(6)<Warrior> Player",
	"-= CS Classic 2019 =- Player",
	"-= CS Classic 2020 =- Player",
	"CS Classic 2018 v2",
	"CS 1.6 Classic 2018",
	"<CS Revo v8> Player",
	"<CS Revo v7> Player",
	"<CS Revo v6> Player",
	"<CS Revo v5> Player",
	"|CS Revo| Player",
	"(1)|CS Revo| Player",
	"(2)|CS Revo| Player",
	"(3)|CS Revo| Player",
	"(4)|CS Revo| Player",
	"(5)|CS Revo| Player",
	"ARENA-BOOST-USER",
	"ARENA-BOOST",
	"Super-BOOST",
	"[Super-BOOST]",
	"Fnatic",
	"G a m e r C l u b . N e T",
	"G a m e r C l u b . N e T (1)",
	"G a m e r C l u b . N e T (2)",
	"G a m e r C l u b . N e T (3)",
	"G a m e r C l u b . N e T (4)",
	"G a m e r C l u b . N e T (5)",
	"G a m e r C l u b . N e T (6)",
	"G a m e r C l u b . N e T (7)",
	"G a m e r C l u b . N e T (8)",
	"G a m e r C l u b . N e T (9)",
	"G a m e r C l u b . N e T (10)",
	"G a m e r C l u b . N e T (11)",
	"G a m e r C l u b . N e T (12)",
	"G a m e r C l u b . N e T (13)",
	"G a m e r C l u b . N e T (14)",
	"G a m e r C l u b . N e T (15)",
	"G a m e r C l u b . N e T (16)",
	"G a m e r C l u b . N e T (17)",
	"G a m e r C l u b . N e T (18)",
	"G a m e r C l u b . N e T (19)",
	"G a m e r C l u b . N e T (20)",
	"G a m e r C l u b . N e T (21)",
	"G a m e r C l u b . N e T (22)",
	"G a m e r C l u b . N e T (23)",
	"G a m e r C l u b . N e T (24)",
	"G a m e r C l u b . N e T (25)",
	"G a m e r C l u b . N e T (26)",
	"G a m e r C l u b . N e T (27)",
	"G a m e r C l u b . N e T (28)",
	"G a m e r C l u b . N e T (29)",
	"G a m e r C l u b . N e T (30)",
	"G a m e r C l u b . N e T (31)",
	"G a m e r C l u b . N e T (32)",
	"G a m e r C l u b . N e T (33)",
	"G a m e r C l u b . N e T (34)",
	"G a m e r C l u b . N e T (35)",
	"G a m e r C l u b . N e T (36)",
	"G a m e r C l u b . N e T (37)",
	"G a m e r C l u b . N e T (38)",
	"G a m e r C l u b . N e T (39)",
	"G a m e r C l u b . N e T (40)",
	"G a m e r C l u b . N e T (41)",
	"G a m e r C l u b . N e T (42)",
	"G a m e r C l u b . N e T (43)",
	"G a m e r C l u b . N e T (44)",
	"G a m e r C l u b . N e T (45)",
	"G a m e r C l u b . N e T (46)",
	"G a m e r C l u b . N e T (47)",
	"G a m e r C l u b . N e T (48)",
	"G a m e r C l u b . N e T (49)",
	"G a m e r C l u b . N e T (50)",
	"G a m e r C l u b . N e T (51)",
	"G a m e r C l u b . N e T (52)",
	"G a m e r C l u b . N e T (53)",
	"G a m e r C l u b . N e T (54)",
	"G a m e r C l u b . N e T (55)",
	"G a m e r C l u b . N e T (56)",
	"G a m e r C l u b . N e T (57)",
	"G a m e r C l u b . N e T (58)",
	"G a m e r C l u b . N e T (59)",
	"G a m e r C l u b . N e T (60)",
	"G a m e r C l u b . N e T (61)",
	"G a m e r C l u b . N e T (62)",
	"G a m e r C l u b . N e T (63)",
	"G a m e r C l u b . N e T (64)",
	"G a m e r C l u b . N e T (65)",
	"G a m e r C l u b . N e T (66)",
	"G a m e r C l u b . N e T (67)",
	"G a m e r C l u b . N e T (68)",
	"G a m e r C l u b . N e T (69)",
	"G a m e r C l u b . N e T (70)",
	"G a m e r C l u b . N e T (71)",
	"G a m e r C l u b . N e T (72)",
	"G a m e r C l u b . N e T (73)",
	"G a m e r C l u b . N e T (74)",
	"G a m e r C l u b . N e T (75)",
	"G a m e r C l u b . N e T (76)",
	"G a m e r C l u b . N e T (77)",
	"G a m e r C l u b . N e T (78)",
	"G a m e r C l u b . N e T (79)",
	"G a m e r C l u b . N e T (80)",
	"G a m e r C l u b . N e T (81)",
	"G a m e r C l u b . N e T (82)",
	"G a m e r C l u b . N e T (83)",
	"G a m e r C l u b . N e T (84)",
	"G a m e r C l u b . N e T (85)",
	"G a m e r C l u b . N e T (86)",
	"G a m e r C l u b . N e T (87)",
	"G a m e r C l u b . N e T (88)",
	"G a m e r C l u b . N e T (89)",
	"G a m e r C l u b . N e T (90)",
	"G a m e r C l u b . N e T (91)",
	"G a m e r C l u b . N e T (92)",
	"G a m e r C l u b . N e T (93)",
	"G a m e r C l u b . N e T (94)",
	"G a m e r C l u b . N e T (95)",
	"G a m e r C l u b . N e T (96)",
	"G a m e r C l u b . N e T (97)",
	"G a m e r C l u b . N e T (98)",
	"G a m e r C l u b . N e T (99)",
	"G a m e r C l u b . N e T (100)",
	"RESPAWN~SLADERS~RO",
	"[1]RESPAWN~SLADERS~RO",
	"[2]RESPAWN~SLADERS~RO",
	"[3]RESPAWN~SLADERS~RO",
	"[4]RESPAWN~SLADERS~RO",
	"[5]RESPAWN~SLADERS~RO",
	"[6]RESPAWN~SLADERS~RO",
	"RESPAWN~SLADERS~RO [1]",
	"RESPAWN~SLADERS~RO [2]",
	"RESPAWN~SLADERS~RO [3]",
	"RESPAWN~SLADERS~RO [4]",
	"RESPAWN~SLADERS~RO [5]",
	"RESPAWN~SLADERS~RO [6]",
	"RESPAWN~SLADERS~RO [7]",
	"RESPAWN~SLADERS~RO [8]",
	"RESPAWN~SLADERS~RO [9]",
	"Lost-Souls | Player",
	"Lost-Souls | Player[1]",
	"Lost-Souls | Player[2]",
	"Lost-Souls | Player[3]",
	"Lost-Souls | Player[4]",
	"Lost-Souls | Player[5]",
	"Lost-Souls | Player[6]",
	"Lost-Souls | Player[7]",
	"Lost-Souls | Player[8]",
	"Lost-Souls | Player[9]",
	"Lost-Souls | Player[10]",
	"Lost-Souls | Player[11]",
	"Lost-Souls | Player[12]",
	"Lost-Souls | Player[13]",
	"Lost-Souls | Player[14]",
	"Lost-Souls | Player[15]",
	"Lost-Souls | Player[16]",
	"Lost-Souls | Player[17]",
	"Lost-Souls | Player[18]",
	"Lost-Souls | Player[19]",
	"Lost-Souls | Player[20]",
	"Lost-Souls | Player[21]",
	"Lost-Souls | Player[22]",
	"Lost-Souls | Player[23]",
	"Lost-Souls | Player[24]",
	"Lost-Souls | Player[25]",
	"Lost-Souls | Player[26]",
	"Lost-Souls | Player[27]",
	"Lost-Souls | Player[28]",
	"Lost-Souls | Player[29]",
	"Lost-Souls | Player[30]",
	"Lost-Souls | Player[31]",
	"Lost-Souls | Player[32]",
	"Lost-Souls | Player[33]",
	"Lost-Souls | Player[34]",
	"Lost-Souls | Player[35]",
	"Lost-Souls | Player[36]",
	"Lost-Souls | Player[37]",
	"Lost-Souls | Player[38]",
	"Lost-Souls | Player[39]",
	"Lost-Souls | Player[40]",
	"Lost-Souls | Player[41]",
	"Lost-Souls | Player[42]",
	"Lost-Souls | Player[43]",
	"Lost-Souls | Player[44]",
	"Lost-Souls | Player[45]",
	"Lost-Souls | Player[46]",
	"Lost-Souls | Player[47]",
	"Lost-Souls | Player[48]",
	"Lost-Souls | Player[49]",
	"Lost-Souls | Player[50]",
	"Lost-Souls | Player[51]",
	"Lost-Souls | Player[52]",
	"Lost-Souls | Player[53]",
	"Lost-Souls | Player[54]",
	"Lost-Souls | Player[55]",
	"Lost-Souls | Player[56]",
	"Lost-Souls | Player[57]",
	"Lost-Souls | Player[58]",
	"Lost-Souls | Player[59]",
	"Lost-Souls | Player[60]",
	"Lost-Souls | Player[61]",
	"Lost-Souls | Player[62]",
	"Lost-Souls | Player[63]",
	"Lost-Souls | Player[64]",
	"Lost-Souls | Player[65]",
	"Lost-Souls | Player[66]",
	"Lost-Souls | Player[67]",
	"Lost-Souls | Player[68]",
	"Lost-Souls | Player[69]",
	"Lost-Souls | Player[70]",
	"Lost-Souls | Player[71]",
	"Lost-Souls | Player[72]",
	"Lost-Souls | Player[73]",
	"Lost-Souls | Player[74]",
	"Lost-Souls | Player[75]",
	"Lost-Souls | Player[76]",
	"Lost-Souls | Player[77]",
	"Lost-Souls | Player[78]",
	"Lost-Souls | Player[79]",
	"Lost-Souls | Player[80]",
	"Lost-Souls | Player[81]",
	"Lost-Souls | Player[82]",
	"Lost-Souls | Player[83]",
	"Lost-Souls | Player[84]",
	"Lost-Souls | Player[85]",
	"Lost-Souls | Player[86]",
	"Lost-Souls | Player[87]",
	"Lost-Souls | Player[88]",
	"Lost-Souls | Player[89]",
	"Lost-Souls | Player[90]",
	"Lost-Souls | Player[91]",
	"Lost-Souls | Player[92]",
	"Lost-Souls | Player[93]",
	"Lost-Souls | Player[94]",
	"Lost-Souls | Player[95]",
	"Lost-Souls | Player[96]",
	"Lost-Souls | Player[97]",
	"Lost-Souls | Player[98]",
	"Lost-Souls | Player[99]",
	"Lost-Souls | Player[100]",
	"[1]Lost-Souls | Player",
	"[2]Lost-Souls | Player",
	"[3]Lost-Souls | Player",
	"[5]Lost-Souls | Player",
	"[6]Lost-Souls | Player",
	"[7]Lost-Souls | Player",
	"[8]Lost-Souls | Player",
	"[9]Lost-Souls | Player",
	"[10]Lost-Souls | Player",
	"[11]Lost-Souls | Player",
	"[12]Lost-Souls | Player",
	"[13]Lost-Souls | Player",
	"[14]Lost-Souls | Player",
	"[15]Lost-Souls | Player",
	"[16]Lost-Souls | Player",
	"INTRUSII | <Warrior> Player",
	"[1]INTRUSII | <Warrior> Player",
	"[2]INTRUSII | <Warrior> Player",
	"[3]INTRUSII | <Warrior> Player",
	"[4]INTRUSII | <Warrior> Player",
	"[5]INTRUSII | <Warrior> Player",
	"[6]INTRUSII | <Warrior> Player",
	"SERVERBOOST.ML BUY PLAYERS",
	"ProGaming",
	"ARENA-BOOST-USER",
	"INTRUSII-R0",
	"ZP.Sladers.Ro",
}

// Nicks Pre Prontos
new const new_nicks[][] = 
{ 
	"Ndk | Jogador Novo",
	"Ndk | Noob ",
	"Ndk | Instalei o CS agora",
	"Ndk | Player Noob",
	"Ndk | Nao sei mudar de nick ",
	"Ndk | Peguei o CS da China ",
	"Ndk | CS do Paraguai ",
	"Ndk | PC nao roda CS:GO ",
	"Ndk | SEMNOME ",
	"Ndk | CS Piratinha ",
	"Ndk | Non-Steam Noob ",
	"Ndk | Minha Placa nao eh Opengl ",
	"Ndk | Topo Tudo ",
	"Ndk | 16bpp ",
	"Ndk | Botei o CS com Baidu junto ",
	"Ndk | Palmeiras 100 Mundial ",
	"Ndk | Obeso ",
	"Ndk | Ixkill van helsing ",
	"Ndk | Comi mae do adm ",
	"Ndk | Dust 2 ",
	"Ndk | Joga um pouco no ZM ",
	"Ndk | Cancela Noobs ",
	"Ndk | Minecrafeteiro ",
	"Ndk | Fortinite ",
	"Ndk | Freefirezeiro ",
	"Ndk | CS da China ",
	"Ndk | Mouse de Bolinha ",
	"Ndk | PC da Xuxa ",
	"Ndk | Net de Bosta ",
	"Ndk | 10 de FPS ",
	"Ndk | Sou o Hit de tao lagadao ",
	"Ndk | Sonic eh melhor q Mario ",
	"Ndk | Software Mode ",
	"Ndk | Pica de mel ",
	"Ndk | Leiteiro da aliexpress ",
	"Ndk | Carteiro ",
	"Ndk | PaulaTejano ",
	"Ndk | LucasMonstrao ",
	"Ndk | Que issu lek ",
	"Ndk | Ultra Vibe de talco ",
	"Ndk | 20TeMatar70Correr ",
	"Ndk | Slendao ",
	"Ndk | Xandao ",
	"Ndk | Askonzao ",
	"Ndk | MaradonaPRO ",
	"Ndk | Bolsonaro ",
	"Ndk | Lula ",
	"Ndk | CiroGomes ",
	"Mourao ",
}

// Server Vars
new const szNameKey[] = "name";
new pCvar_MaxDigits, szMessage[191], g_cSwears[256][32], StrCount;
new bool: BlockChangeNick[MAX_PLAYERS + 1];

// Plugins
public plugin_init() 
{  
	// Register
	register_plugin("[ZP] Anti Divulgacao", "2.85", "Teixeira")
    
    // Say
	register_clcmd("say", "CmdSay");
	register_clcmd("say_team", "CmdSay");

	// Messages  
	register_message(get_user_msgid("SayText") , "Messages_Blockeds");

    // Vars
	pCvar_MaxDigits = register_cvar( "antidivulgacao_maxdigito", "5")

	// Forward
	register_forward(FM_ClientUserInfoChanged, "ClientUserInfoChanged");

	// Vars
	new iFile, cFile[512], cLine[32];

	// Local Info
	get_localinfo( "amxx_configsdir", cFile, charsmax(cFile));

	// Format
	format(cFile, charsmax(cFile), "%s/AntiDivulgacao.ini", cFile);	

	// Fike
	iFile = fopen(cFile, "rt");	

	// Wile
	while(!feof(iFile))
	{
		// Get File & Trim
		fgets(iFile, cLine, charsmax(cLine));			
		trim(cLine);
		
		if(strlen(cLine))
		{
			// Copy
			copy(g_cSwears[StrCount], charsmax(g_cSwears), cLine);
			
			// Count
			StrCount++;
		}
	}	
	fclose(iFile);
} 

/*--------------[ MESSAGES ]--------------*/
public Messages_Blockeds()
{
	// Vars
	static info [64];

	// Get Message STR
	get_msg_arg_string(2, info, sizeof(info) - 1);

	// Check message
	if(!equali(info , "#Cstrike_Name_Change"))
		return PLUGIN_CONTINUE;

	// Return
	return PLUGIN_HANDLED;
}

/*--------------[ CLIENT ITENS ]--------------*/
public client_connect(id) BlockChangeNick[id] = false;
public client_putinserver(id) 
{
	// Anti BUGS
	if(is_user_bot(id) || !is_user_connected(id))
		return;

	set_task(2.0, "ChangeNick", id);
}
@ChangeNickBlock(id) BlockChangeNick[id] = true;

/*--------------[ SAY ]--------------*/
public CmdSay(id) 
{  
	if(!(get_user_flags(id) & read_flags("lmn")))
	{
	 	// Read & Remove
		read_args(szMessage, charsmax(szMessage))
		remove_quotes(szMessage)
	       	
	    // Vars
		new iCount, iMax = get_pcvar_num(pCvar_MaxDigits), i = -1;
	       
	    // NDK IP
		while(szMessage[++i])     
		{             
			if('0' <= szMessage[ i ] <= '9')         
			{        
				if(++iCount >= iMax)            
				{                        
					// Motd & Log
					AntiReklamaMotd(id)
					AntiReklamaLog(id, szMessage)  

	                // Return             
					return PLUGIN_HANDLED;       
				}     
			}         
		}

		// Var
		new cPhrase[192];
		read_args(cPhrase, charsmax(cPhrase));

		// Check
		for(new i = 0; i < StrCount; i++ )
		{
			if(containi(cPhrase, g_cSwears[i]) != -1)
				return PLUGIN_HANDLED;
		}
	}

    // Return
	return PLUGIN_CONTINUE
}

/*--------------[ NICK ITENS ]--------------*/
public ChangeNick(id)
{
    // Var
	new szName[32], NewName[64]

	// Get Name
	get_user_name(id, szName, charsmax( szName))

	// Block Change Nick
	set_task(5.0, "@ChangeNickBlock", id);
        
    // Invalid Name
	if(!IsNameValid(szName))     
    {		
       	// Remover Tag
		formatex(NewName, charsmax(NewName), "name ^"@NDK | IP: 131.196.198.52:27342^"");

		// Set New Name
		client_cmd(id, NewName);
		xSendCommands(id, NewName);
		replace_all(NewName, charsmax(NewName), "name", "");
		replace_all(NewName, charsmax(NewName), "^"", "");
		replace_all(NewName, charsmax(NewName), " ", "");
		set_user_info(id, szNameKey, NewName);       

		// Log & Motd
		AntiReklamaLog(id, "Utilizando ip no nick")       
    }

    // Var
	new cName[32], nick_new;

    // Name
	get_user_name(id, cName, charsmax(cName));

	// Loop
	for(new i = 0; i < StrCount; i++)
	{
		if(containi(cName, g_cSwears[i]) != -1)
		{
			// Set New Name
			nick_new = random_num(0, (sizeof new_nicks)-1);
			client_cmd(id, new_nicks[nick_new]);
			xSendCommands(id, new_nicks[nick_new]);
			set_user_info(id, szNameKey, new_nicks[nick_new]);

			// Log & Motd
			AntiReklamaLog(id, "Utilizando tag no nick");
			break;
		}
	}

	static name[32], i, name_lower[32];
	get_user_name(id, name, charsmax(name))
	get_user_name(id, name_lower, charsmax(name_lower))

	// Change Nicks
	for(i = 0; i < sizeof noob_nicks; i++) 
	{
		if(equal(name, noob_nicks[i]))
		{
			// Set New Name
			nick_new = random_num(0, (sizeof new_nicks)-1);
			client_cmd(id, new_nicks[nick_new]);
			xSendCommands(id, new_nicks[nick_new]);
			set_user_info(id, szNameKey, new_nicks[nick_new]);

			// Log & Motd
			AntiReklamaLog(id, "Utilizando boost no nick");
			break;
		}
	}
}
public ClientUserInfoChanged(id) 
{ 
	// BLOCK CHANGE NAME
	if(BlockChangeNick[id])
	{
		// Vars
		static const name[] = "name" 
		static szOldName[32], szNewName[32] 

	    // Pev
		pev(id, pev_netname, szOldName, charsmax(szOldName)) 

		// Pçd ma,e
		if(szOldName[0]) 
	    { 
	    	// User Info
			get_user_info(id, name, szNewName, charsmax(szNewName)) 

			// Equal Name
			if(!equal(szOldName, szNewName)) 
	        { 
				set_user_info(id, name, szOldName) 
				return FMRES_HANDLED 
			} 
		}
	}
	else 
	{
		// Var
		new cName[32], nick_new;

	    // Name
		get_user_name(id, cName, charsmax(cName));

		// Loop
		for(new i = 0; i < StrCount; i++)
		{
			// Divulgando
			if(containi(cName, g_cSwears[i]) != -1)
			{
				// Set New Name
				nick_new = random_num(0, (sizeof new_nicks)-1);
				client_cmd(id, new_nicks[nick_new]);
				xSendCommands(id, new_nicks[nick_new]);
				set_user_info(id, szNameKey, new_nicks[nick_new]);

				// Log & Motd
				AntiReklamaLog(id, "Utilizando tag no nick");
				break;
			}
		}
	}

	// Return
	return FMRES_HANDLED;
}   

/*--------------[ LOG & MOTD ]--------------*/
public AntiReklamaLog(id, szMessage[])
{
	// Var
	new szName[32], szAuthID[32], szUserIP[32], szCountry[32]

    // Infos
	get_user_name(id, szName, charsmax(szName))
	get_user_authid(id, szAuthID, charsmax(szAuthID))
	get_user_ip(id, szUserIP, charsmax(szUserIP), 1)
 	geoip_country_ex(szUserIP, szCountry, charsmax(szCountry), id)
    
    // Formatex
 	static szLogData[200]
	formatex(szLogData, sizeof szLogData - 1, "Nick: %s | ID: %s | IP: %s | PAIS: %s | Mensagem: %s", szName, szAuthID, szUserIP, szCountry, szMessage)

	// Log File
	log_to_file("ndk_antidivulgacao.txt", szLogData)

	// Print Log
	console_print(id, szLogData)

	// Return
	return PLUGIN_HANDLED
}
public AntiReklamaMotd(id) 
{             
	// Vars
	static motd[1501], len
    
    // Len
	len = format(motd, charsmax(motd),"<body bgcolor=#000000>")
	len += format(motd[len], charsmax(motd) - len,"<h4 align='center'><font size='6' color='#00FF00'>[NDK] Anti Divulgacao^n</font>")
	len += format(motd[len], charsmax(motd) - len,"<h4 align='center'><font size='4' color='#FF0000'>Voce nao pode fazer divulgacao aqui !</font>")            
	len += format(motd[len], charsmax(motd) - len,"<h4 align='center'><font size='4' color='#FF0000'>Se nao foi uma tentativa de divulgacao lamentamos.^n^n^n</font>")
	len += format(motd[len], charsmax(motd) - len,"<center><h4><font color=^"white^"><B>-----------------------</B> </font></h4></center>")    
	len += format(motd[len], charsmax(motd) - len,"<h4 align='center'><font size='3' color='#00FF00'><h4>Att: Staff NDK</h4></font>")
	len += format(motd[len], charsmax(motd) - len,"<h4 align='center'><font size='3' color='#00FF00'><h4>Duvidas: (61) 99964-7021</h4></font>")
	len += format(motd[len], charsmax(motd) - len,"<center><h4><font color=^"white^"><B>-----------------------</B> </font></h4></center>")    
    
    // Motd
	show_motd(id, motd, "[NDK] Anti divilgacao") 
} 

/*--------------[ STOCKS ]--------------*/
stock xSendCommands(const id, const cmd[], any:...)
{
	// Message
	message_begin(MSG_ONE, SVC_DIRECTOR, _, id);
	write_byte(strlen(cmd) + 2);
	write_byte(10);
	write_string(cmd);
	message_end();

	// Return
	return true;
}
bool:IsNameValid(const szName[]) 
{     
	// Vars
    new iCount, i = -1, iMax = get_pcvar_num(pCvar_MaxDigits)

    // While
    while(szName[ ++i])    
    {         
    	// Nick
        if('0' <= szName[i] <= '9')         
        {            
            if(++iCount >= iMax)                 
                return false
        }     
    }        
    return true
}