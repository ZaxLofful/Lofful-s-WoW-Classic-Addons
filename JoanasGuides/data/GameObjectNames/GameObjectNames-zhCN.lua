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
	[176213] = "英雄之血",
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
	[177789] = "奥古斯图斯的单据",
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
	[180435] = "诺格的背包",
	[180448] = "通缉布告：死亡弯钩",
	[180501] = "暮光石板碎片",
	[180510] = "[Solanian\'s Scrying Orb]",
	[180511] = "[Scroll of Scourge Magic]",
	[180512] = "[Solanian\'s Journal]",
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
	[181239] = "破旧的箱子",
	[181250] = "[Raw Meat Rack]",
	[181251] = "[Smoked Meat Rack]",
	[181252] = "[Fresh Fish Rack]",
	[181283] = "[Emitter Spare Part]",
	[181359] = "[Night Elf Moon Crystal]",
	[181372] = "地狱火刺叶",
	[181433] = "辐射能量水晶",
	[181574] = "闪光的水晶",
	[181579] = "南部灯塔",
	[181581] = "西部灯塔",
	[181582] = "卡利鸟巢",
	[181598] = "水晶尘喷孔",
	[181606] = "哈尔什祭坛",
	[181616] = "School of Red Snapper",
	[181620] = "未打开的箱子",
	[181626] = "扭曲的箱子",
	[181627] = "武器架",
	[181628] = "空桶",
	[181629] = "[Holy Coffer]",
	[181636] = "Altar of Naias",
	[181638] = "通缉布告",
	[181643] = "羽须的遗骸",
	[181644] = "碧蓝金鱼草",
	[181649] = "羽须的日记",
	[181665] = "[Burial Chest]",
	[181672] = "稻草人",
	[181674] = "航海图",
	[181675] = "航海罗盘",
	[181680] = "枯顶蘑菇",
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
	[181898] = "[Medical Supplies]",
	[181956] = "镀金火盆",
	[181964] = "[Statue of Queen Azshara]",
	[181981] = "龙骨",
	[181988] = "[Ever-burning Pyre]",
	[182026] = "[Sun Gate]",
	[182032] = "[Galaen\'s Journal]",
	[182050] = "蘑菇箱",
	[182053] = "亮顶蘑菇",
	[182069] = "成熟的孢子囊",
	[182095] = "爆顶蘑菇",
	[182115] = "通缉布告",
	[182122] = "伊卡因的物品",
	[182127] = "被污染的花朵",
	[182166] = "安葛洛什攻击计划",
	[182184] = "匕潭毒药手册",
	[182263] = "First Burning Blade Pyre",
	[182264] = "Second Burning Blade Pyre",
	[182369] = "Blazing Warmaul Pyre",
	[182392] = "加拉达尔布告牌",
	[182393] = "塔拉布告牌",
	[182505] = "Eye of Veil Shienor",
	[182507] = "Eye of Veil Reskk",
	[182532] = "[Nazzivus Monument Glyphs]",
	[182542] = "密封的盒子",
	[182549] = "邪兽人的计划",
	[182584] = "无眠之骨",
	[182587] = "通缉布告",
	[182789] = "被践踏的骷髅",
	[182804] = "圣光的秘密",
	[182941] = "格里施纳鸦人宝珠",
	[183147] = "神秘的鸟蛋",
	[183266] = "Footlocker",
	[183267] = "Dresser",
	[183268] = "Bookshelf",
	[183269] = "Weapon Rack",
	[183507] = "Archmage Vargoth\'s Orb",
	[183789] = "奇怪的物体",
	[183805] = "高转速挖掘器",
	[183806] = "机械气压挖掘爪",
	[183807] = "多光谱地形扫描仪",
	[183808] = "一大车炸药",
	[183811] = "通缉布告",
	[183935] = "魔能机甲零件",
	[184073] = "虚灵传送器",
	[184075] = "传送器能量包",
	[184108] = "Dragon Skeleton",
	[184115] = "埃雷利恩的背包",
	[184121] = "克拉苏斯的魔法纲要 - 第一章",
	[184122] = "克拉苏斯的魔法纲要 - 第二章",
	[184123] = "克拉苏斯的魔法纲要 - 第三章",
	[184246] = "Heavy Iron Portcullis",
	[184289] = "科卢尔传送门",
	[184290] = "希鲁斯传送门",
	[184300] = "Necromantic Focus",
	[184383] = "Ethereum Transponder Zeta",
	[184414] = "格雷姆传送门",
	[184415] = "凯勒兹传送门",
	[184433] = "魔法炸弹碎片",
	[184466] = "金属保险箱",
	[184478] = "破损的朝圣者行囊",
	[184504] = "血槌酒桶",
	[184588] = "Captain Tyralius\'s Prison",
	[184589] = "诊断设备",
	[184631] = "活木林树苗",
	[184684] = "贪婪剥石者的卵",
	[184689] = "德拉诺晶体",
	[184701] = "Shadowmoon Tuber Mound",
	[184715] = "被诅咒的大锅",
	[184716] = "库斯卡宝箱",
	[184725] = "魔法炸弹",
	[184726] = "雷神氏族战鼓",
	[184727] = "雷神氏族箭矢",
	[184728] = "雷神氏族石板",
	[184744] = "塔卡里的水烟袋",
	[184793] = "[Primitive Chest]",
	[184795] = "腐烂的鸦人之卵",
	[184825] = "拉什鸦巢宝典",
	[184850] = "[Sunhawk Portal Controller]",
	[184859] = "魔能机甲动力核心",
	[184906] = "能量转化器",
	[184945] = "通缉布告",
	[184946] = "通缉布告",
	[184950] = "第一个预言",
	[184967] = "第二个预言",
	[184968] = "第三个预言",
	[184969] = "第四个预言",
	[184979] = "死亡熔炉地狱火",
	[185010] = "魔蝎控制器",
	[185035] = "通缉布告",
	[185060] = "魔能机甲控制台",
	[185124] = "肥沃的火山灰",
	[185128] = "莉安丝的保险箱",
	[185147] = "肥沃的火山灰",
	[185148] = "肥沃的火山灰",
	[185152] = "格鲁洛克的包裹",
	[185165] = "军团联络器",
	[185182] = "灵藤水晶",
	[185211] = "被诅咒的卵",
	[185216] = "蓝玉信号火焰",
	[185217] = "翡翠信号火焰",
	[185218] = "紫罗兰信号火焰",
	[185219] = "血石信号火焰",
	[185220] = "大型宝箱",
	[185234] = "高格鲁姆祭坛",
	[185302] = "菲菲的埋物地点",
	[185309] = "Altar of Goc",
	[186283] = "Shipwreck Debris",
	[186287] = "Blackhoof Cage",
	[186301] = "黑蹄军备",
	[186324] = "Hyal Family Monument",
	[186325] = "[Darkclaw Guano]",
	[186329] = "石槌氏族战旗",
	[186332] = "食人魔的残骸",
	[186397] = "[Steel Gate Artifact]",
	[186420] = "辛迪加文档",
	[186423] = "除巫草",
	[186426] = "悬赏告示",
	[186427] = "西部卫戍要塞炮弹",
	[186432] = "港口火炮",
	[186441] = "Power Core Fragment",
	[186450] = "飞艇货物",
	[186463] = "龙尾草",
	[186565] = "掠龙仪祭鱼叉",
	[186585] = "[Dragonskin Scroll]",
	[186586] = "The Thane\'s Pyre",
	[186587] = "龙颅石板",
	[186599] = "Frozen Waterfall",
	[186607] = "神圣的古器",
	[186619] = "爆炸陷阱",
	[186632] = "矮人酒桶",
	[186640] = "[Ancient Cipher]",
	[186649] = "[Frostblade Shrine]",
	[186662] = "[Reagent Pouch]",
	[186679] = "药剂师的包裹",
	[186718] = "Broken Tablet",
	[186828] = "鱼叉操作手册",
	[186863] = "Baleheim Bonfire",
	[186894] = "[Large Harpoon Lever]",
	[186912] = "瓦加德补给箱",
	[186938] = "[Loose Rock]",
	[186944] = "[Dirt Mound]",
	[186949] = "School of Tasty Reef Fish",
	[186950] = "[Building Tools]",
	[186954] = "[Large Barrel]",
	[186955] = "[Industrial Strength Rope]",
	[186958] = "[Work Bench]",
	[187273] = "可疑的蹄印",
	[187561] = "奥术牢笼",
	[187565] = "长者阿特卡诺克",
	[187577] = "战歌旗帜",
	[187655] = "[Nerub\'ar Egg Sac]",
	[187659] = "[Warsong Munitions Crate]",
	[187662] = "长者克苏克",
	[187663] = "长者萨加尼",
	[187664] = "长者塔克勒特",
	[187670] = "海象人仪祭目标",
	[187671] = "海象人仪祭目标",
	[187683] = "[Pneumatic Tank Transjigamarig]",
	[187689] = "[Crafty\'s Stuff]",
	[187697] = "[Crafty\'s Tools]",
	[187851] = "诅咒教徒神龛",
	[187879] = "Den of Dying Plague Cauldron",
	[187885] = "[Gurgleboggle\'s Bauble]",
	[187886] = "布戈布咕的盒子",
	[187905] = "[Massive Glowing Egg]",
	[187980] = "急救补给品",
	[187981] = "[Wolf Droppings]",
	[187984] = "[West Point Station Valve]",
	[187985] = "[North Point Station Valve]",
	[187986] = "[Mid Point Station Valve]",
	[187987] = "[South Point Station Valve]",
	[188066] = "卡奥的战戟",
	[188100] = "考达拉地质监测仪",
	[188101] = "考达拉地质监测仪",
	[188102] = "[Coldarra Geological Monitor]",
	[188103] = "[Coldarra Geological Monitor]",
	[188104] = "矿车的锁",
	[188112] = "Farshire Grain",
	[188113] = "[Frostberry Bush]",
	[188120] = "农田、工厂与车间",
	[188131] = "酒箱",
	[188133] = "蓝龙卵",
	[188140] = "晶化法力",
	[188141] = "冰冻的护命匣",
	[188163] = "[Bell Rope]",
	[188164] = "卡斯卡拉补给品",
	[188237] = "部落军备",
	[188264] = "[First Rune Plate]",
	[188288] = "[Second Rune Plate]",
	[188289] = "[Third Rune Plate]",
	[188345] = "幽光雪菇",
	[188351] = "水草",
	[188359] = "图尔凯的螃蟹陷阱",
	[188418] = "通缉！",
	[188419] = "长者玛纳洛",
	[188422] = "[The Pearl of the Depths]",
	[188423] = "燃烧的火盆",
	[188442] = "合金矿石",
	[188458] = "塞布哈拉克先知",
	[188461] = "达卡莱石板",
	[188463] = "阿努巴尔装置",
	[188489] = "红玉丁香",
	[188499] = "达卡莱之罐",
	[188530] = "神圣达卡莱供品",
	[188596] = "[Loken\'s Pedestal]",
	[188600] = "灌木丛",
	[188601] = "甜根茎",
	[188649] = "通缉告示",
	[188666] = "琥珀松木厕所",
	[188670] = "黑根草",
	[188673] = "新壁炉谷弩炮",
	[188691] = "沃达希尔的种子",
	[188695] = "通灵符文",
	[188699] = "奇怪的矿石",
	[188713] = "[Abbey Bell Rope]",
	[189290] = "School of Northern Salmon",
	[189295] = "黑暗草",
	[189298] = "雪松木箱",
	[189306] = "[Forgotten Treasure]",
	[189313] = "破狼草根",
	[189976] = "115号元素",
	[189992] = "红玉橡果",
	[190020] = "通缉！",
	[190032] = "暮冬军需品",
	[190189] = "先锋军地图",
	[190222] = "Vrykul Hawk Roost",
	[190334] = "[The Gearmaster\'s Manual]",
	[190399] = "混乱毒菇",
	[190447] = "[Flying Machine Engine]",
	[190459] = "[Amberseed]",
	[190462] = "[Chilled Serpent Mucus]",
	[190473] = "[Withered Batwing]",
	[190478] = "[Muddy Mire Maggots]",
	[190483] = "文件箱#2",
	[190484] = "文件箱#3",
	[190500] = "[Skyreach Crystal Formation]",
	[190507] = "Offering Bowl",
	[190512] = "Vrykul Harpoon Gun",
	[190533] = "沙蕨",
	[190534] = "[Mature Water-Poppy]",
	[190535] = "希姆埃巴",
	[190537] = "[Crashed Plague Sprayer]",
	[190540] = "[Chunk of Saronite]",
	[190550] = "Ancient Dirt Mound",
	[190578] = "[Mistwhisper Treasure]",
	[190590] = "[Unstable Explosives]",
	[190602] = "希姆托加",
	[190622] = "坚韧的藤蔓",
	[190633] = "哈克娅圣物",
	[190657] = "希姆鲁克",
	[190660] = "[Roc Egg]",
	[190700] = "[Dreadsaber Track]",
	[190702] = "[Lifeblood Shard]",
	[190707] = "Soul Font",
	[190720] = "采集到的荒芜水晶",
	[190767] = "不显眼的矿车",
	[190768] = "[Timeworn Coffer]",
	[190777] = "[Artruis\'s Phylactery]",
	[190836] = "佐尔玛兹要塞宝箱",
	[190936] = "[Plague Cauldron]",
	[190947] = "[New Avalon Registry]",
	[191018] = "阿卡里锁链之锚",
	[191136] = "Soaked Fertile Dirt",
	[191210] = "[Zepik\'s Trap Stash]",
	[191519] = "斯巴索克的工具",
	[191544] = "生锈的牢笼",
	[191553] = "D16限时炸弹分配器",
	[191568] = "K3设备",
	[191574] = "Teleportation Pad",
	[191609] = "阿彻鲁斯之眼控制台",
	[191708] = "纷乱的雪花",
	[191770] = "鹰卵",
	[191778] = "[General\'s Weapon Rack]",
	[191820] = "[Vrykul Banner]",
	[191842] = "Frostgut\'s Altar",
	[192058] = "[Ore Cart]",
	[192060] = "[Fjorn\'s Anvil]",
	[192072] = "[Harpoon Crate]",
	[192120] = "洛肯之怒",
	[192121] = "[Loken\'s Power]",
	[192122] = "[Loken\'s Favor]",
	[192124] = "Smoldering Scrap",
	[192171] = "[Colossus Attack Specs]",
	[192172] = "[Colossus Defense Specs]",
	[192243] = "[Battered Storm Hammer]",
	[192493] = "[First History Scroll]",
	[192494] = "[Second History Scroll]",
	[192495] = "[Third History Scroll]",
	[192556] = "洞穴蘑菇",
	[192676] = "[Emerald Acorn]",
	[192861] = "巫妖王之眼",
	[192908] = "水晶心木",
	[192914] = "[Abomination Lab Orb Stand]",
	[192915] = "[Flesh Giant Lab Orb Stand]",
	[192916] = "[Cauldron Area Orb Stand]",
	[192932] = "防腐液",
	[192933] = "鲜血宝珠",
	[193003] = "Pile of Crusader Skulls",
	[193025] = "[Metal Stake]",
	[193028] = "[War Horn of Jotunheim]",
	[193060] = "闪光的木板",
	[193091] = "[Spool of Thread]",
	[193092] = "[The Doctor\'s Cleaver]",
	[193195] = "[Pulsing Crystal]",
	[193196] = "弗塔根之盾",
	[193199] = "[Pile of Bones]",
	[193200] = "[Abandoned Helm]",
	[193201] = "[Abandoned Armor]",
	[193403] = "[Weeping Quarry Document]",
	[193404] = "[Weeping Quarry Ledger]",
	[193405] = "[Weeping Quarry Map]",
	[193406] = "[Weeping Quarry Schedule]",
	[193424] = "[Eye of Dominion]",
	[193560] = "[Prospector Soren\'s Maps]",
	[193561] = "[Prospector Khrona\'s Notes]",
	[193565] = "Ymirheim Peak Skulls",
	[193622] = "Grimkor\'s Orb",
	[193767] = "恐惧碎片",
	[193792] = "绝望碎片",
	[193793] = "[Shard of Suffering]",
	[193939] = "Summoning Stone",
	[193952] = "Surface Portal",
	[194025] = "Purple Teleport",
	[194151] = "Signal Fire",
	[194519] = "[Harpoon Gun]",
	[195022] = "毒皮暴掠龙蛋",
}
