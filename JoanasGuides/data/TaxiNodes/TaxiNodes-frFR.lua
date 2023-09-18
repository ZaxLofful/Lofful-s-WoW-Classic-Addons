--[[ AUTOGENERATED - DO NOT MODIFY]]
--[[ See license.txt for license and copyright information ]]
if (GetLocale() ~= "frFR") then return end
select(2, ...).SetupGlobalFacade()

TaxiNodes = {
	[1] = "Abbaye de Northshire",
	[2] = "Stormwind, Elwynn",
	[3] = "Ile des programmeurs",
	[4] = "Colline des sentinelles, marche de l'Ouest",
	[5] = "Lakeshire, les Carmines",
	[6] = "Ironforge, Dun Morogh",
	[7] = "Port de Menethil, les Paluns",
	[8] = "Thelsamar, Loch Modan",
	[9] = "Baie-du-Butin, Strangleronce",
	[10] = "Le Sépulcre, forêt des Pins argentés",
	[11] = "Undercity, Tirisfal",
	[12] = "Darkshire, bois de la Pénombre",
	[13] = "Moulin-de-Tarren, Hillsbrad",
	[14] = "Southshore, Hillsbrad",
	[15] = "Maleterres de l'est",
	[16] = "Refuge de l'Ornière, Arathi",
	[17] = "Trépas-d'Orgrim, Arathi",
	[18] = "Baie-du-Butin, Strangleronce",
	[19] = "Baie-du-Butin, Strangleronce",
	[20] = "Grom'gol, Strangleronce",
	[21] = "Kargath, Terres ingrates",
	[22] = "Thunder Bluff, Mulgore",
	[23] = "Orgrimmar, Durotar",
	[24] = "Générique, Cible monde pour les voies des zeppelins",
	[25] = "La Croisée, Tarides",
	[26] = "Auberdine, Sombrivage",
	[27] = "Rut'theran, Teldrassil",
	[28] = "Astranaar, Ashenvale",
	[29] = "Retraite de Roche-Soleil, Serres-Rocheuses",
	[30] = "Poste de Librevent, Mille Pointes",
	[31] = "Thalanaar, Feralas",
	[32] = "Theramore, marécage d'Âprefange",
	[33] = "Pic des Serres-Rocheuses, Serres-Rocheuses",
	[34] = "Transport, Ratchet - Baie-du-Butin",
	[35] = "Transport, zeppelins d'Orgrimmar",
	[36] = "Générique, cible monde",
	[37] = "Combe de Nijel, Désolace",
	[38] = "Proie-de-l'Ombre, Désolace",
	[39] = "Gadgetzan, Tanaris",
	[40] = "Gadgetzan, Tanaris",
	[41] = "Feathermoon, Feralas",
	[42] = "Camp Mojache, Feralas",
	[43] = "Nid-de-l'Aigle, Les Hinterlands",
	[44] = "Valormok, Azshara",
	[45] = "Rempart-du-Néant, Terres foudroyées",
	[46] = "Bac de Southshore, Hillsbrad",
	[47] = "Transport, Grom'gol - Orgrimmar",
	[48] = "Poste de la Vénéneuse, Gangrebois",
	[49] = "Reflet-de-Lune",
	[50] = "Transport, vaisseaux de Menethil",
	[51] = "Transport, Rut'theran - Auberdine",
	[52] = "Long-guet, Berceau-de-l'Hiver",
	[53] = "Long-guet, Berceau-de-l'Hiver",
	[54] = "Transport, Feathermoon - Feralas",
	[55] = "Mur-de-Fougères, marécage d'Âprefange",
	[56] = "Stonard, marais des Chagrins",
	[57] = "Village de pêcheurs, Teldrassil",
	[58] = "Avant-poste de Zoram'gar, Ashenvale",
	[59] = "Dun Baldar, Vallée d'Alterac",
	[60] = "Donjon Frostwolf, Vallée d'Alterac",
	[61] = "Poste de Bois-brisé, Ashenvale",
	[62] = "Havrenuit, Reflet-de-Lune",
	[63] = "Havrenuit, Reflet-de-Lune",
	[64] = "Halte de Talrendis, Azshara",
	[65] = "Clairière de Griffebranche, Gangrebois",
	[66] = "Camp du Noroît, Maleterres de l'ouest",
	[67] = "Chapelle de l'Espoir de Lumière, Maleterres de l'est",
	[68] = "Chapelle de l'Espoir de Lumière, Maleterres de l'est",
	[69] = "Reflet-de-Lune",
	[70] = "Corniches des flammes, Steppes ardentes",
	[71] = "Veille de Morgan, Steppes ardentes",
	[72] = "Fort cénarien, Silithus",
	[73] = "Fort cénarien, Silithus",
	[74] = "Halte du Thorium, Gorge des Vents brûlants",
	[75] = "Halte du Thorium, Gorge des Vents brûlants",
	[76] = "Village des Revantusk, les Hinterlands",
	[77] = "Camp Taurajo, les Tarides",
	[78] = "Naxxramas",
	[79] = "Refuge des Marshal, cratère d'Un'Goro",
	[80] = "Ratchet, les Tarides",
	[84] = "Tour de Pestebois, Maleterres de l'est",
	[85] = "Tour du Col du nord, Maleterres de l'est",
	[86] = "Tour du Mur d'est, Maleterres de l'est",
	[87] = "Tour de garde de la couronne, Maleterres de l'est",
}