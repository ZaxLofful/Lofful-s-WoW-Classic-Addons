local addonName = "Altoholic"
local addon = _G[addonName]

local L = LibStub("AceLocale-3.0"):GetLocale(addonName)
local TS = addon.TradeSkills.Names

if GetLocale() ~= "frFR" then return end		-- ** French translation by Laumac **

-- This table contains a list of suggestions to get to the next level of reputation, craft or skill
addon.Suggestions = {

	-- source : http://forums.worldofwarcraft.com/th...02789457&sid=1
	-- ** Primary professions **
	[TS.TAILORING] = {
		{ 50, "Atteindre 50: Rouleau d'\195\169toffe en lin" },
		{ 70, "Atteindre 70: Sac en lin" },
		{ 75, "Atteindre 75: Cape en lin renforc\195\169" },
		{ 105, "Atteindre 105: Rouleau d'\195\169toffe de laine" },
		{ 110, "Atteindre 110: Chemise grise en laine"},
		{ 125, "Atteindre 125: Epauli\195\168res \195\160 double couture en laine" },
		{ 145, "Atteindre 145: Rouleau d'\195\169toffe de soie" },
		{ 160, "Atteindre 160: Chaperon azur en soie" },
		{ 170, "Atteindre 170: Bandeau en soie" },
		{ 175, "Atteindre 175: Chemise blanche habill\195\169e" },
		{ 185, "Atteindre 185: Rouleau de tisse-mage" },
		{ 205, "Atteindre 205: Gilet cramoisi en soie" },
		{ 215, "Atteindre 215: Culotte cramoisie en soie" },
		{ 220, "Atteindre 220: Jambi\195\168res noires en tisse-mage\nou Robe noire en tisse-mage" },
		{ 230, "Atteindre 230: Gants noirs en tisse-mage" },
		{ 250, "Atteindre 250: Bandeau noir en tisse-mage\nou Epauli\195\168res noires en tisse-mage" },
		{ 260, "Atteindre 260: Rouleau d'\195\169toffe runique" },
		{ 275, "Atteindre 275: Ceinture en \195\169toffe runique" },
		{ 280, "Atteindre 280: Sac en \195\169toffe runique" },
		{ 300, "Atteindre 300: Gants en \195\169toffe runique" },
	},
	[TS.LEATHERWORKING] = {
		{ 35, "Atteindre 35: Renfort d'armure l\195\169ger" },
		{ 55, "Atteindre 55: Peau l\195\169g\195\168re trait\195\169e" },
		{ 85, "Atteindre 85: Gants en cuir estamp\195\169" },
		{ 100, "Atteindre 100: Bottes \195\169l\195\169gantes en cuir" },
		{ 120, "Atteindre 120: Peau moyenne trait\195\169e" },
		{ 125, "Atteindre 125: Bottes \195\169l\195\169gantes en cuir" },
		{ 150, "Atteindre 150: Bottes noires en cuir" },
		{ 160, "Atteindre 160: Peau lourde trait\195\169e" },
		{ 170, "Atteindre 170: Renfort d'armure lourd" },
		{ 180, "Atteindre 180: Jambi\195\168res en cuir mat\nou Pantalon du gardien" },
		{ 195, "Atteindre 195: Epauli\195\168res barbares" },
		{ 205, "Atteindre 205: Brassards mats" },
		{ 220, "Atteindre 220: Renfort d'armure \195\169pais" },
		{ 225, "Atteindre 225: Bandeau de la nuit" },
		{ 250, "Atteindre 250: D\195\169pend de votre sp\195\169cialisation\nBandeau/Tunique/Pantalon de la nuit (El\195\169mentaire)\nCuirasse/Gants arm\195\169s du scorpide (Ecailles de dragon)\nEnsemble en \195\169cailles de tortue (Tribal)" },
		{ 260, "Atteindre 260: Bottes de la nuit" },
		{ 270, "Atteindre 270: Gantelets corrompus en cuir" },
		{ 285, "Atteindre 285: Brassards corrompus en cuir" },
		{ 300, "Atteindre 300: Bandeau corrompu en cuir" },
	},
	[TS.ENGINEERING] = {
		{ 40, "Atteindre 40: Poudre d'explosion basique" },
		{ 50, "Atteindre 50: Poign\195\169e de boulons en cuivre" },
		{ 51, "Cr\195\169er une Cl\195\169 plate" },
		{ 65, "Atteindre 65: Tube en cuivre" },
		{ 75, "Atteindre 75: Dynamite grossi\195\168re" },
		{ 95, "Atteindre 95: Poudre d'explosion grossi\195\168re" },
		{ 105, "Atteindre 105: Contact en argent" },
		{ 120, "Atteindre 120: Tube en bronze" },
		{ 125, "Atteindre 125: Petite bombe en bronze" },
		{ 145, "Atteindre 145: Poudre d'explosion majeure" },
		{ 150, "Atteindre 150: Grande bombe en bronze" },
		{ 175, "Atteindre 175: Fus\195\169e bleue, rouge ou verte" },
		{ 176, "Cr\195\169er un Micro-ajusteur gyromatique" },
		{ 190, "Atteindre 190: Poudre noire solide" },
		{ 195, "Atteindre 195: Grande bombe en fer" },
		{ 205, "Atteindre 205: Tube en mithril" },
		{ 210, "Atteindre 210: D\195\169clencheur instable" },
		{ 225, "Atteindre 225: Balles per\185\167antes en mithril" },
		{ 235, "Atteindre 235: Armature en mithril" },
		{ 245, "Atteindre 245: Bombe explosive" },
		{ 250, "Atteindre 250: Balle gyroscopique en mithril" },
		{ 260, "Atteindre 260: Poudre d'explosion dense" },
		{ 290, "Atteindre 290: Rouage en thorium" },
		{ 300, "Atteindre 300: Tube en thorium\nou Obus en thorium (plus rentable)" },
	},
	[TS.ENCHANTING] = {
		{ 2, "Atteindre 2: B\195\162tonnet runique en cuivre" },
		{ 75, "Atteindre 75: Ench. de brassards (Vie mineure)" },
		{ 85, "Atteindre 85: Ench. de brassards (D\195\169viation mineure)" },
		{ 100, "Atteindre 100: Ench. de brassards (Endurance mineure)" },
		{ 101, "Cr\195\169er un B\195\162tonnet runique en argent" },
		{ 105, "Atteindre 105: Ench. de brassards (Endurance mineure)" },
		{ 120, "Atteindre 120: Baguette magique sup\195\169rieure" },
		{ 130, "Atteindre 130: Ench. de bouclier (Endurance mineure)" },
		{ 150, "Atteindre 150: Ench. de brassards (Endurance inf\195\169rieure)" },
		{ 151, "Cr\195\169er un B\195\162tonnet runique en or" },
		{ 160, "Atteindre 160: Ench. de brassards (Endurance inf\195\169rieure)" },
		{ 165, "Atteindre 165: Ench. de bouclier (Endurance inf\195\169rieure)" },
		{ 180, "Atteindre 180: Ench. de brassards (Esprit)" },
		{ 200, "Atteindre 200: Ench. de brassards (Force)" },
		{ 201, "Cr\195\169er un B\195\162tonnet runique en vrai-argent" },
		{ 205, "Atteindre 205: Ench. de brassards (Force)" },
		{ 225, "Atteindre 225: Ench. de cape (D\195\169fense sup\195\169rieure)" },
		{ 235, "Atteindre 235: Ench. de gants (Agilit\195\169)" },
		{ 245, "Atteindre 245: Ench. de plastron (Sant\195\169 excellente)" },
		{ 250, "Atteindre 250: Ench. de brassards (Force sup\195\169rieure)" },
		{ 270, "Atteindre 270: Huile de mana inf\195\169rieure\nRecette vendue \195\160 Silithus" },
		{ 290, "Atteindre 290: Ench. de bouclier (Endurance sup\195\169rieure)\nou Ench. de bottes (Endurance sup\195\169rieure)" },
		{ 291, "Cr\195\169er un B\195\162tonnet runique en arcanite" },
		{ 300, "Atteindre 300: Ench. de cape (D\195\169fense excellente)" },
	},
	[TS.BLACKSMITHING] = {
		{ 25, "Atteindre 25: Pierre \195\160 aiguiser brute" },
		{ 45, "Atteindre 45: Pierre de lest brute" },
		{ 75, "Atteindre 75: Ceinture en anneaux de cuivre" },
		{ 80, "Atteindre 80: Pierre de lest grossi\195\168re" },
		{ 100, "Atteindre 100: Ceinture runique en cuivre" },
		{ 105, "Atteindre 105: B\195\162tonnet en argent" },
		{ 125, "Atteindre 125: Epauli\195\168res grossi\195\168res en bronze" },
		{ 150, "Atteindre 150: Pierre de lest lourde" },
		{ 155, "Atteindre 155: B\195\162tonnet dor\195\169" },
		{ 165, "Atteindre 165: Epauli\195\168res en fer \195\169meraude" },
		{ 185, "Atteindre 185: Brassards en fer \195\169meraude" },
		{ 200, "Atteindre 200: Brassards en \195\169cailles dor\195\169es" },
		{ 210, "Atteindre 210: Pierre de lest solide" },
		{ 215, "Atteindre 215: Gantelets en \195\169cailles dor\195\169es" },
		{ 235, "Atteindre 235: Heaume en plaques d'acier\nou Brassards en \195\169cailles de mithril (plus rentable)\nRecette \195\160 Nid-de-l'aigle (A) ou Pierr\195\170che (H)" },
		{ 250, "Atteindre 250: Camail en mithril\nou Eperons en mithril (plus rentable)" },
		{ 260, "Atteindre 260: Pierre \195\160 aiguiser dense" },
		{ 270, "Atteindre 270: Ceinture en thorium ou Brassards en thorium (plus rentable)\nJambi\195\168res de forge-terre (Sp\195\169 armure)\nLame l\195\169g\195\168re de forge-terre (Sp\195\169 arme)\nMarteau l\195\169ger de forge-braise (Sp\195\169 marteau)\nHache l\195\169g\195\168re de forge-ciel (Sp\195\169 hache)" },
		{ 295, "Atteindre 295: Brassards imp\195\169riaux en plaques" },
		{ 300, "Atteindre 300: Bottes imp\195\169riales en plaques" },
	},
	[TS.ALCHEMY] = { 
		{ 60, "Atteindre 60: Potion de soins mineure" },
		{ 110, "Atteindre 110: Potion de soins inf\195\169rieure" },
		{ 140, "Atteindre 140: Potion de soins" },
		{ 155, "Atteindre 155: Potion de mana inf\195\169rieure" },
		{ 185, "Atteindre 185: Potion de soins sup\195\169rieure" },
		{ 210, "Atteindre 210: Elixir d'Agilit\195\169" },
		{ 215, "Atteindre 215: Elixir de d\195\169fense sup\195\169rieure" },
		{ 230, "Atteindre 230: Potion de soins excellente" },
		{ 250, "Atteindre 250: Elixir de d\195\169tection des morts-vivants" },
		{ 265, "Atteindre 265: Elixir d'agilit\195\169 sup\195\169rieure" },
		{ 285, "Atteindre 285: Potion de mana excellente" },
		{ 300, "Atteindre 300: Potion de soins majeure" },
	},
	[L["Mining"]] = {
		{ 65, "Atteindre 65: Miner le cuivre\nToutes zones de d\195\169part" },
		{ 125, "Atteindre 125: Miner l'\195\169tain, l'argent, l'incendicite et la pierre de sang inf\195\169rieur\n\nMiner l'incendicite au Rocher de Thelgen (Les Paluns)\nProgression rapide jusqu'\195\160 125" },
		{ 175, "Atteindre 175: Miner le fer et l'or\nD\195\169solace, Orneval, Terres ingrates, Hautes-terres d'Arathi,\nMontagnes d'Alt\195\169rac, Vall\195\169e de strangleronce, Marais des chagrins" },
		{ 250, "Atteindre 250: Miner le mithril et le vrai-argent\nTerres foudroy\195\169es, Gorge des vents br\195\187lants, Terres ingrates, Les Hinterlands,\nMaleterres de l'ouest, Azshara, Berceau-de-l'hiver, Gangrebois, Les Serres-Rocheuses, Tanaris" },
		{ 275, "Atteindre 275: Miner le thorium \nCrat\195\168re d'Un'Goro, Azshara, Berceau-de-l'hiver, Terres foudroy\195\169es\nGorge des vents br\195\187lants, Steppes ardentes, Maleterres (Est et Ouest)" },
-----------     OUTRETERRE
		{ 330, "Atteindre 330: Miner le gangrefer\nP\195\169ninsule des flammes infernales, Mar\195\169cage de Zangar" },
	},
	[L["Herbalism"]] = {
		{ 50, "Atteindre 50: Collecter du Feuillargent et Pacifique\nToutes zones de d\195\169part" },
		{ 70, "Atteindre 70: Collecter de la Mage royale et Terrestrine\nLes tarides, Marche de l'ouest, For\195\170t des pins argent\195\169s, Loch Modan" },
		{ 100, "Atteindre 100: Collecter de l'Eglantine\nFor\195\170t des pins argent\195\169s, Bois de la p\195\169nombre, Sombrivage,\nLoch Modan, Les Carmines" },
		{ 115, "Atteindre 115: Collecter de la Doulourante\nOrneval, Les Serres-Rocheuses, Sud des Tarides\nLoch Modan, Les Carmines" },
		{ 125, "Atteindre 125: Collecter de l'Aci\195\169rite sauvage\nLes Serres-Rocheuses, Hautes-Terres d'Arathi, Vall\195\169e de Strangleronce\nSud des Tarides, Milles pointes" },
		{ 160, "Atteindre 160: Collecter du Sang royal\nOrneval, Les Serres-Rocheuses, Les Paluns,\nContreforts de Hautebrande, Marais des chagrins" },
		{ 185, "Atteindre 185: Collecter de l'Aveuglette\nMarais des chagrins" },
		{ 205, "Atteindre 205: Collecter de la Moustaches de Khadgar\nLes Hinterlands, Hautes-Terres d'Arathi, Marais des chagrins" },
		{ 230, "Atteindre 230: Collecter de la Fleur de feu\nGorge des vents br\195\187lants, Les terres foudroy\195\169es, Tanaris" },
		{ 250, "Atteindre 250: Collecter de la Soleillette\nGangrebois, Feralas, Azshara\nLes Hinterlands" },
		{ 270, "Atteindre 270: Collecter du Gromsang\nGangrebois, Les terres foudroy\195\169es,\nConvent de Mannoroc en D\195\169solace" },
		{ 285, "Atteindre 285: Collecter du Feuiller\195\170ve\nCrat\195\168re d'Un'Goro, Azshara" },
		{ 300, "Atteindre 300: Collecter de la Fleur de peste\nMaleterres (Est et Ouest), Gangrebois\nou Calot de glace au Berceau-de-l'hiver" },
	},
	[L["Skinning"]] = {
		{ 375, "Atteindre 375: Diviser le niveau actuel de d\195\169pe\185\167age par 5,\net tuer les monstres d\195\169pe\185\167ables du niveau obtenu" }
	},
	-- source: http://www.almostgaming.com/wowguide...kpicking-guide
	[L["Lockpicking"]] = {
		{ 85, "Atteindre 85: Coffre d'entrainement pour voleur\nScierie d'Alther dans les Carmines (A)\nBateau au sud de Cabestan (H)" },
		{ 150, "Atteindre 150: Coffre pr\195\168s du boss de la qu\195\170te du poison\nMarche de l'ouest (A) ou Les tarides (H)" },
		{ 185, "Atteindre 185: Camps des Murlocs (Les Paluns)" },
		{ 225, "Atteindre 225: Gr\195\168ve de Sar'Theris (D\195\169solace)\n" },
		{ 250, "Atteindre 250: Forteresse d'Angor (Terres ingrates)" },
		{ 275, "Atteindre 275: La fosse aux scories (Gorge des vents br\195\187lants)" },
		{ 300, "Atteindre 300: Crique des gr\195\169ements (Tanaris)\nPlage des cr\195\170tes du sud (Azshara)" },
	},

	-- ** Secondary professions **
	[TS.COOKING] = {
		{ 40, "Atteindre 40: Pain \195\169pic\195\169" },
		{ 85, "Atteindre 85: Viande d'ours fum\195\169e, Beignet de crabe" },
		{ 100, "Atteindre 100: Pince de crabe farcie (A)\nBrouet de rat (H)" },
		{ 125, "Atteindre 125: Brouet de rat (H)\nK\195\169bab de loup assaisonn\195\169 (A)" },
		{ 175, "Atteindre 175: Omelette au go\195\187t \195\169trange (A)\nC\195\180telettes de lion \195\169pic\195\169es (H)" },
		{ 200, "Atteindre 200: R\195\180ti de raptor" },
		{ 225, "Atteindre 225: Saucisse d'araign\195\169e\n\n|cFFFFFFFFQu\195\170te de cuisine:\n|cFFFFD70012 Oeufs g\195\169ants,\n10 Chair de palourde piquante,\n20 Emmental d'Alterac " },
		{ 275, "Atteindre 275: Omelette monstrueuse\nou Steak de loup tendre" },
		{ 285, "Atteindre 285: Courante-surprise\nHaches-trippes (Pusillin)" },
		{ 300, "Atteindre 300: Boulettes fum\195\169es du d\195\169sert\nQu\195\170te en Silithus" },
	}, 
	-- source: http://www.wowguideonline.com/fishing.html
	[TS.FISHING] = {
		{ 50, "Atteindre 50: Toute zone de d\195\169part" },
		{ 75, "Atteindre 75: Les canaux \195\160 Hurlevent (A)\nLe bassin d'eau d'Orgrimmar (H)" },
		{ 150, "Atteindre 150: Rivi\195\168re des contreforts de hautebrande" },
		{ 225, "Atteindre 225: Acheter le manuel d'expert en p\195\170che \195\160 Baie-du-butin\nP\195\170cher en D\195\169solace ou hautes-terres d'Arathi" },
		{ 250, "Atteindre 250: Hinterlands, Tanaris\n\n|cFFFFFFFFQu\195\170te de p\195\170che dans les mar\195\169cages d'Aprefrange\n|cFFFFD700Savage Coast Blue Sailfin (Vall\195\169e de Strangleronce)\nFeralas Ahi (Verdantis River, Feralas)\nSer'theris Striker (Northern Sartheris Strand, D\195\169solace)\nMisty Reed Mahi Mahi (Marais des chagrins coastline)" },
		{ 260, "Atteindre 260: Gangrebois" },
		{ 300, "Atteindre 300: Azshara" },
	},
	
	-- suggested leveling zones, as defined by recommended quest levels. map id's : http://wowpedia.org/MapID
	-- ["Leveling"] = {
		-- { 10, "Atteindre 10: Toute zone de d\195\169part" },
		-- { 15, "Atteindre 15: " .. C_Map.GetMapInfo(39).name},
		-- { 16, "Atteindre 16: " .. C_Map.GetMapInfo(684).name},
		-- { 20, "Atteindre 20: " .. C_Map.GetMapInfo(181).name .. "\n" .. C_Map.GetMapInfo(35).name .. "\n" .. C_Map.GetMapInfo(476).name
							-- .. "\n" .. C_Map.GetMapInfo(42).name .. "\n" .. C_Map.GetMapInfo(21).name .. "\n" .. C_Map.GetMapInfo(11).name
							-- .. "\n" .. C_Map.GetMapInfo(463).name .. "\n" .. C_Map.GetMapInfo(36).name},
		-- { 25, "Atteindre 25: " .. C_Map.GetMapInfo(34).name .. "\n" .. C_Map.GetMapInfo(40).name .. "\n" .. C_Map.GetMapInfo(43).name 
							-- .. "\n" .. C_Map.GetMapInfo(24).name},
		-- { 30, "Atteindre 30: " .. C_Map.GetMapInfo(16).name .. "\n" .. C_Map.GetMapInfo(37).name .. "\n" .. C_Map.GetMapInfo(81).name},
		-- { 35, "Atteindre 35: " .. C_Map.GetMapInfo(673).name .. "\n" .. C_Map.GetMapInfo(101).name .. "\n" .. C_Map.GetMapInfo(26).name
							-- .. "\n" .. C_Map.GetMapInfo(607).name},
		-- { 40, "Atteindre 40: " .. C_Map.GetMapInfo(141).name .. "\n" .. C_Map.GetMapInfo(121).name .. "\n" .. C_Map.GetMapInfo(22).name},
		-- { 45, "Atteindre 45: " .. C_Map.GetMapInfo(23).name .. "\n" .. C_Map.GetMapInfo(61).name},
		-- { 48, "Atteindre 48: " .. C_Map.GetMapInfo(17).name},
		-- { 50, "Atteindre 50: " .. C_Map.GetMapInfo(161).name .. "\n" .. C_Map.GetMapInfo(182).name .. "\n" .. C_Map.GetMapInfo(28).name},
		-- { 52, "Atteindre 52: " .. C_Map.GetMapInfo(29).name},
		-- { 54, "Atteindre 54: " .. C_Map.GetMapInfo(38).name},
		-- { 55, "Atteindre 55: " .. C_Map.GetMapInfo(201).name .. "\n" .. C_Map.GetMapInfo(281).name},
		-- { 58, "Atteindre 58: " .. C_Map.GetMapInfo(19).name},
		-- { 60, "Atteindre 60: " .. C_Map.GetMapInfo(32).name .. "\n" .. C_Map.GetMapInfo(241).name .. "\n" .. C_Map.GetMapInfo(261).name},
	-- },
}
