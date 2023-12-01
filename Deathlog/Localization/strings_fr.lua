deathlog_strings_fr = {
	-- fonts
	main_font = "Fonts\\FRIZQT__.TTF",
	class_font = "Fonts\\blei00d.TTF",
	death_alert_font = "Fonts\\blei00d.TTF",
	mini_log_font = "Fonts\\blei00d.TTF",
	menu_font = "Fonts\\blei00d.TTF",
	deadliest_creature_container_font = "Fonts\\blei00d.TTF",
	creature_model_quote_font = "Fonts\\MORPHEUS.TTF",
	-- death alerts messages
	death_alert_default_message = "<name> the <race> <class> has been slain\nby <source> at lvl <level> in <zone>.",
	death_alert_default_fall_message = "<name> the <race> <class> fell to\ndeath at lvl <level> in <zone>.",
	death_alert_default_drown_message = "<name> the <race> <class> drowned\n at lvl <level> in <zone>.",
	death_alert_default_slime_message = "<name> the <race> <class> has died from slime.\n at lvl <level> in <zone>.",
	death_alert_default_lava_message = "<name> the <race> <class> drowned in lava.\n at lvl <level> in <zone>.",
	death_alert_default_fire_message = "<name> the <race> <class> has died from fire.\n at lvl <level> in <zone>.",
	death_alert_default_fatigue_message = "<name> the <race> <class> has died from fatigue.\n at lvl <level> in <zone>.",
	-- words
	corpse_word = "Corps",
	of_word = "de",
	minimap_btn_left_click = "|cFF666666Left Click:|r View log",
	minimap_btn_right_click = "|cFF666666Right Click:|r ",
	class_word = "Class",
	killed_by_word = "Killed by",
	zone_instance_word = "Zone/Instance",
	date_word = "Date",
	last_words_word = "Last words",
	death_word = "Death",
	guild_word = "Guild",
	race_word = "Race",
	name_word = "Name",
	show_heatmap = "Show heatmap",
	-- tables
	tab_table = {
		{ value = "ClassStatisticsTab", text = "Class Statistics" },
		{ value = "CreatureStatisticsTab", text = "Creature Statistics" },
		{ value = "InstanceStatisticsTab", text = "Instance Statistics" },
		{ value = "StatisticsTab", text = "Zone Statistics" },
		{ value = "LogTab", text = "Search" },
	},
	instance_tbl = {
		{ 33, "SHADOWFANGKEEP", "Shadowfang Keep" },
		{ 36, "DEADMINES", "Deadmines" },
		{ 34, "STORMWINDSTOCKADES", "Stockades" },
		{ 43, "WAILINGCAVERNS", "Wailing Caverns" },
		{ 47, "RAZORFENKRAUL", "Razorfen Kraul" },
		{ 48, "BLACKFATHOMDEEPS", "Blackfathom Deeps" },
		{ 90, "GNOMEREGAN", "Gnomeregan" },
		{ 189, "SCARLETMONASTERY", "Scarlet Monastery" },
		{ 70, "ULDAMAN", "Uldaman" },
		{ 109, "SUNKENTEMPLE", "Sunken Temple" },
		{ 129, "RAZORFENDOWNS", "Razorfen Downs" },
		{ 209, "ZULFARAK", "Zul'Farak" },
		{ 229, "BLACKROCKSPIRE", "Blackrock Spire" },
		{ 230, "BLACKROCKDEPTHS", "Blackrock Depths" },
		{ 289, "SCHOLOMANCE", "Scholomance" },
		{ 329, "STRATHOLME", "Stratholme" },
		{ 349, "MARAUDON", "Maraudon" },
		{ 389, "RAGEFIRECHASM", "Ragefire Chasm" },
		{ 429, "DIREMAUL", "Diremaul" },
		{ 469, "BLACKWINGLAIR", "Blackwing Lair" },
	},
	instance_map = {
		["Shadowfang Keep"] = 33,
		["Stormwind Stockade"] = 34,
		["Deadmines"] = 36,
		["Wailing Caverns"] = 43,
		["Razorfen Kraul"] = 47,
		["Blackfathom Deeps"] = 48,
		["Uldaman"] = 70,
		["Gnomeregan"] = 90,
		["Sunken Temple"] = 109,
		["Razorfen Downs"] = 129,
		["Scarlet Monastery"] = 189,
		["Zul'Farrak"] = 209,
		["Blackrock Spire"] = 229,
		["Blackrock Depths"] = 230,
		["Scholomance"] = 289,
		["Stratholme"] = 329,
		["Maraudon"] = 349,
		["Ragefire Chasm"] = 389,
		["Dire Maul"] = 429,
		["Blackwing Lair"] = 469,
	},
	deathlog_zone_tbl = {
		["Azeroth"] = 947,
		["Durotar"] = 1411,
		["Mulgore"] = 1412,
		["The Barrens"] = 1413,
		["Kalimdor"] = 1414,
		["Eastern Kingdoms"] = 1415,
		["Alterac Mountains"] = 1416,
		["Arathi Highlands"] = 1417,
		["Badlands"] = 1418,
		["Blasted Lands"] = 1419,
		["Tirisfal Glades"] = 1420,
		["Silverpine Forest"] = 1421,
		["Western Plaguelands"] = 1422,
		["Eastern Plaguelands"] = 1423,
		["Hillsbrad Foothills"] = 1424,
		["The Hinterlands"] = 1425,
		["Dun Morogh"] = 1426,
		["Searing Gorge"] = 1427,
		["Burning Steppes"] = 1428,
		["Elwynn Forest"] = 1429,
		["Deadwind Pass"] = 1430,
		["Duskwood"] = 1431,
		["Loch Modan"] = 1432,
		["Redridge Mountains"] = 1433,
		["Stranglethorn Vale"] = 1434,
		["Swamp of Sorrows"] = 1435,
		["Westfall"] = 1436,
		["Wetlands"] = 1437,
		["Teldrassil"] = 1438,
		["Darkshore"] = 1439,
		["Ashenvale"] = 1440,
		["Thousand Needles"] = 1441,
		["Stonetalon Mountains"] = 1442,
		["Desolace"] = 1443,
		["Feralas"] = 1444,
		["Dustwallow Marsh"] = 1445,
		["Tanaris"] = 1446,
		["Azshara"] = 1447,
		["Felwood"] = 1448,
		["Un'Goro Crater"] = 1449,
		["Moonglade"] = 1450,
		["Silithus"] = 1451,
		["Winterspring"] = 1452,
	},
	id_to_quote = {
		[6] = "Yiieeeee! Me run!",
		[38] = "I see those fools at the Abbey sent some fresh meat for us.",
		[40] = "You no take candle!",
		[80] = "Yiieeeee! Me run!",
		[95] = "Ah, a chance to use this freshly sharpened blade.",
		[97] = "Grrrr... fresh meat!",
		[98] = "More bones to gnaw on...",
		[117] = "Grrrr... fresh meat!",
		[121] = "Ah, a chance to use this freshly sharpened blade.",
		[122] = "Ah, a chance to use this freshly sharpened blade.",
		[123] = "Grrrr... fresh meat!",
		[124] = "Grrrr... fresh meat!",
		[212] = "I'll crush you!",
		[257] = "Yiieeeee! Me run!",
		[314] = "Aber?  Is that you...?  Oh...I'm so hungry, Aber!  SO HUNGRY!!",
		[315] = "I shall spill your blood, &lt;class&gt;!",
		[327] = "You no take candle!",
		[412] = "DARKSHIRE...I HUNGER!!",
		[423] = "Grrrr... fresh meat!",
		[424] = "Grrrr... fresh meat!",
		[426] = "Grrrr... fresh meat!",
		[429] = "Grrrr... fresh meat!",
		[430] = "Grrrr... fresh meat!",
		[431] = "Grrrr... fresh meat!",
		[432] = "Grrrr... fresh meat!",
		[433] = "Grrrr... fresh meat!",
		[434] = "Grrrr... fresh meat!",
		[445] = "Grrrr... fresh meat!",
		[446] = "Grrrr... fresh meat!",
		[452] = "Grrrr... fresh meat!",
		[475] = "You no take candle!",
		[476] = "You no take candle!",
		[478] = "Grrrr... fresh meat!",
		[481] = "Ah, a chance to use this freshly sharpened blade.",
		[500] = "Grrrr... fresh meat!",
		[504] = "Ah, a chance to use this freshly sharpened blade.",
		[568] = "Grrrr... fresh meat!",
		[580] = "Grrrr... fresh meat!",
		[589] = "Feel the power of the Brotherhood!",
		[590] = "Ah, a chance to use this freshly sharpened blade.",
		[639] = "And stay down!",
		[644] = "VanCleef pay big for you heads!",
		[646] = "D'ah! Now you're making me angry!",
		[8891] = "You can't hide from us.  Prepare to burn!",
		[706] = "I gonna make you into mojo!",
		[709] = "Me smash! You die!",
		[712] = "Grrrr... fresh meat!",
		[946] = "Killing you be easy.",
		[1007] = "Grrrr... fresh meat!",
		[1008] = "Grrrr... fresh meat!",
		[1009] = "Grrrr... fresh meat!",
		[1010] = "Grrrr... fresh meat!",
		[1011] = "Grrrr... fresh meat!",
		[1012] = "Grrrr... fresh meat!",
		[1051] = "Feel the power of the Dark Iron Dwarves!",
		[1052] = "Feel the power of the Dark Iron Dwarves!",
		[1053] = "Feel the power of the Dark Iron Dwarves!",
		[1115] = "Crush!",
		[1117] = "Crush!",
		[1121] = "I gonna make you into mojo!",
		[1123] = "I gonna make you into mojo!",
		[1157] = "A living human... soon to be a dead like me.",
		[1158] = "A living human... soon to be a dead like me.",
		[1161] = "Crush!",
		[1162] = "Crush!",
		[1163] = "Crush!",
		[1164] = "Crush!",
		[1165] = "Crush!",
		[1166] = "Crush!",
		[1167] = "Crush!",
		[1172] = "Me no run from &lt;class&gt; like you!",
		[1173] = "Me no run from &lt;class&gt; like you!",
		[1174] = "Me no run from &lt;class&gt; like you!",
		[1175] = "Me no run from &lt;class&gt; like you!",
		[1176] = "Me no run from &lt;class&gt; like you!",
		[1179] = "I'll crush you!",
		[1180] = "Me smash! You die!",
		[1197] = "Crush!",
		[1202] = "Me no run from &lt;class&gt; like you!",
		[1211] = "I'll cut you!",
		[1222] = "Wahehe! I'm taking you down with me!",
		[1236] = "You no take candle!",
		[9545] = "",
		[9547] = "",
		[1657] = "Here to visit the family?  Die, fool!",
		[1674] = "Grrrr... fresh meat!",
		[1675] = "Grrrr... fresh meat!",
		[1716] = "Tell the Warden this prison is ours now!",
		[1755] = "The Defias shall succeed! No meek adventurer will stop us!",
		[1756] = "A living legend...",
		[1770] = "The Sons of Arugal will rise against all who challenge the power of the Moonrage!",
		[1939] = "Grrrr... fresh meat!",
		[1940] = "Grrrr... fresh meat!",
		[1941] = "Grrrr... fresh meat!",
		[1942] = "Grrrr... fresh meat!",
		[10184] = "How fortuitous. Usually, I must leave my lair in order to feed.",
		[10373] = "What the... nobody cleanses a furbolg in MY camp!  Face the wrath of Xabraxxis!",
		[10440] = "I shall take great pleasure in taking this poor wretch's life!  It's not too late, she needn't suffer in vain.  Turn back and her death shall be merciful!",
		[2252] = "I'll crush you!",
		[2253] = "I'll crush you!",
		[2254] = "I'll crush you!",
		[2287] = "I'll crush you!",
		[2338] = "Carnage!  May I spill blood in His name!",
		[2339] = "Carnage!  May I spill blood in His name!",
		[2564] = "I'll crush you!",
		[2566] = "I'll crush you!",
		[2567] = "I'll crush you!",
		[2691] = "Attack, my sisters! The troll must not escape!",
		[2716] = "I'll crush you!",
		[2717] = "I'll crush you!",
		[2748] = "Awake, ye servants! Defend the Disks!",
		[10940] = "Leave this place!",
		[2775] = "You've plundered our treasures too long.  Prepare to meet your watery grave!",
		[10996] = "Be cleansed by blade, filth!",
		[11075] = "Human flesh... must feed!",
		[2949] = "Grrrr... fresh meat!",
		[2950] = "Grrrr... fresh meat!",
		[2951] = "Grrrr... fresh meat!",
		[11443] = "I'll crush you!",
		[3275] = "I am slain!  Summon Verog!",
		[3276] = "You will be easy prey, &lt;class&gt;.",
		[3277] = "You will be easy prey, &lt;class&gt;.",
		[3278] = "My talons will shred your puny body, Orc.",
		[3282] = "There's the stolen shredder! Stop it or Lugwizzle will have our hides!",
		[3284] = "Get away from there!",
		[3285] = "Get away from there!",
		[11502] = "BY FIRE BE PURGED!",
		[3395] = "I am summoned!  Intruders, come to my tent and face your death!",
		[3397] = "I am slain!  Summon Verog!",
		[3667] = "Finally, my soul may rest... Oh, dearest Cerellean...",
		[3671] = "None can stand against the Serpent Lords!",
		[11886] = "Well, well. Looks like we got ourselves some competition. Get 'em boys!",
		[3927] = "I can't believe it! You've destroyed my pack... Now face my wrath!",
		[3975] = "Ah - I've been waiting for a real challenge!",
		[3976] = "At your side, milady!",
		[4003] = "I think the sounds came from over here. We'd better check it out.",
		[4004] = "What's going on here? Piznik! I knew we shouldn't have let you stick around!",
		[4062] = "No sign of the final explosives shipment to the west either.  Where are those lollygaggers?",
		[4275] = "Another falls!",
		[4287] = "The light condemns all who harbor evil.  Now you will die!",
		[4299] = "The light condemns all who harbor evil.  Now you will die!",
		[4301] = "The light condemns all who harbor evil.  Now you will die!",
		[4484] = "Assassins from that cult you found... Let's get moving before someone else finds us out here.",
		[4494] = "The light condemns all who harbor evil.  Now you will die!",
		[4540] = "The light condemns all who harbor evil.  Now you will die!",
		[12858] = "Everyone ready?",
		[12918] = "No!  You cannot be stronger than the Foulweald!  No!!",
		[12922] = "Alright I'm going! Stop yelling!",
		[4966] = "Please... please... Miss Proudmore. I didn't mean to...",
		[4969] = "All right, boss. You sure though? Just seems like a waste of good practice.",
		[4971] = "Whoa! This is way more than what I bargained for, you're on your own, Slim!",
		[5234] = "I'll crush you!",
		[5239] = "Me smash! You die!",
		[5240] = "I'll crush you!",
		[5255] = "Grrrr... fresh meat!",
		[5474] = "I'll crush you!",
		[6090] = "Ok, enough!  I give up!",
		[6180] = "Feel the power of the Brotherhood!",
		[6182] = "You won't ruin my lands, you scum!",
		[6221] = "A foul trogg if ever I saw one.  Die!",
		[6238] = "Ready when you are, warrior.",
		[6784] = "Okay, okay... gimmie a minute to rest now. You gone and beat me up good.",
		[7033] = "I'll crush you!",
		[7603] = "A foul trogg if ever I saw one.  Die!,",
	},
}
