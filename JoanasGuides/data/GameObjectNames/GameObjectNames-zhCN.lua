--[[ AUTOGENERATED - DO NOT MODIFY]]
--[[ See license.txt for license and copyright information ]]
if (GetLocale() ~= "zhCN" and GetLocale() ~= "zhTW") then return end
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
	[2740] = "Chest of the Raven Claw",
	[2741] = "Chest of the Sky",
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
	[4141] = "Control Console",
	[4406] = "Webwood Eggs",
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
	[173265] = "木制厕所",
	[174682] = "当心翼手龙",
	[174728] = "破损的箱子",
	[175165] = "银色清晨号的保险箱",
	[175166] = "迷雾之纱号的保险箱",
	[175207] = "搁浅的海洋生物",
	[175226] = "搁浅的海洋生物",
	[175227] = "搁浅的海洋生物",
	[175230] = "搁浅的海洋生物",
	[175233] = "搁浅的海洋生物",
	[175264] = "雏龙精华",
	[175320] = "通缉：莫克迪普！",
	[175329] = "黑木坚果",
	[175330] = "黑木水果",
	[175331] = "黑木谷物",
	[175384] = "风巢双足飞龙的蛋",
	[175407] = "月光羽毛",
	[175524] = "神秘的红色水晶",
	[175565] = "异型蛋",
	[175566] = "阴暗草",
	[175586] = "加隆的马车",
	[175587] = "破损的箱子",
	[175629] = "加隆的补给物资",
	[175704] = "烧焦的信件",
	[175708] = "十字路口的补给箱",
	[175802] = "小箱子",
	[175888] = "上层精灵遗物碎片",
	[175891] = "上层精灵遗物碎片",
	[175892] = "上层精灵遗物碎片",
	[175893] = "上层精灵遗物碎片",
	[175894] = "詹妮丝的包裹",
	[175924] = "锁住的柜橱",
	[175925] = "厕所",
	[175926] = "达尔松夫人的日记",
	[175928] = "火岩龙舌兰",
	[175944] = "生命圣火",
	[176091] = "死木蒸锅",
	[176092] = "火岩箱",
	[176115] = "通缉：阿纳克-恐怖图腾",
	[176116] = "帕米拉的洋娃娃的脑袋",
	[176142] = "帕米拉的洋娃娃的左身",
	[176143] = "帕米拉的洋娃娃的右身",
	[176145] = "约瑟夫·雷德帕斯的纪念碑",
	[176158] = "痛苦火盆",
	[176159] = "怨意火盆",
	[176160] = "受难火盆",
	[176161] = "仇恨火盆",
	[176189] = "海龟骨头",
	[176190] = "搁浅的海龟",
	[176191] = "搁浅的海龟",
	[176196] = "搁浅的海龟",
	[176197] = "搁浅的海龟",
	[176198] = "搁浅的海龟",
	[176208] = "霍古斯的颅骨",
	[176209] = "马杜克的破碎之剑",
	[176210] = "Command Tent",
	[176344] = "文件箱",
	[176361] = "瘟疫之锅",
	[176392] = "瘟疫之锅",
	[176393] = "瘟疫之锅",
	[176581] = "埃鲁索斯之手水晶",
	[176582] = "贝壳陷阱",
	[176634] = "克罗尼亚的箱子",
	[176751] = "科多兽骨",
	[176753] = "末日草",
	[176785] = "弹药箱",
	[176793] = "一捆木柴",
	[177240] = "松软的泥土堆",
	[177289] = "瘟疫之锅",
	[177404] = "Altar of Elune",
	[177464] = "大白蚁丘",
	[177490] = "北山伐木场箱子",
	[177491] = "白蚁桶",
	[177525] = "Moonkin Stone",
	[177624] = "萨巴克希斯的恶魔之包",
	[177667] = "破损的卷轴",
	[177673] = "Serpent Statue",
	[177675] = "一堆泥土",
	[177747] = "奎尔萨拉斯名册",
	[177750] = "月光蘑菇花",
	[177784] = "巨型软壳蚌",
	[177785] = "神殿灵珠容器",
	[177786] = "拉克摩尔的箱子",
	[177787] = "拉克摩尔的日志",
	[177790] = "[Strange Lockbox]",
	[177792] = "奇怪的保险箱",
	[177794] = "奇怪的保险箱",
	[177804] = "破碎的人类残骸",
	[177805] = "破碎的人类残骸",
	[177806] = "破碎的人类残骸",
	[177844] = "[Strange Lockbox]",
	[177904] = "通缉：贝瑟莱斯",
	[177926] = "盖亚之种",
	[177929] = "盖亚土堆",
	[178084] = "菲利克斯的箱子",
	[178085] = "菲利克斯的螺钉桶",
	[178087] = "塔兹利尔的镐",
	[178090] = "[Marla\'s Grave]",
	[178144] = "[Troll Chest]",
	[178247] = "Naga Brazier",
	[178553] = "亚什虫茧",
	[179565] = "覆满灰尘的箱子",
	[179827] = "通缉/寻物/招领",
	[179908] = "斯拉提的工具",
	[179910] = "拉尔德的午餐篮",
	[180448] = "通缉布告：死亡弯钩",
	[180501] = "暮光石板碎片",
	[180516] = "[Shrine of Dath\'Remar]",
	[180600] = "不稳定的法力水晶箱",
	[180917] = "[Captain Kelisendra\'s Cargo]",
	[180918] = "通缉：饥饿者泰里斯",
	[180921] = "被污染的土壤样本",
	[181011] = "魔导师达斯维瑟的日记",
	[181107] = "[Weapon Container]",
	[181110] = "[Soaked Tome]",
	[181133] = "[Rathis Tomber\'s Supplies]",
	[181138] = "[Night Elf Plans: An\'daroth]",
	[181139] = "[Night Elf Plans: An\'owyn]",
	[181140] = "[Night Elf Plans: Scrying on the Sin\'dorei]",
	[181147] = "通缉布告",
	[181148] = "[Mummified Troll Remains]",
	[181150] = "[Dusty Journal]",
	[181151] = "[Glistening Mud]",
	[181153] = "[Wanted Poster: Kel\'gash the Wicked]",
	[181157] = "[Altar of Tidal Mastery]",
	[181238] = "凹陷的箱子",
	[181250] = "[Raw Meat Rack]",
	[181251] = "[Smoked Meat Rack]",
	[181252] = "[Fresh Fish Rack]",
	[181283] = "[Emitter Spare Part]",
	[181359] = "[Night Elf Moon Crystal]",
	[181433] = "辐射能量水晶",
	[181598] = "水晶尘喷孔",
	[181616] = "School of Red Snapper",
	[181620] = "未打开的箱子",
	[181626] = "扭曲的箱子",
	[181627] = "武器架",
	[181628] = "空桶",
	[181629] = "[Holy Coffer]",
	[181636] = "Altar of Naias",
	[181643] = "羽须的遗骸",
	[181644] = "碧蓝金鱼草",
	[181649] = "羽须的日记",
	[181665] = "[Burial Chest]",
	[181672] = "稻草人",
	[181674] = "航海图",
	[181675] = "航海罗盘",
	[181681] = "[Chalice of Elune]",
	[181683] = "上古圣物",
	[181690] = "肥沃的土壤",
	[181694] = "Naga Flag",
	[181696] = "中空的树干",
	[181697] = "一堆树叶",
	[181698] = "虚空石",
	[181699] = "污物桶",
	[181746] = "克劳伯的设备",
	[181748] = "血水晶",
	[181756] = "[Battered Ancient Book]",
	[181757] = "止松谷物",
	[181758] = "[Mound of Dirt]",
	[181770] = "被腐蚀的水晶",
	[181780] = "Altered Bloodmyst Crystal",
	[181825] = "Concealed Control Panel",
	[181854] = "沙梨",
	[181889] = "通缉布告",
	[181891] = "血蘑菇",
	[181892] = "水生臭角菇",
	[181893] = "[Ruinous Polyspore]",
	[181894] = "[Fel Cone Fungus]",
	[181897] = "[Ysera\'s Tear]",
	[181956] = "镀金火盆",
	[181964] = "[Statue of Queen Azshara]",
	[181981] = "龙骨",
	[181988] = "[Ever-burning Pyre]",
	[182026] = "[Sun Gate]",
	[182032] = "[Galaen\'s Journal]",
	[182127] = "被污染的花朵",
	[182532] = "[Nazzivus Monument Glyphs]",
	[184793] = "[Primitive Chest]",
	[184850] = "[Sunhawk Portal Controller]",
	[186283] = "Shipwreck Debris",
	[186287] = "Blackhoof Cage",
	[186301] = "黑蹄军备",
	[186324] = "Hyal Family Monument",
	[186329] = "石槌氏族战旗",
	[186332] = "食人魔的残骸",
	[186420] = "辛迪加文档",
	[186423] = "除巫草",
	[186426] = "悬赏告示",
	[186432] = "港口火炮",
	[186441] = "Power Core Fragment",
	[186450] = "飞艇货物",
	[186463] = "龙尾草",
	[187273] = "可疑的蹄印",
	[190483] = "文件箱#2",
	[190484] = "文件箱#3",
	[195022] = "毒皮暴掠龙蛋",
}