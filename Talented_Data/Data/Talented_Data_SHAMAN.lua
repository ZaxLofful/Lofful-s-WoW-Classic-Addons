if not Talented_Data then return end

Talented_Data.SHAMAN = {
	{
		numtalents = 20,
		talents = {
			{
				info = {
					tips = "Reduces the mana cost of your Shock, Lightning Bolt and Chain Lightning spells by %d%%.",
					tipValues = {{2}, {4}, {6}, {8}, {10}},
					name = "Convection",
					column = 2,
					row = 1,
					icon = 136116,
					ranks = 5,
				},
			}, -- [1]
			{
				info = {
					tips = "Increases the damage done by your Lightning Bolt, Chain Lightning and Shock spells by %d%%.",
					tipValues = {{1}, {2}, {3}, {4}, {5}},
					name = "Concussion",
					column = 3,
					row = 1,
					icon = 135807,
					ranks = 5,
				},
			}, -- [2]
			{
				info = {
					tips = "Increases the health of your Stoneclaw Totem by %d%% and the radius of your Earthbind Totem by %d%%.",
					tipValues = {{25, 10}, {50, 20}},
					name = "Earth's Grasp",
					column = 1,
					row = 2,
					icon = 136097,
					ranks = 2,
				},
			}, -- [3]
			{
				info = {
					tips = "Reduces damage taken from Fire, Frost and Nature effects by %d%%.",
					tipValues = {{4}, {7}, {10}},
					name = "Elemental Warding",
					column = 2,
					row = 2,
					icon = 136094,
					ranks = 3,
				},
			}, -- [4]
			{
				info = {
					tips = "Increases the damage done by your Fire Totems by %d%%.",
					tipValues = {{5}, {10}, {15}},
					name = "Call of Flame",
					column = 3,
					row = 2,
					icon = 135817,
					ranks = 3,
				},
			}, -- [5]
			{
				info = {
					tips = "After landing a critical strike with a Fire, Frost, or Nature damage spell, you enter a Clearcasting state.  The Clearcasting state reduces the mana cost of your next 2 damage spells by 40%.",
					name = "Elemental Focus",
					exceptional = 1,
					column = 1,
					row = 3,
					icon = 136170,
					ranks = 1,
				},
			}, -- [6]
			{
				info = {
					tips = "Reduces the cooldown of your Shock spells by %.1f sec.",
					tipValues = {{0.2}, {0.4}, {0.6}, {0.8}, {1.0}},
					name = "Reverberation",
					column = 2,
					row = 3,
					icon = 135850,
					ranks = 5,
				},
			}, -- [7]
			{
				info = {
					tips = "Increases the critical strike chance of your Lightning Bolt and Chain Lightning spells by an additional %d%%.",
					tipValues = {{1}, {2}, {3}, {4}, {5}},
					name = "Call of Thunder",
					column = 3,
					row = 3,
					icon = 136014,
					ranks = 5,
				},
			}, -- [8]
			{
				info = {
					tips = "Reduces the delay before your Fire Nova Totem activates by %d sec. and decreases the threat generated by your Magma Totem by %d%%.",
					tipValues = {{1, 25}, {2, 50}},
					name = "Improved Fire Totems",
					column = 1,
					row = 4,
					icon = 135824,
					ranks = 2,
				},
			}, -- [9]
			{
				info = {
					tips = "Gives you a %d%% chance to gain the Focused Casting effect that lasts for 6 sec after being the victim of a melee or ranged critical strike.  The Focused Casting effect prevents you from losing casting time on Shaman spells when taking damage.",
					tipValues = {{33}, {66}, {100}},
					name = "Eye of the Storm",
					column = 2,
					row = 4,
					icon = 136213,
					ranks = 3,
				},
			}, -- [10]
			{
				info = {
					tips = "Your offensive spell crits will increase your chance to get a critical strike with melee attacks by %d%% for 10 sec.",
					tipValues = {{3}, {6}, {9}},
					name = "Elemental Devastation",
					column = 4,
					row = 4,
					icon = 135791,
					ranks = 3,
				},
			}, -- [11]
			{
				info = {
					tips = "Increases the range of your Lightning Bolt and Chain Lightning spells by %d yards.",
					tipValues = {{3}, {6}},
					name = "Storm Reach",
					column = 1,
					row = 5,
					icon = 136099,
					ranks = 2,
				},
			}, -- [12]
			{
				info = {
					tips = "Increases the critical strike damage bonus of your Searing, Magma, and Fire Nova Totems and your Fire, Frost, and Nature spells by 100%.",
					name = "Elemental Fury",
					column = 2,
					row = 5,
					icon = 135830,
					ranks = 1,
				},
			}, -- [13]
			{
				info = {
					tips = "Regenerate mana equal to %d%% of your Intellect every 5 sec, even while casting.",
					tipValues = {{2}, {4}, {6}, {8}, {10}},
					name = "Unrelenting Storm",
					column = 4,
					row = 5,
					icon = 136111,
					ranks = 5,
				},
			}, -- [14]
			{
				info = {
					tips = "Increases your chance to hit with Fire, Frost and Nature spells by %d%% and reduces the threat caused by Fire, Frost and Nature spells by %d%%.",
					tipValues = {{2, 4}, {4, 7}, {6, 10}},
					name = "Elemental Precision",
					column = 1,
					row = 6,
					icon = 136028,
					ranks = 3,
				},
			}, -- [15]
			{
				info = {
					tips = "Reduces the cast time of your Lightning Bolt and Chain Lightning spells by %.1f sec.",
					tipValues = {{0.1}, {0.2}, {0.3}, {0.4}, {0.5}},
					prereqs = {
						{
							column = 3,
							row = 3,
							source = 8,
						}, -- [1]
					},
					name = "Lightning Mastery",
					column = 3,
					row = 6,
					icon = 135990,
					ranks = 5,
				},
			}, -- [16]
			{
				info = {
					tips = "When activated, this spell gives your next Fire, Frost, or Nature damage spell a 100% critical strike chance and reduces the mana cost by 100%.",
					prereqs = {
						{
							column = 2,
							row = 5,
							source = 13,
						}, -- [1]
					},
					name = "Elemental Mastery",
					exceptional = 1,
					column = 2,
					row = 7,
					icon = 136115,
					ranks = 1,
				},
			}, -- [17]
			{
				info = {
					tips = "Reduces the chance you will be critically hit by melee and ranged attacks by %d%%.",
					tipValues = {{2}, {4}, {6}},
					name = "Elemental Shields",
					column = 3,
					row = 7,
					icon = 136030,
					ranks = 3,
				},
			}, -- [18]
			{
				info = {
					tips = "Gives your Lightning Bolt and Chain Lightning spells a %d%% chance to cast a second, similar spell on the same target at no additional cost that causes half damage and no threat.",
					tipValues = {{4}, {8}, {12}, {16}, {20}},
					name = "Lightning Overload",
					column = 2,
					row = 8,
					icon = 136050,
					ranks = 5,
				},
			}, -- [19]
			{
				info = {
					tips = "Summons a Totem of Wrath with 5 health at the feet of the caster.  The totem increases the chance to hit and critically strike with spells by 3% for all party members within 20 yards.  Lasts 2 min.",
					prereqs = {
						{
							column = 2,
							row = 8,
							source = 19,
						}, -- [1]
					},
					name = "Totem of Wrath",
					exceptional = 1,
					column = 2,
					row = 9,
					icon = 135829,
					ranks = 1,
				},
			}, -- [20]
		},
		info = {
			background = "ShamanElementalCombat",
			name = "Elemental",
		},
	}, -- [1]
	{
		numtalents = 21,
		talents = {
			{
				info = {
					tips = "Increases your maximum mana by %d%%.",
					tipValues = {{1}, {2}, {3}, {4}, {5}},
					name = "Ancestral Knowledge",
					column = 2,
					row = 1,
					icon = 136162,
					ranks = 5,
				},
			}, -- [1]
			{
				info = {
					tips = "Increases your chance to block attacks with a shield by %d%% and increases the amount blocked by %d%%.",
					tipValues = {{1, 5}, {2, 10}, {3, 15}, {4, 20}, {5, 25}},
					name = "Shield Specialization",
					column = 3,
					row = 1,
					icon = 134952,
					ranks = 5,
				},
			}, -- [2]
			{
				info = {
					tips = "Increases the amount of damage reduced by your Stoneskin Totem and Windwall Totem by %d%% and reduces the cooldown of your Grounding Totem by %d sec.",
					tipValues = {{10, 1}, {20, 2}},
					name = "Guardian Totems",
					column = 1,
					row = 2,
					icon = 136098,
					ranks = 2,
				},
			}, -- [3]
			{
				info = {
					tips = "Improves your chance to get a critical strike with your weapon attacks by %d%%.",
					tipValues = {{1}, {2}, {3}, {4}, {5}},
					name = "Thundering Strikes",
					column = 2,
					row = 2,
					icon = 132325,
					ranks = 5,
				},
			}, -- [4]
			{
				info = {
					tips = "Reduces the cast time of your Ghost Wolf spell by %d sec.",
					tipValues = {{1}, {2}},
					name = "Improved Ghost Wolf",
					column = 3,
					row = 2,
					icon = 136095,
					ranks = 2,
				},
			}, -- [5]
			{
				info = {
					tips = "Increases the damage done by your Lightning Shield orbs by %d%%.",
					tipValues = {{5}, {10}, {15}},
					name = "Improved Lightning Shield",
					column = 4,
					row = 2,
					icon = 136051,
					ranks = 3,
				},
			}, -- [6]
			{
				info = {
					tips = "Increases the effect of your Strength of Earth and Grace of Air Totems by %d%%.",
					tipValues = {{8}, {15}},
					name = "Enhancing Totems",
					column = 1,
					row = 3,
					icon = 136023,
					ranks = 2,
				},
			}, -- [7]
			{
				info = {
					tips = "After landing a melee critical strike, you enter a Focused state.  The Focused state reduces the mana cost of your next Shock spell by 60%.",
					name = "Shamanistic Focus",
					column = 3,
					row = 3,
					icon = 136027,
					ranks = 1,
				},
			}, -- [8]
			{
				info = {
					tips = "Increases your chance to dodge by an additional %d%%.",
					tipValues = {{1}, {2}, {3}, {4}, {5}},
					name = "Anticipation",
					column = 4,
					row = 3,
					icon = 136056,
					ranks = 5,
				},
			}, -- [9]
			{
				info = {
					tips = "Increases your attack speed by %d%% for your next 3 swings after dealing a critical strike.",
					tipValues = {{10}, {15}, {20}, {25}, {30}},
					prereqs = {
						{
							column = 2,
							row = 2,
							source = 4,
						}, -- [1]
					},
					name = "Flurry",
					column = 2,
					row = 4,
					icon = 132152,
					ranks = 5,
				},
			}, -- [10]
			{
				info = {
					tips = "Increases your armor value from items by %d%%, and reduces the duration of movement slowing effects on you by %d%%.",
					tipValues = {{2, 10}, {4, 20}, {6, 30}, {8, 40}, {10, 50}},
					name = "Toughness",
					column = 3,
					row = 4,
					icon = 135892,
					ranks = 5,
				},
			}, -- [11]
			{
				info = {
					tips = "Increases the melee attack power bonus of your Windfury Totem by %d%% and increases the damage caused by your Flametongue Totem by %d%%.",
					tipValues = {{15, 6}, {30, 12}},
					name = "Improved Weapon Totems",
					column = 1,
					row = 5,
					icon = 135792,
					ranks = 2,
				},
			}, -- [12]
			{
				info = {
					tips = "Gives a chance to parry enemy melee attacks and reduces the threat generated by your melee attacks by 30%.",
					name = "Spirit Weapons",
					column = 2,
					row = 5,
					icon = 132269,
					ranks = 1,
				},
			}, -- [13]
			{
				info = {
					tips = "Increases the damage caused by your Rockbiter Weapon by %d%%, your Windfury Weapon effect by %d%% and increases the damage caused by your Flametongue Weapon and Frostbrand Weapon by %d%%.",
					tipValues = {{7, 13, 5}, {14, 27, 10}, {20, 40, 15}},
					name = "Elemental Weapons",
					column = 3,
					row = 5,
					icon = 135814,
					ranks = 3,
				},
			}, -- [14]
			{
				info = {
					tips = "Reduces the mana cost of your instant cast Shaman spells by %d%% and increases your spell damage and healing by an amount equal to %d%% of your attack power.",
					tipValues = {{2, 10}, {4, 20}, {6, 30}},
					name = "Mental Quickness",
					column = 1,
					row = 6,
					icon = 136055,
					ranks = 3,
				},
			}, -- [15]
			{
				info = {
					tips = "Increases the damage you deal with all weapons by %d%%.",
					tipValues = {{2}, {4}, {6}, {8}, {10}},
					name = "Weapon Mastery",
					column = 4,
					row = 6,
					icon = 132215,
					ranks = 5,
				},
			}, -- [16]
			{
				info = {
					tips = "Increases your chance to hit while dual wielding by an additional %d%%.",
					tipValues = {{2}, {4}, {6}},
					prereqs = {
						{
							column = 2,
							row = 7,
							source = 18,
						}, -- [1]
					},
					name = "Dual Wield Specialization",
					column = 1,
					row = 7,
					icon = 132148,
					ranks = 3,
				},
			}, -- [17]
			{
				info = {
					tips = "Allows one-hand and off-hand weapons to be equipped in the off-hand.",
					prereqs = {
						{
							column = 2,
							row = 5,
							source = 13,
						}, -- [1]
					},
					name = "Dual Wield",
					column = 2,
					row = 7,
					icon = 132147,
					ranks = 1,
				},
			}, -- [18]
			{
				info = {
					tips = "Instantly attack with both weapons.  In addition, the next 2 sources of Nature damage dealt to the target are increased by 20%.  Lasts 12 sec.",
					prereqs = {
						{
							column = 3,
							row = 5,
							source = 14,
						}, -- [1]
					},
					name = "Stormstrike",
					exceptional = 1,
					column = 3,
					row = 7,
					icon = 132314,
					ranks = 1,
				},
			}, -- [19]
			{
				info = {
					tips = "Causes your critical hits with melee attacks to increase all party members' melee attack power by %d%% if within 20 yards of the Shaman.  Lasts 10 sec.",
					tipValues = {{2}, {4}, {6}, {8}, {10}},
					name = "Unleashed Rage",
					column = 2,
					row = 8,
					icon = 136110,
					ranks = 5,
				},
			}, -- [20]
			{
				info = {
					tips = "Reduces all damage taken by 30% and gives your successful melee attacks a chance to regenerate mana equal to 30% of your attack power.  Lasts 15 sec.",
					name = "Shamanistic Rage",
					exceptional = 1,
					column = 2,
					row = 9,
					icon = 136088,
					ranks = 1,
				},
			}, -- [21]
		},
		info = {
			background = "ShamanEnhancement",
			name = "Enhancement",
		},
	}, -- [2]
	{
		numtalents = 20,
		talents = {
			{
				info = {
					tips = "Reduces the casting time of your Healing Wave spell by %.1f sec.",
					tipValues = {{0.1}, {0.2}, {0.3}, {0.4}, {0.5}},
					name = "Improved Healing Wave",
					column = 2,
					row = 1,
					icon = 136052,
					ranks = 5,
				},
			}, -- [1]
			{
				info = {
					tips = "Reduces the mana cost of your healing spells by %d%%.",
					tipValues = {{1}, {2}, {3}, {4}, {5}},
					name = "Tidal Focus",
					column = 3,
					row = 1,
					icon = 135859,
					ranks = 5,
				},
			}, -- [2]
			{
				info = {
					tips = "Reduces the cooldown of your Reincarnation spell by %d min and increases the amount of health and mana you reincarnate with by an additional %d%%.",
					tipValues = {{10, 10}, {20, 20}},
					name = "Improved Reincarnation",
					column = 1,
					row = 2,
					icon = 136080,
					ranks = 2,
				},
			}, -- [3]
			{
				info = {
					tips = "Increases your target's armor value by %d%% for 15 sec after getting a critical effect from one of your healing spells.",
					tipValues = {{8}, {16}, {25}},
					name = "Ancestral Healing",
					column = 2,
					row = 2,
					icon = 136109,
					ranks = 3,
				},
			}, -- [4]
			{
				info = {
					tips = "Reduces the mana cost of your totems by %d%%.",
					tipValues = {{5}, {10}, {15}, {20}, {25}},
					name = "Totemic Focus",
					column = 3,
					row = 2,
					icon = 136057,
					ranks = 5,
				},
			}, -- [5]
			{
				info = {
					tips = "Increases your chance to hit with melee attacks and spells by %d%%.",
					tipValues = {{1}, {2}, {3}},
					name = "Nature's Guidance",
					column = 1,
					row = 3,
					icon = 135860,
					ranks = 3,
				},
			}, -- [6]
			{
				info = {
					tips = "Gives you a %d%% chance to avoid interruption caused by damage while casting any Shaman healing spell.",
					tipValues = {{14}, {28}, {42}, {56}, {70}},
					name = "Healing Focus",
					column = 2,
					row = 3,
					icon = 136043,
					ranks = 5,
				},
			}, -- [7]
			{
				info = {
					tips = "The radius of your totems that affect friendly targets is increased to 30 yards.",
					name = "Totemic Mastery",
					column = 3,
					row = 3,
					icon = 136069,
					ranks = 1,
				},
			}, -- [8]
			{
				info = {
					tips = "Reduces the threat generated by your healing spells by %d%% and reduces the chance your spells will be dispelled by %d%%.",
					tipValues = {{5, 10}, {10, 20}, {15, 30}},
					name = "Healing Grace",
					column = 4,
					row = 3,
					icon = 136041,
					ranks = 3,
				},
			}, -- [9]
			{
				info = {
					tips = "Increases the effect of your Mana Spring and Healing Stream Totems by %d%%.",
					tipValues = {{5}, {10}, {15}, {20}, {25}},
					name = "Restorative Totems",
					column = 2,
					row = 4,
					icon = 136053,
					ranks = 5,
				},
			}, -- [10]
			{
				info = {
					tips = "Increases the critical effect chance of your healing and lightning spells by %d%%.",
					tipValues = {{1}, {2}, {3}, {4}, {5}},
					name = "Tidal Mastery",
					column = 3,
					row = 4,
					icon = 136107,
					ranks = 5,
				},
			}, -- [11]
			{
				info = {
					tips = "Your Healing Wave spells have a %d%% chance to increase the effect of subsequent Healing Wave spells on that target by 6%% for 15 sec.  This effect will stack up to 3 times.",
					tipValues = {{33}, {66}, {100}},
					name = "Healing Way",
					column = 1,
					row = 5,
					icon = 136044,
					ranks = 3,
				},
			}, -- [12]
			{
				info = {
					tips = "When activated, your next Nature spell with a casting time less than 10 sec. becomes an instant cast spell.",
					name = "Nature's Swiftness",
					exceptional = 1,
					column = 3,
					row = 5,
					icon = 136076,
					ranks = 1,
				},
			}, -- [13]
			{
				info = {
					tips = "Reduces the duration of any Silence or Interrupt effects used against the Shaman by %d%%. This effect does not stack with other similar effects.",
					tipValues = {{10}, {20}, {30}},
					name = "Focused Mind",
					column = 4,
					row = 5,
					icon = 136035,
					ranks = 3,
				},
			}, -- [14]
			{
				info = {
					tips = "Increases the effectiveness of your healing spells by %d%%.",
					tipValues = {{2}, {4}, {6}, {8}, {10}},
					name = "Purification",
					column = 3,
					row = 6,
					icon = 135865,
					ranks = 5,
				},
			}, -- [15]
			{
				info = {
					tips = "Summons a Mana Tide Totem with 5 health at the feet of the caster for 12 sec that restores 6% of total mana every 3 seconds to group members within 20 yards.",
					prereqs = {
						{
							column = 2,
							row = 4,
							source = 10,
						}, -- [1]
					},
					name = "Mana Tide Totem",
					exceptional = 1,
					column = 2,
					row = 7,
					icon = 135861,
					ranks = 1,
				},
			}, -- [16]
			{
				info = {
					tips = "Whenever a damaging attack is taken that reduces you below 30%% health, you have a %d%% chance to heal 10%% of your total health and reduce your threat level on that target.  5 second cooldown.",
					tipValues = {{10}, {20}, {30}, {40}, {50}},
					name = "Nature's Guardian",
					column = 3,
					row = 7,
					icon = 136060,
					ranks = 5,
				},
			}, -- [17]
			{
				info = {
					tips = "Increases your spell damage and healing by an amount equal to %d%% of your Intellect.",
					tipValues = {{10}, {20}, {30}},
					name = "Nature's Blessing",
					column = 2,
					row = 8,
					icon = 136059,
					ranks = 3,
				},
			}, -- [18]
			{
				info = {
					tips = "Increases the amount healed by your Chain Heal spell by %d%%.",
					tipValues = {{10}, {20}},
					name = "Improved Chain Heal",
					column = 3,
					row = 8,
					icon = 136042,
					ranks = 2,
				},
			}, -- [19]
			{
				info = {
					tips = "Protects the target with an earthen shield, giving a 30% chance of ignoring spell interruption when damaged and causing attacks to heal the shielded target for 150.  This effect can only occur once every few seconds.  6 charges.  Lasts 10 min.  Earth Shield can only be placed on one target at a time and only one Elemental Shield can be active on a target at a time.",
					prereqs = {
						{
							column = 2,
							row = 8,
							source = 18,
						}, -- [1]
					},
					name = "Earth Shield",
					exceptional = 1,
					column = 2,
					row = 9,
					icon = 136089,
					ranks = 1,
				},
			}, -- [20]
		},
		info = {
			background = "ShamanRestoration",
			name = "Restoration",
		},
	}, -- [3]
}
