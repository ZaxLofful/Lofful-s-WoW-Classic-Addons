--[[ AUTOGENERATED - DO NOT MODIFY]]
--[[ See license.txt for license and copyright information ]]
if (GetLocale() ~= "ptPT" and GetLocale() ~= "ptBR") then return end
select(2, ...).SetupGlobalFacade()

GameObjectNames = {
	[32] = "Sunken Chest",
	[47] = "Wanted: Lieutenant Fangore",
	[52] = "Fall of Gurubashi",
	[54] = "The Emperor\'s Tomb",
	[55] = "A half-eaten body",
	[56] = "Rolf\'s corpse",
	[57] = "Moon Over the Vale",
	[58] = "Gri\'lek the Wanderer",
	[59] = "Mound of loose dirt",
	[60] = "Wanted: Gath\'Ilzogg",
	[61] = "A Weathered Grave",
	[68] = "Wanted Poster",
	[257] = "Suspicious Barrel",
	[259] = "Half-buried Barrel",
	[261] = "Damaged Crate",
	[270] = "Unguarded Thunder Ale Barrel",
	[271] = "Miners\' League Crates",
	[272] = "MacGrann\'s Meat Locker",
	[276] = "Shimmerweed Basket",
	[287] = "Bookie Herod\'s Records",
	[288] = "Bookie Herod\'s Strongbox",
	[331] = "Loose Soil",
	[333] = "Ancient Relic",
	[334] = "Ancient Relic",
	[375] = "Tirisfal Pumpkin",
	[711] = "Wanted!",
	[759] = "The Holy Spring",
	[1560] = "Storage Chest",
	[1561] = "Sealed Crate",
	[1562] = "Marshal Haggard\'s Chest",
	[1571] = "Dusty Spellbooks",
	[1593] = "Corpse Laden Boat",
	[1609] = "Dragonmaw Catapult",
	[1627] = "Dalaran Crate",
	[1673] = "Fel Cone",
	[1723] = "Mudsnout Blossom",
	[1740] = "Syndicate Documents",
	[1760] = "Weathered Bookcase",
	[1765] = "Worn Wooden Chest",
	[1767] = "Helcular\'s Grave",
	[1768] = "Flame of Azel",
	[1769] = "Flame of Veraz",
	[1770] = "Flame of Uzel",
	[2008] = "Dangerous!",
	[2059] = "A Dwarven Corpse",
	[2076] = "Bubbling Cauldron",
	[2083] = "Bloodsail Correspondence",
	[2084] = "Musquash Root",
	[2086] = "Bloodsail Charts",
	[2087] = "Bloodsail Orders",
	[2553] = "A Soggy Scroll",
	[2554] = "Cortello\'s Riddle",
	[2555] = "Musty Scroll",
	[2556] = "Cortello\'s Treasure",
	[2560] = "Half-Buried Bottle",
	[2576] = "Altar of the Tides",
	[2652] = "Ebenezer Rustlocke\'s Corpse",
	[2653] = "Lesser Bloodstone Deposit",
	[2656] = "Waterlogged Letter",
	[2688] = "Keystone",
	[2689] = "Stone of West Binding",
	[2690] = "Stone of Outer Binding",
	[2691] = "Stone of East Binding",
	[2701] = "Iridescent Shards",
	[2702] = "Stone of Inner Binding",
	[2704] = "Cache of Explosives",
	[2707] = "Maiden\'s Folly Charts",
	[2709] = "Maiden\'s Folly Log",
	[2710] = "Spirit of Silverpine Log",
	[2712] = "Calcified Elven Gem",
	[2713] = "Wanted Board",
	[2714] = "Alterac Granite",
	[2716] = "Trelane\'s Chest",
	[2717] = "Trelane\'s Footlocker",
	[2718] = "Trelane\'s Lockbox",
	[2734] = "Waterlogged Chest",
	[2739] = "Chest of the Black Feather",
	[2740] = "Chest of the Raven Claw",
	[2741] = "Chest of the Sky",
	[2742] = "Chest of Nesting",
	[2744] = "Giant Clam",
	[2867] = "Excavation Supply Crate",
	[2868] = "Crumpled Map",
	[2875] = "Battered Dwarven Skeleton",
	[2907] = "Water Pitcher",
	[2908] = "Sealed Supply Crate",
	[3076] = "Dirt-stained Map",
	[3189] = "Attack Plan: Valley of Trials",
	[3190] = "Attack Plan: Sen\'jin Village",
	[3192] = "Attack Plan: Orgrimmar",
	[3236] = "Gnomish Toolbox",
	[3238] = "Chen\'s Empty Keg",
	[3239] = "Benedict\'s Chest",
	[3240] = "Taillasher Eggs",
	[3290] = "Stolen Supply Sack",
	[3525] = "The Altar of Fire",
	[3640] = "Laden Mushroom",
	[3643] = "Old Footlocker",
	[3644] = "Bael Modan Flying Machine",
	[3646] = "General Twinbraid\'s Strongbox",
	[3661] = "Weapon Crate",
	[3685] = "Silithid Mound",
	[3737] = "Bubbling Fissure",
	[3767] = "Drizzlik\'s Emporium",
	[3768] = "Fragile - Do Not Drop",
	[3972] = "WANTED",
	[4072] = "Main Control Valve",
	[4141] = "Control Console",
	[4406] = "Webwood Eggs",
	[4608] = "Timberling Sprout",
	[6751] = "Strange Fruited Plant",
	[6752] = "Strange Fronded Plant",
	[7510] = "Sprouted Frond",
	[7923] = "Denalan\'s Planter",
	[9630] = "Flagongut\'s Fossil",
	[10076] = "Scrying Bowl",
	[12666] = "Twilight Tome",
	[13872] = "Mathystra Relic",
	[16393] = "Ancient Flame",
	[17182] = "Buzzbox 827",
	[17183] = "Buzzbox 411",
	[17184] = "Buzzbox 323",
	[17185] = "Buzzbox 525",
	[17188] = "The Lay of Ameth\'Aran",
	[17189] = "The Fall of Ameth\'Aran",
	[17282] = "Plant Bundle",
	[17783] = "Ancient Statuette",
	[19015] = "Elune\'s Tear",
	[19016] = "Stardust Covered Bush",
	[19021] = "Rusty Chest",
	[19022] = "Worn Chest",
	[19024] = "Hidden Shrine",
	[19027] = "Tome of Mel\'Thandris",
	[19541] = "Deepmoss Eggs",
	[19861] = "Henrig Lonebrow\'s Journal",
	[19877] = "Velinde\'s Locker",
	[19901] = "Circle of Imprisonment",
	[19904] = "Mok\'Morokk\'s Snuff",
	[19905] = "Mok\'Morokk\'s Grog",
	[19906] = "Mok\'Morokk\'s Strongbox",
	[20352] = "Circle of Imprisonment",
	[20359] = "Egg of Onyxia",
	[20691] = "Cozzle\'s Footlocker",
	[20727] = "Gizmorium Shipping Crate",
	[20805] = "Rizzle\'s Unguarded Plans",
	[20807] = "Ancient Brazier",
	[20925] = "Captain\'s Footlocker",
	[20985] = "Loose Dirt",
	[20992] = "Black Shield",
	[21042] = "Theramore Guard Badge",
	[22245] = "Sack of Meat",
	[22550] = "Draenethyst Crystals",
	[24776] = "Yuriv\'s Tombstone",
	[24798] = "Sundried Driftwood",
	[28024] = "Caravan Chest",
	[28604] = "Scattered Crate",
	[32569] = "Galen\'s Strongbox",
	[35251] = "Karnitol\'s Chest",
	[35252] = "Ancient Relic",
	[50961] = "Malem Chest",
	[58369] = "Stolen Iron Chest",
	[58595] = "Burning Blade Stash",
	[61934] = "Brazier of the Dormant Flame",
	[61935] = "Regulator Valve",
	[61936] = "Fuel Control Valve",
	[83763] = "Stolen Books",
	[85562] = "Ironband\'s Strongbox",
	[85563] = "Dead-tooth\'s Strongbox",
	[86492] = "Crate of Elunite",
	[89931] = "Bath\'rah\'s Cauldron",
	[92013] = "Tome of the Cabal",
	[92423] = "Damaged Chest",
	[93192] = "Heartswood",
	[102984] = "Bink\'s Toolbox",
	[102985] = "Balnir Snapdragons",
	[102986] = "Ju-Ju Heap",
	[103600] = "Andron\'s Bookshelf",
	[104564] = "Bingles\'s Toolbucket",
	[104569] = "Bingles\'s Toolbucket",
	[104574] = "Bingles\'s Toolbucket",
	[104575] = "Bingles\'s Blastencapper",
	[112948] = "Intrepid\'s Locked Strongbox",
	[113791] = "Brazier of Everfount",
	[123330] = "Buccaneer\'s Strongbox",
	[123462] = "The Jewel of the Southsea",
	[126158] = "Tallonkai\'s Dresser",
	[138492] = "Shards of Myzrael",
	[140971] = "Gahz\'ridian",
	[141931] = "Hippogryph Egg",
	[141980] = "Spectral Lockbox",
	[142071] = "Egg-O-Matic",
	[142127] = "Rin\'ji\'s Secret",
	[142151] = "Sealed Barrel",
	[142179] = "Solarsal Gazebo",
	[142181] = "Stolen Cargo",
	[142185] = "Flame of Byltan",
	[142186] = "Flame of Lahassa",
	[142187] = "Flame of Imbel",
	[142188] = "Flame of Samha",
	[142191] = "Horde Supply Crate",
	[142195] = "Woodpaw Battle Map",
	[142958] = "Feralas: A History",
	[143979] = "Cage Door",
	[143980] = "Gordunni Scroll",
	[144053] = "Scrimshank\'s Surveying Gear",
	[144054] = "Shay\'s Chest",
	[144063] = "Equinex Monolith",
	[144064] = "Gordunni Dirt Mound",
	[144068] = "Third Witherbark Cage",
	[144071] = "Highvale Records",
	[144072] = "Highvale Notes",
	[144073] = "Highvale Report",
	[147557] = "Stolen Silver",
	[148498] = "Altar of Suntara",
	[148499] = "Felix\'s Box",
	[148503] = "Fire Plume Ridge Hot Spot",
	[148506] = "Twilight Artifact",
	[148513] = "Tablet of Jin\'yael",
	[148514] = "Tablet of Markri",
	[148515] = "Tablet of Sael\'hai",
	[148516] = "Tablet of Beth\'Amara",
	[149030] = "Sentry Brazier",
	[149036] = "Marvon\'s Chest",
	[149047] = "Torch of Retribution",
	[149480] = "Rune of Jin\'yael",
	[149481] = "Rune of Beth\'Amara",
	[149482] = "Rune of Markri",
	[149483] = "Rune of Sael\'hai",
	[149502] = "Hoard of the Black Dragonflight",
	[150075] = "Wanted Poster",
	[150140] = "Arcane Focusing Crystal",
	[151286] = "Kaldorei Tome of Summoning",
	[152094] = "Hyacinth Mushroom",
	[153123] = "Kim\'jael\'s Equipment",
	[153239] = "Wildkin Feather",
	[153556] = "Thaurissan Relic",
	[154357] = "Glinting Mud",
	[157936] = "Un\'Goro Dirt Pile",
	[160445] = "Sha\'ni Proudtusk\'s Remains",
	[160840] = "Soft Dirt Mound",
	[161504] = "A Small Pack",
	[161505] = "A Wrecked Raft",
	[161521] = "Research Equipment",
	[161526] = "Crate of Foodstuffs",
	[161557] = "Milly\'s Harvest",
	[164662] = "Equipment Boxes",
	[164909] = "Wrecked Row Boat",
	[164953] = "Large Leather Backpacks",
	[164954] = "Zukk\'ash Pod",
	[164955] = "Northern Crystal Pylon",
	[164956] = "Western Crystal Pylon",
	[164957] = "Eastern Crystal Pylon",
	[164958] = "Bloodpetal Sprout",
	[166863] = "Fresh Threshadon Carcass",
	[169294] = "Tablet of the Seven",
	[173265] = "Banheiro de Madeira",
	[174682] = "Cuidado com o Pterrordax",
	[174728] = "Caixote Danificado",
	[175165] = "Baú do Aurora de Prata",
	[175166] = "Baú do Véu das Brumas",
	[175207] = "Criatura Marinha Encalhada",
	[175226] = "Criatura Marinha Encalhada",
	[175227] = "Criatura Marinha Encalhada",
	[175230] = "Criatura Marinha Encalhada",
	[175233] = "Criatura Marinha Encalhada",
	[175264] = "Essência da Reprodução",
	[175320] = "PROCURA-SE: Lodofundo!",
	[175329] = "Reservas de Castanha Bosquenero",
	[175330] = "Reservas de Fruta Bosquenero",
	[175331] = "Reservas de Grão Bosquenero",
	[175384] = "Ovo de Mantícora de Alcândora",
	[175407] = "Pena Lunamarca",
	[175524] = "Cristal Vermelho Misterioso",
	[175565] = "Ovo Alienígena",
	[175566] = "Erva-do-emo",
	[175586] = "Carroça de Jaron",
	[175587] = "Caixote Danificado",
	[175629] = "Suprimentos do Jaron",
	[175704] = "Carta Chamuscada",
	[175708] = "Caixote de Suprimentos da Encruzilhada",
	[175802] = "Cofre Pequeno",
	[175888] = "Fragmento da Relíquia dos Altaneiros",
	[175891] = "Fragmento da Relíquia dos Altaneiros",
	[175892] = "Fragmento da Relíquia dos Altaneiros",
	[175893] = "Fragmento da Relíquia dos Altaneiros",
	[175894] = "Embrulho da Janice",
	[175924] = "Armário Trancado",
	[175925] = "Casinha",
	[175926] = "Diário da Sra. Dalson",
	[175928] = "Agave Incendia",
	[175944] = "Fogo da Vida Sagrado",
	[176091] = "Caldeirão de Lenha Morta",
	[176092] = "Caixa de Explosivos",
	[176115] = "Pôster de Procura-se – Arnak Temível Totem",
	[176116] = "Cabeça da Boneca de Pâmela",
	[176142] = "Parte Esquerda da Boneca de Pâmela",
	[176143] = "Parte Direita da Boneca de Pâmela",
	[176145] = "Monumento do Josefo Trilharrubra",
	[176158] = "Braseiro da Dor",
	[176159] = "Braseiro da Malícia",
	[176160] = "Braseiro do Sofrimento",
	[176161] = "Braseiro do Ódio",
	[176189] = "Tartaruga Marinha Descarnada",
	[176190] = "Tartaruga Marinha Encalhada",
	[176191] = "Tartaruga Marinha Encalhada",
	[176196] = "Tartaruga Marinha Encalhada",
	[176197] = "Tartaruga Marinha Encalhada",
	[176198] = "Tartaruga Marinha Encalhada",
	[176208] = "Crânio de Horgus",
	[176209] = "Espada Estilhaçada de Marduk",
	[176210] = "Command Tent",
	[176213] = "Sangue dos Heróis",
	[176344] = "Baú de Documentos nº 1",
	[176361] = "Caldeirão do Flagelo",
	[176392] = "Caldeirão do Flagelo",
	[176393] = "Caldeirão do Flagelo",
	[176581] = "Cristal da Mão de Iruxos",
	[176582] = "Armadilha de Lagostim",
	[176634] = "Baú de Kerlonian",
	[176751] = "Ossos de Kodo",
	[176753] = "Erva-do-demo",
	[176785] = "Caixote de Munições",
	[176793] = "Feixe de Lenha",
	[177240] = "Monte de Terra Solta",
	[177289] = "Caldeirão do Flagelo",
	[177404] = "Altar of Elune",
	[177464] = "Cupinzeiro Grande",
	[177490] = "Caixote da Serraria de Beiranorte",
	[177491] = "Barril de Cupins",
	[177525] = "Moonkin Stone",
	[177624] = "Bolsa de Demônios de Zabraxxis",
	[177667] = "Pergaminho Rasgado",
	[177673] = "Serpent Statue",
	[177675] = "Monturo de Terra",
	[177747] = "Arquivos de Quel\'Thalas",
	[177750] = "Broto Fúngico Lunar",
	[177784] = "Marisco de Casca Mole Gigante",
	[177785] = "Recipiente de Adorno",
	[177786] = "Baú de Rodovalho",
	[177787] = "Diário de Rodovalho",
	[177789] = "Livro-caixa do Augustus",
	[177790] = "[Strange Lockbox]",
	[177792] = "[Strange Lockbox]",
	[177794] = "Cofre Estranho",
	[177804] = "Restos Humanos Esquartejados",
	[177805] = "Restos Humanos Esquartejados",
	[177806] = "Restos Humanos Esquartejados",
	[177844] = "[Strange Lockbox]",
	[177904] = "Pôster de Procura-se: Besseleth",
	[177926] = "Semente de Gaia",
	[177929] = "Monturo de Terra de Gaia",
	[178084] = "Baú do Félix",
	[178085] = "Balde de Parafusos do Félix",
	[178087] = "Picareta de Thazz\'ril",
	[178090] = "Túmulo de Marla",
	[178144] = "Baú dos Trolls",
	[178247] = "Naga Brazier",
	[178553] = "Receptáculo Colme\'Ashi",
	[179565] = "Relicário Empoeirado",
	[179827] = "Procurados/Desaparecidos/Achados e Perdidos",
	[179908] = "Ferramentas Perdidas de Escoriárvore",
	[179910] = "Cesta de Piquenique do Banha",
	[180435] = "[Noggle\'s Satchel]",
	[180448] = "Pôster de Procura-se: Agarramata",
	[180501] = "Fragmento de Tabuleta do Crepúsculo",
	[180510] = "Orbe de Vidência de Solanian",
	[180511] = "Pergaminho de Magia do Flagelo",
	[180512] = "Diário de Solanian",
	[180516] = "Altar de Dath\'Remar",
	[180600] = "Caixote de Cristal de Mana Instável",
	[180917] = "Carregamento da Capitão Kelisendra",
	[180918] = "Procura-se: Thaelis, o Famélico",
	[180921] = "Amostra de Solo Infecto",
	[181011] = "Diário do Magíster Ocaso",
	[181107] = "Contêiner de Armas",
	[181110] = "Tomo Encharcado",
	[181133] = "Suprimentos de Maurício Raposo",
	[181138] = "Planos Noctiélficos: An\'daroth",
	[181139] = "Planos Noctiélficos: An\'owyn",
	[181140] = "Planos Noctiélficos: Divinação dos Sin\'dorei",
	[181147] = "Pôster de Procura-se",
	[181148] = "Cadáveres Mumificados de Troll",
	[181150] = "Diário Empoeirado",
	[181151] = "Lodo Fúlgido",
	[181153] = "Pôster de Procura-se: Kel\'gash, o Perverso",
	[181157] = "Altar da Maestria das Marés",
	[181238] = "Baú Cheio de Mossas",
	[181239] = "Baú Gasto",
	[181250] = "Cavalete de Carne Crua",
	[181251] = "Cavalete de Carne Defumada",
	[181252] = "Cavalete de Peixe Fresco",
	[181283] = "[Emitter Spare Part]",
	[181359] = "Cristal da Lua Noctiélfico",
	[181372] = "Folhespinho do Fogo do Inferno",
	[181433] = "Cristal de Poder Irradiado",
	[181574] = "Cristal Brilhante",
	[181579] = "Sinalizador Sul",
	[181581] = "Sinalizador Oeste",
	[181582] = "Ninho de Kaliri",
	[181598] = "Gêiser Silitista",
	[181606] = "Altar de Haal\'eshi",
	[181616] = "School of Red Snapper",
	[181620] = "Caixote Fechado",
	[181626] = "Caixotes Deformados",
	[181627] = "Cavalete de Armas",
	[181628] = "Barril Vazio",
	[181629] = "Cofre Sagrado",
	[181636] = "Altar of Naias",
	[181638] = "Pôster de Procura-se",
	[181643] = "Restos Mortais de Barbapena",
	[181644] = "Boca-de-leão Lazúli",
	[181649] = "Diário de Barbapena",
	[181665] = "Baú de Enterro",
	[181672] = "Efígie do Homem de Palha",
	[181674] = "Mapa Náutico",
	[181675] = "Bússola Náutica",
	[181680] = "Cogumelo Secampânulo",
	[181681] = "Cálice de Eluna",
	[181683] = "Relíquia Antiga",
	[181690] = "Monturo de Terra Fértil",
	[181694] = "Naga Flag",
	[181696] = "Árvore Oca",
	[181697] = "Monte de Folhas",
	[181698] = "Pedra do Caos",
	[181699] = "Barril de Sujeira",
	[181746] = "Equipamento do Xote",
	[181748] = "Cristal de Sangue",
	[181756] = "Livro Antigo e Surrado",
	[181757] = "Grão de Pinhoquieto",
	[181758] = "Monturo de Terra",
	[181770] = "Cristal Corrompido",
	[181780] = "Altered Bloodmyst Crystal",
	[181825] = "Concealed Control Panel",
	[181854] = "Pera Oriental",
	[181889] = "Pôster de Procura-se",
	[181891] = "Cogumelo de Sangue",
	[181892] = "Cornofétido Aquático",
	[181893] = "Polísporo Ruinoso",
	[181894] = "Fungo Conífero Vil",
	[181897] = "Lágrima de Ysera",
	[181898] = "Suprimentos Médicos",
	[181956] = "Braseiro Dourado",
	[181964] = "[Statue of Queen Azshara]",
	[181981] = "Osso de Dragão",
	[181988] = "[Ever-burning Pyre]",
	[182026] = "[Sun Gate]",
	[182032] = "[Galaen\'s Journal]",
	[182050] = "Caixa de Cogumelos",
	[182053] = "Chapéu-opalino",
	[182069] = "Esporângio Maduro",
	[182095] = "Cogumelo Surpresa",
	[182115] = "Pôster de Procura-se",
	[182122] = "Pertences de Ikeyen",
	[182127] = "Flor Corrompida",
	[182166] = "Plano de Ataque Ango\'rosh",
	[182184] = "Manual de Venenos Lamadaga",
	[182263] = "First Burning Blade Pyre",
	[182264] = "Second Burning Blade Pyre",
	[182369] = "Blazing Warmaul Pyre",
	[182392] = "Quadro de Avisos de Garadar",
	[182393] = "Quadro de Avisos de Telaar",
	[182505] = "Eye of Veil Shienor",
	[182507] = "Eye of Veil Reskk",
	[182532] = "[Nazzivus Monument Glyphs]",
	[182542] = "Caixa Lacrada",
	[182549] = "Planos dos Orcs Vis",
	[182584] = "Ossos Inquietos",
	[182587] = "Pôster de Procura-se",
	[182789] = "Esqueleto Pisoteado",
	[182804] = "Mistérios da Luz",
	[182941] = "Orbe de Grishnath",
	[183147] = "Ovo Misterioso",
	[183266] = "Footlocker",
	[183267] = "Dresser",
	[183268] = "Bookshelf",
	[183269] = "Weapon Rack",
	[183507] = "Archmage Vargoth\'s Orb",
	[183789] = "Objeto Estranho",
	[183805] = "Cava-cava Hiper-rotacional",
	[183806] = "Garra de Sucção Servopneumática",
	[183807] = "Analisador de Terreno Multispectro",
	[183808] = "Vagão Cheio de Explosivos",
	[183811] = "Pôster de Procura-se",
	[183935] = "Peça de Aníquilus",
	[184073] = "Plataforma de Teleporte Etéreo",
	[184075] = "Recipiente de Energia do Teleporte",
	[184108] = "Dragon Skeleton",
	[184115] = "Mochila de Arelion",
	[184121] = "Compêndio de Krasus - Capítulo 1",
	[184122] = "Compêndio de Krasus - Capítulo 2",
	[184123] = "Compêndio de Krasus - Capítulo 3",
	[184246] = "Heavy Iron Portcullis",
	[184289] = "Portal Kruul",
	[184290] = "Portal Xilus",
	[184300] = "Foco Necromântico",
	[184383] = "Ethereum Transponder Zeta",
	[184414] = "Portal Grimh",
	[184415] = "Portal Kaalez",
	[184433] = "Fragmento de Bomba de Mana",
	[184466] = "Cofre de Metal",
	[184478] = "Mochila Rasgada da Peregrina",
	[184504] = "Barril de Cerveja Malho Sangrento",
	[184588] = "Captain Tyralius\'s Prison",
	[184589] = "Equipamento Diagnóstico",
	[184631] = "Sementino do Bosque",
	[184684] = "Ovo de Esfola-pedra Vorasga",
	[184689] = "Cristal da Mina de Draenetista",
	[184701] = "Shadowmoon Tuber Mound",
	[184715] = "Caldeirão Amaldiçoado",
	[184716] = "Baú dos Serpentálios",
	[184725] = "Bomba de Mana",
	[184726] = "Tambor do Clã Senhor do Trovão",
	[184727] = "Flecha do Clã Senhor do Trovão",
	[184728] = "Tabuleta do Clã Senhor do Trovão",
	[184744] = "Narguilé de T\'chali",
	[184793] = "Baú Primitivo",
	[184795] = "Ovo Podre de Arakkoa",
	[184825] = "Tomo de Lashh\'an",
	[184850] = "[Sunhawk Portal Controller]",
	[184859] = "Núcleo de Força de Aníquilus",
	[184906] = "Conversor de Força",
	[184945] = "Pôster de Procura-se",
	[184946] = "Pôster de Procura-se",
	[184950] = "A Primeira Profecia",
	[184967] = "A Segunda Profecia",
	[184968] = "A Terceira Profecia",
	[184969] = "A Quarta Profecia",
	[184979] = "Infernal Forjado na Morte",
	[185010] = "Unidade de Controle de Arcano",
	[185035] = "Pôster de Procura-se",
	[185060] = "Console de Controle de Aníquilus",
	[185124] = "Solo Vulcânico Fértil",
	[185128] = "[Lianthe\'s Strongbox]",
	[185147] = "Solo Vulcânico Fértil",
	[185148] = "Solo Vulcânico Fértil",
	[185152] = "Sacola de Grulloc",
	[185165] = "Comunicador da Legião",
	[185182] = "Cristal Etervinha",
	[185211] = "Ovo Amaldiçoado",
	[185216] = "Sinal de Fogo de Safira",
	[185217] = "Sinal de Fogo de Esmeralda",
	[185218] = "Sinal de Fogo de Violeta",
	[185219] = "Sinal de Fogo de Pedra-sangrenta",
	[185220] = "[Massive Treasure Chest]",
	[185234] = "Altar de Gorgrom",
	[185302] = "Esconderijo do Gordito",
	[185309] = "Altar of Goc",
	[186283] = "Shipwreck Debris",
	[186287] = "Blackhoof Cage",
	[186301] = "Armamentos dos Casco Negro",
	[186324] = "Hyal Family Monument",
	[186325] = "Guano de Garra-negra",
	[186329] = "[Stonemaul Clan Banner]",
	[186332] = "Restos de Ogro",
	[186397] = "Artefato do Portão de Aço",
	[186420] = "Documentos da Camarilha",
	[186423] = "Espanta-bruxa",
	[186426] = "Pôster de Procura-se",
	[186427] = "Bala de Canhão da Guarda Oeste",
	[186432] = "Canhão da Angra",
	[186441] = "Power Core Fragment",
	[186450] = "Carga do Zepelim",
	[186463] = "Rabo-de-serpe",
	[186565] = "Arpão Esfola-dragão Cerimonial",
	[186585] = "Pergaminho de Pele de Dragão",
	[186586] = "The Thane\'s Pyre",
	[186587] = "Tabuleta da Caveira de Dragão",
	[186599] = "Frozen Waterfall",
	[186607] = "Artefato sagrado",
	[186619] = "Armadilha Disparada",
	[186632] = "Barril Enânico",
	[186640] = "Código Perdido",
	[186649] = "Santuário de Cunhalva",
	[186662] = "Bornal de Reagentes",
	[186679] = "Pacote do Boticário",
	[186718] = "Broken Tablet",
	[186828] = "Manual de Operações do Arpão",
	[186863] = "Baleheim Bonfire",
	[186894] = "Alavanca de Arpão Grande",
	[186912] = "Caixote de Suprimentos de Valgarde",
	[186938] = "Pedra Solta",
	[186944] = "Monturo de Terra",
	[186949] = "School of Tasty Reef Fish",
	[186950] = "Ferramentas de Construção",
	[186954] = "Barril Grande",
	[186955] = "Corda Industrial Resistente",
	[186958] = "Bancada de Trabalho",
	[187273] = "Pegada Suspeita",
	[187561] = "Prisão Arcana",
	[187565] = "Ancião Atkanok",
	[187577] = "Estandarte do Brado Guerreiro",
	[187655] = "Bolsa de Ovos de Nerub\'ar",
	[187659] = "Caixote de Munições do Brado Guerreiro",
	[187662] = "\"Ancião Kesuk\"",
	[187663] = "\"Ancião Sagani\"",
	[187664] = "\"Ancião Takret\"",
	[187670] = "Objeto Ritual Morsano",
	[187671] = "Objeto Ritual Morsano",
	[187683] = "Guéri-guéri Hidráulico",
	[187689] = "Coisas da Abília",
	[187697] = "Ferramentas do Pilantra",
	[187851] = "Altar dos Sectários",
	[187879] = "Den of Dying Plague Cauldron",
	[187885] = "Badulaque do Gafamafo",
	[187886] = "Badulaque do Mafagafo",
	[187905] = "Ovo Reluzente Gigante",
	[187980] = "Suprimentos de Primeiros Socorros",
	[187981] = "Cocô de Lobo",
	[187984] = "Válvula da Estação Oeste",
	[187985] = "Válvula da Estação Norte",
	[187986] = "Válvula da Estação Central",
	[187987] = "Válvula da Estação Sul",
	[188066] = "Alabarda de Guerra do Kaw",
	[188100] = "Monitor Geológico de Gelarra",
	[188101] = "Monitor Geológico de Gelarra",
	[188102] = "Monitor Geológico de Gelarra",
	[188103] = "Monitor Geológico de Gelarra",
	[188104] = "Liberação do Carrinho",
	[188112] = "Farshire Grain",
	[188113] = "Moita de Frutagelo",
	[188120] = "Campos, Fábricas e Oficinas",
	[188131] = "Caixote de Vinho",
	[188133] = "Ovo de Dragão Azul",
	[188140] = "Mana Cristalizado",
	[188141] = "Filactério Congelado",
	[188163] = "Corda do Sino",
	[188164] = "Suprimentos de Kaskala",
	[188237] = "Armamentos da Horda",
	[188264] = "Primeira Placa Rúnica",
	[188288] = "Segunda Placa Rúnica",
	[188289] = "Terceira Placa Rúnica",
	[188345] = "Campaneves Cintilantes",
	[188351] = "Aguapé",
	[188359] = "Armadilha para Caranguejo de Tua\'kea",
	[188418] = "Procura-se!",
	[188419] = "Ancião Mana\'loa",
	[188422] = "Pérola das Profundezas",
	[188423] = "Braseiro Aceso",
	[188442] = "Minério Composto",
	[188458] = "Vidente de Zeb\'Halak",
	[188461] = "Tabuletas Drakkari",
	[188463] = "Mecanismo de Anub\'ar",
	[188489] = "Lilás-rubi",
	[188499] = "Vaso Canópico Drakkari",
	[188530] = "Oferenda Sagrada Drakkari",
	[188596] = "Pedestal do Loken",
	[188600] = "Moita de Brumadeira",
	[188601] = "Raiz-doce",
	[188649] = "Pôster de Procura-se",
	[188666] = "Casinha de Pinho Âmbar",
	[188670] = "Raiz Negra",
	[188673] = "Balista de Nova Amparo",
	[188691] = "Semente de Vordrassil",
	[188695] = "Runa Necromântica",
	[188699] = "Minério Estranho",
	[188713] = "Corda do Sino da Abadia",
	[189290] = "School of Northern Salmon",
	[189295] = "Herassombra",
	[189298] = "Baú de Cedro",
	[189306] = "Tesouro Esquecido",
	[189313] = "Raiz de Acônito",
	[189976] = "Elemento 115",
	[189992] = "Bolota-rubi",
	[190020] = "Procura-se!",
	[190032] = "Caixote de Munição de Invergarde",
	[190189] = "Mapa da Ofensiva",
	[190222] = "Vrykul Hawk Roost",
	[190334] = "Manual do Engrenochefe",
	[190399] = "Fungo do Pileque",
	[190447] = "Motor de Máquina Voadora",
	[190459] = "[Amberseed]",
	[190462] = "[Chilled Serpent Mucus]",
	[190473] = "[Withered Batwing]",
	[190478] = "[Muddy Mire Maggots]",
	[190483] = "Baú de Documentos nº 2",
	[190484] = "Baú de Documentos nº 3",
	[190500] = "Formação de Cristal do Pilar Beira-céu",
	[190507] = "Offering Bowl",
	[190512] = "Vrykul Harpoon Gun",
	[190533] = "Samambaia-da-areia",
	[190534] = "[Mature Water-Poppy]",
	[190535] = "Zim\'Abwa",
	[190537] = "Pulverizador da Peste Quebrado",
	[190540] = "Pedaço de Saronita",
	[190550] = "Ancient Dirt Mound",
	[190578] = "Tesouro de Brumurmúria",
	[190590] = "Explosivos Instáveis",
	[190602] = "Zim\'Torga",
	[190622] = "Vinha Robusta",
	[190633] = "Relíquia Har\'koana",
	[190657] = "Zim\'Rhuk",
	[190660] = "Ovo de Galvo",
	[190700] = "[Dreadsaber Track]",
	[190702] = "Estilhaço de Sangue Vital",
	[190707] = "Soul Font",
	[190720] = "Cristal da Praga Colhido",
	[190767] = "Vagonete de Mina Insuspeitável",
	[190768] = "Cofre Envelhecido",
	[190777] = "[Artruis\'s Phylactery]",
	[190836] = "Baú da Fortaleza de Zol\'Maz",
	[190936] = "Caldeirão Pestilento",
	[190947] = "Arquivos de Nova Avalon",
	[191018] = "Âncora de Corrente Akali",
	[191136] = "Soaked Fertile Dirt",
	[191210] = "Estoque de Armadilhas de Zepik",
	[191519] = "Ferramentas de Curtomada",
	[191544] = "Jaula Enferrujada",
	[191553] = "Lançador de C.M.O.R.R.E.",
	[191568] = "Equipamento de K3",
	[191574] = "Teleportation Pad",
	[191609] = "Mecanismo de Controle do Olho de Áquerus",
	[191708] = "Neve Revirada",
	[191770] = "Ovo de Águia",
	[191778] = "[General\'s Weapon Rack]",
	[191820] = "Estandarte Vraikal",
	[191842] = "Frostgut\'s Altar",
	[192058] = "Vagonete de Minério",
	[192060] = "Bigorna de Fjorn",
	[192072] = "Caixote de Arpões",
	[192120] = "Fúria de Loken",
	[192121] = "Poder de Loken",
	[192122] = "[Loken\'s Favor]",
	[192124] = "Smoldering Scrap",
	[192171] = "Especificações de Ataque do Colosso",
	[192172] = "Especificações de Defesa do Colosso",
	[192243] = "[Battered Storm Hammer]",
	[192493] = "Primeiro Pergaminho de História",
	[192494] = "Segundo Pergaminho de História",
	[192495] = "Terceiro Pergaminho de História",
	[192556] = "Cogumelo da Caverna",
	[192676] = "[Emerald Acorn]",
	[192861] = "Olho do Lich Rei",
	[192908] = "Cerne Cristalino",
	[192914] = "Apoio de Orbe do Laboratório de Abominação",
	[192915] = "Apoio de Orbe do Laboratório de Gigante de Carne",
	[192916] = "Apoio de Orbe da Área do Caldeirão",
	[192932] = "Fluido Embalsamador",
	[192933] = "Orbe de Sangue",
	[193003] = "Pile of Crusader Skulls",
	[193025] = "Estaca de Metal",
	[193028] = "Trompa de Guerra de Jotunheim",
	[193060] = "Braço Sôfrego",
	[193091] = "Carretel de Linha",
	[193092] = "[The Doctor\'s Cleaver]",
	[193195] = "[Pulsing Crystal]",
	[193196] = "Escudo de Fordragon",
	[193199] = "Pilha de Ossos",
	[193200] = "Elmo Abandonado",
	[193201] = "Armadura Abandonada",
	[193403] = "Documento da Pedreira dos Lamentos",
	[193404] = "Livro-caixa da Pedreira dos Lamentos",
	[193405] = "Mapa da Pedreira dos Lamentos",
	[193406] = "Escala da Pedreira dos Lamentos",
	[193424] = "Olho de Domínio",
	[193560] = "Mapas do Prospector Soren",
	[193561] = "Anotações do Prospector Khrona",
	[193565] = "Ymirheim Peak Skulls",
	[193622] = "Grimkor\'s Orb",
	[193767] = "Estilhaço de Horror",
	[193792] = "Estilhaço de Desespero",
	[193793] = "Estilhaço de Sofrimento",
	[193939] = "Summoning Stone",
	[193952] = "Surface Portal",
	[194025] = "Purple Teleport",
	[194151] = "Signal Fire",
	[194519] = "Lança-arpão",
	[195022] = "Ovo de Pelenoso",
}
