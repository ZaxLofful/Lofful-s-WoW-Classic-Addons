local _, ItemProfConstants = ...

local COOK =    0x001
local FAID =    0x002
local ALC =     0x004
local BS =      0x008
local ENC =     0x010
local ENG =     0x020
local LW =      0x040
local TAIL =    0x080
local VENDOR =	0x100
local Q = 		0x200	-- Neutral quests
local ALLI = 	0x400	-- Alliance only
local HORDE = 	0x800	-- Horde only
local DRUID = 	0x1000
local HUNTER = 	0x2000
local MAGE = 	0x4000
local PALADIN = 0x8000
local PRIEST = 	0x10000
local ROGUE = 	0x20000
local SHAMAN = 	0x40000
local WARLOCK = 0x80000
local WARRIOR = 0x100000
local COOK_Q =	0x200000
local FAID_Q = 	0x400000
local ALC_Q =	0x800000
local BS_Q =	0x1000000
local ENC_Q = 	0x2000000
local ENG_Q = 	0x4000000
local LW_Q =	0x8000000
local TAIL_Q =	0x10000000
local DMF =		0x20000000

ItemProfConstants.VENDOR_ITEM_FLAG = VENDOR
ItemProfConstants.DMF_ITEM_FLAG = DMF
ItemProfConstants.QUEST_FLAG = Q
ItemProfConstants.NUM_PROF_FLAGS = 8	-- Num professions tracked

ItemProfConstants.PROF_TEXTURES = {
[ COOK ] = GetSpellTexture( 2550 ),
[ FAID ] = GetSpellTexture( 3273 ),
[ ALC ] = GetSpellTexture( 2259 ),
[ BS ] = GetSpellTexture( 2018 ),
[ ENC ] = GetSpellTexture( 7411 ),
[ ENG ] = GetSpellTexture( 4036 ),
[ LW ] = GetSpellTexture( 2108 ),
[ TAIL ] = GetSpellTexture( 3908 ),
[ Q ] = "Interface\\GossipFrame\\AvailableQuestIcon",
[ DMF ] = "134481"
}

-- Mapping the item IDs to texture indices
ItemProfConstants.ITEM_PROF_FLAGS = {
[ 118 ] = ALC,
[ 159 ] = COOK + ENG + VENDOR,
[ 723 ] = COOK + ALLI,	--q
[ 729 ] = COOK + ALLI,	--q
[ 730 ] = COOK + ALLI,	--q
[ 731 ] = COOK + ALLI,	--q
[ 732 ] = ALLI,			--q
[ 737 ] = Q,		--q
[ 765 ] = ALC,
[ 769 ] = COOK + ALLI,	--q
[ 774 ] = BS + ENG,
[ 783 ] = LW,
[ 785 ] = ALC,
[ 814 ] = ENG + TAIL + ALLI,		--q ALLIANCE
[ 818 ] = BS + ENG,
[ 929 ] = TAIL + Q,		--q
[ 1015 ] = COOK + ALLI,	--q
[ 1080 ] = COOK + ALLI,	--q
[ 1081 ] = COOK + ALLI,	--q
[ 1179 ] = COOK + VENDOR,
[ 1206 ] = BS + ENG + LW + Q, --q
[ 1210 ] = BS + ENC + ENG + TAIL + LW,
[ 1274 ] = ALLI,			--q ALLIANCE
[ 1288 ] = FAID + ALC,
[ 1468 ] = COOK + ALLI,	--q
[ 1475 ] = FAID,
[ 1529 ] = BS + ENG + LW + TAIL + MAGE,	--q MAGE
[ 1705 ] = BS + ENG,
[ 2251 ] = COOK + ALLI,	--q
[ 2296 ] = Q,
[ 2309 ] = ALLI + LW_Q + DMF,	--q LW ALLIANCE
[ 2310 ] = ALLI + LW_Q,			--q LW ALLIANCE
[ 2312 ] = LW,
[ 2314 ] = DMF,
[ 2318 ] = BS + ENG + LW + TAIL,		--q HORDE LW/SKINNING ?????
[ 2319 ] = BS + ENG + LW + TAIL,
[ 2320 ] = LW + TAIL + VENDOR + HORDE,			--q VENDOR
[ 2321 ] = BS + LW + TAIL + VENDOR + ALLI,		--q VENDOR ALLIANCE
[ 2324 ] = LW + TAIL + VENDOR,
[ 2325 ] = LW + TAIL + VENDOR,
[ 2447 ] = ALC,
[ 2449 ] = ALC + DRUID,		--q DRUID
[ 2450 ] = ALC,
[ 2452 ] = COOK + ALC,
[ 2453 ] = ALC,
[ 2454 ] = ALLI + ALC_Q,	--q ALC
[ 2455 ] = ALLI,			--q ALLIANCE
[ 2457 ] = LW,
[ 2458 ] = ALLI,			--q ALLIANCE
[ 2459 ] = BS + LW,
[ 2589 ] = FAID + BS + ENG + TAIL + MAGE + PALADIN,	--q MAGE PALADIN
[ 2592 ] = FAID + BS + ENG + TAIL,
[ 2594 ] = VENDOR + ALLI,		--q ALLIANCE VENDOR
[ 2596 ] = COOK + VENDOR,
[ 2604 ] = TAIL + VENDOR,
[ 2605 ] = BS + LW + TAIL + VENDOR,
[ 2633 ] = ALLI,		--q ALLIANCE
[ 2665 ] = COOK + VENDOR + ALLI,		--q VENDOR
[ 2672 ] = COOK,
[ 2673 ] = COOK,
[ 2674 ] = COOK,
[ 2675 ] = COOK,
[ 2677 ] = COOK,
[ 2678 ] = COOK + VENDOR,
[ 2692 ] = COOK + VENDOR,
[ 2725 ] = Q,
[ 2728 ] = Q,
[ 2730 ] = Q,
[ 2732 ] = Q,
[ 2734 ] = Q,
[ 2735 ] = Q,
[ 2738 ] = Q,
[ 2740 ] = Q,
[ 2742 ] = Q,
[ 2744 ] = Q,
[ 2745 ] = Q,
[ 2748 ] = Q,
[ 2749 ] = Q,
[ 2750 ] = Q,
[ 2751 ] = Q,
[ 2772 ] = ENC,
[ 2798 ] = ALLI,		--q ALLIANCE
[ 2835 ] = BS + ENG,
[ 2836 ] = BS + ENG,
[ 2838 ] = BS + ENG,
[ 2840 ] = BS + ENG,
[ 2841 ] = BS + ENG,
[ 2842 ] = BS + ENG + Q,	--q
[ 2845 ] = ALLI + BS_Q,	--q BS ALLIANCE
[ 2851 ] = ALLI + BS_Q,	--q BS ALLIANCE
[ 2857 ] = ALLI + BS_Q,	--q BS
[ 2863 ] = BS,
[ 2868 ] = Q,				--q 
[ 2880 ] = BS + ENG + VENDOR,
[ 2886 ] = COOK + ALLI,	--q
[ 2894 ] = COOK + VENDOR + ALLI,		--q VENDOR
[ 2924 ] = COOK + ALLI,		--q
[ 2934 ] = LW,
[ 2996 ] = TAIL,
[ 2997 ] = LW + TAIL + ALLI,	--q ALLIANCE
[ 3164 ] = ALC + HORDE,			--q HORDE
[ 3172 ] = COOK + ALLI,		--q
[ 3173 ] = COOK + ALLI,		--q
[ 3174 ] = COOK + ALLI,		--q
[ 3182 ] = LW + TAIL,
[ 3240 ] = DMF,
[ 3340 ] = ALLI,
[ 3355 ] = ALC,
[ 3356 ] = ALC + ENC + LW + Q,
[ 3357 ] = ALC + WARRIOR,			--q WARRIOR
[ 3358 ] = ALC,
[ 3369 ] = ALC,
[ 3371 ] = ALC + ENC + VENDOR,
[ 3372 ] = ALC + ENC + VENDOR,
[ 3383 ] = LW + TAIL,
[ 3388 ] = HORDE,				-- q HORDE
[ 3389 ] = LW,
[ 3390 ] = LW,
[ 3391 ] = BS,
[ 3404 ] = COOK + Q,	--q
[ 3466 ] = BS + VENDOR,
[ 3470 ] = BS,
[ 3478 ] = BS,
[ 3482 ] = HORDE + BS_Q,			--q BS
[ 3483 ] = HORDE + BS_Q,			--q BS
[ 3486 ] = BS + DMF,
[ 3575 ] = ALC + BS + ENG + HORDE + Q + WARRIOR,	--q WARRIOR BS	****
[ 3577 ] = BS + ENG + TAIL + WARLOCK,				--q WARLOCK SMELTING ****
[ 3667 ] = COOK,
[ 3685 ] = COOK,
[ 3703 ] = VENDOR + Q,			--q VENDOR
[ 3712 ] = COOK + Q,	--q
[ 3713 ] = COOK + VENDOR + Q, 	--q VENDOR
[ 3719 ] = ALLI,			--q ALLIANCE
[ 3730 ] = COOK,
[ 3731 ] = COOK,
[ 3818 ] = ALC,
[ 3819 ] = ALC + ENC,
[ 3820 ] = ALC,
[ 3821 ] = COOK + ALC,
[ 3823 ] = BS + Q,			--q
[ 3824 ] = ALC + BS + LW + TAIL,
[ 3825 ] = ALLI,					--q ALLIANCE
[ 3827 ] = TAIL + ALLI,			--q ULDAMAN
[ 3829 ] = BS + ENC + ENG + TAIL + Q,	--q
[ 3835 ] = HORDE + BS_Q + DMF,		--q BS HORDE
[ 3836 ] = HORDE + BS_Q,			--q BS HORDE
[ 3842 ] = HORDE + BS_Q,			--q BS HORDE
[ 3851 ] = HORDE + BS_Q,			--q BS
[ 3853 ] = Q,						--q BS + MARSH
[ 3855 ] = BS_Q,					--q BS
[ 3857 ] = VENDOR + Q,
[ 3858 ] = ALC,
[ 3859 ] = BS + ENG,
[ 3860 ] = ALC + BS + ENG + BS_Q,			--q BS
[ 3864 ] = BS + ENG + LW + TAIL + BS_Q,	--q BS
[ 4096 ] = LW,
[ 4231 ] = LW,
[ 4232 ] = LW,
[ 4233 ] = LW,
[ 4234 ] = BS + ENG + LW + TAIL + Q,
[ 4235 ] = LW,
[ 4236 ] = LW,
[ 4239 ] = ALLI + LW_Q,			--q LW ALLIANCE
[ 4243 ] = LW,
[ 4246 ] = LW,
[ 4255 ] = BS,
[ 4278 ] = ALLI,						--q ALLIANCE
[ 4289 ] = LW + VENDOR,
[ 4291 ] = LW + TAIL + VENDOR,
[ 4304 ] = BS + ENG + LW + TAIL + LW_Q,		--q LW
[ 4305 ] = LW + TAIL,
[ 4306 ] = FAID + BS + ENG + TAIL + Q,		--q
[ 4337 ] = ENG + LW + TAIL,
[ 4338 ] = FAID + BS + ENG + LW + TAIL,
[ 4339 ] = ENG + TAIL,
[ 4340 ] = LW + TAIL + VENDOR,
[ 4341 ] = TAIL + VENDOR,
[ 4342 ] = ALC + TAIL + VENDOR,
[ 4357 ] = ENG,
[ 4359 ] = ENG,
[ 4361 ] = ENG,
[ 4363 ] = ENG + DMF,
[ 4364 ] = ENG,
[ 4368 ] = ENG,
[ 4369 ] = HORDE,
[ 4371 ] = ENG + ALLI + ROGUE,		--q
[ 4375 ] = ENG + DMF,
[ 4377 ] = ENG,
[ 4382 ] = ENG,
[ 4384 ] = ENG_Q,			--q ENG
[ 4385 ] = ENG,
[ 4387 ] = ENG,
[ 4389 ] = ENG + Q,		--q
[ 4392 ] = Q,			--q ENG + DESOLACE REP?
[ 4394 ] = ENG + ENG_Q,		--q ENG
[ 4399 ] = ENG + VENDOR,
[ 4400 ] = ENG + VENDOR,
[ 4402 ] = COOK + ALC + ENG,
[ 4404 ] = ENG,
[ 4407 ] = ENG + ENG_Q,		--q ENG
[ 4457 ] = Q,
[ 4461 ] = LW,
[ 4470 ] = ENC + VENDOR,
[ 4479 ] = WARRIOR,			--q WARRIOR
[ 4480 ] = WARRIOR,			--q WARRIOR
[ 4481 ] = WARRIOR,			--q WARRIOR
[ 4536 ] = COOK + VENDOR,
[ 4582 ] = DMF,
[ 4589 ] = TAIL + HORDE,	--q HORDE
[ 4595 ] = VENDOR + Q,			--q VENDOR
[ 4603 ] = COOK,
[ 4611 ] = ENG + Q,		--q
[ 4625 ] = ALC + ENC + TAIL,
[ 4655 ] = COOK,
[ 5051 ] = COOK + HORDE,	--q HORDE
[ 5075 ] = HORDE,			--q HORDE
[ 5082 ] = LW,
[ 5116 ] = LW,
[ 5117 ] = DMF,
[ 5134 ] = DMF,
[ 5373 ] = LW,
[ 5465 ] = COOK + ALLI,	--q
[ 5466 ] = COOK,
[ 5467 ] = COOK,
[ 5468 ] = COOK,
[ 5469 ] = COOK + ALLI,	--q
[ 5470 ] = COOK,
[ 5471 ] = COOK,
[ 5498 ] = BS + LW + TAIL,
[ 5500 ] = BS + ENC + LW + TAIL,
[ 5503 ] = COOK,
[ 5504 ] = COOK,
[ 5633 ] = LW,
[ 5635 ] = ALC + BS + HORDE + BS_Q,	--q BS HORDE?
[ 5637 ] = ALC + BS + ENC + LW,
[ 5739 ] = DMF,
[ 5770 ] = WARLOCK,			--q WARLOCK
[ 5784 ] = LW,
[ 5785 ] = LW,
[ 5833 ] = Q,			--q
[ 5966 ] = BS,
[ 5997 ] = ALLI + ALC_Q,			--q ALC
[ 6037 ] = BS + ENC + ENG + TAIL + ALLI,		--q ALLIANCE BS SMELTING
[ 6040 ] = ALLI + BS_Q,			--q BS ALLIANCE
[ 6048 ] = ENC + TAIL,
[ 6214 ] = ALLI + BS_Q,			--q BS
[ 6260 ] = TAIL + VENDOR,
[ 6261 ] = TAIL + VENDOR,
[ 6289 ] = COOK,
[ 6291 ] = COOK,
[ 6303 ] = COOK,
[ 6308 ] = COOK,
[ 6317 ] = COOK,
[ 6338 ] = ENC,
[ 6358 ] = ALC,
[ 6359 ] = ALC,
[ 6361 ] = COOK,
[ 6362 ] = COOK,
[ 6370 ] = ALC + ENC,
[ 6371 ] = ALC + ENC + TAIL,
[ 6470 ] = LW,
[ 6471 ] = LW,
[ 6522 ] = COOK + ALC,
[ 6530 ] = ENG + VENDOR,
[ 6889 ] = COOK,
[ 7067 ] = ALC + BS + ENC + ENG + LW + TAIL + HORDE + SHAMAN,	--q SHAMAN
[ 7068 ] = ALC + BS + ENC + ENG + TAIL + HORDE + SHAMAN,		--q SHAMAN
[ 7069 ] = ALC + BS + ENG + TAIL + HORDE + SHAMAN,				--q SHAMAN
[ 7070 ] = ALC + BS + LW + TAIL + HORDE + SHAMAN,				--q SHAMAN
[ 7071 ] = LW + TAIL,
[ 7072 ] = TAIL,
[ 7075 ] = BS + ENC + ENG + LW + LW_Q,					--q LW
[ 7076 ] = ALC + BS + ENC + ENG + LW + TAIL,
[ 7077 ] = ALC + BS + ENC + ENG + LW + TAIL + LW_Q,	--q LW
[ 7078 ] = ALC + BS + ENC + ENG + LW + TAIL,
[ 7079 ] = ENC + ENG + LW + TAIL + LW_Q,				--q LW SILITHUS
[ 7080 ] = ALC + BS + ENC + ENG + LW + TAIL,
[ 7081 ] = BS + ENC + LW_Q,							--q LW
[ 7082 ] = ALC + ENC + ENG + LW + TAIL,
[ 7191 ] = ENG,
[ 7286 ] = LW,
[ 7287 ] = LW,
[ 7387 ] = ENG,
[ 7392 ] = ENC + LW,
[ 7428 ] = LW,
--[ 7642 ] = Q,				--q PALADIN MOUNT
[ 7909 ] = BS + ENC + ENG,
[ 7910 ] = BS + ENG + TAIL,							--q SMELTING
[ 7912 ] = BS + ENG,
[ 7922 ] = HORDE + BS_Q,			--q BS HORDE
[ 7926 ] = BS_Q,			--q BS ALLIANCE?
[ 7927 ] = BS_Q,			--q BS
[ 7928 ] = BS_Q,			--q BS
[ 7930 ] = BS_Q,			--q BS
[ 7931 ] = BS_Q,			--q BS
[ 7933 ] = BS_Q,			--q BS ALLIANCE
[ 7935 ] = BS_Q,			--q BS
[ 7936 ] = BS_Q,			--q BS
[ 7937 ] = BS_Q,			--q BS
[ 7941 ] = BS_Q,			--q BS
[ 7945 ] = BS_Q + DMF,		--q BS
[ 7956 ] = HORDE + BS_Q,			--q BS HORDE
[ 7957 ] = HORDE + BS_Q,			--q BS HORDE
[ 7958 ] = HORDE + BS_Q,			--q BS HORDE
[ 7963 ] = HORDE + BS_Q,			--q BS HORDE
[ 7966 ] = BS,
[ 7971 ] = BS + ENC + LW + TAIL,
[ 7972 ] = ALC + BS + ENC + ENG + TAIL + PRIEST,			--q PRIEST
[ 7974 ] = COOK + COOK_Q,	--q
[ 8146 ] = BS + LW,
[ 8150 ] = COOK + ENG + LW,	--q ?? AQ MALLET QUEST?
[ 8151 ] = ENG + LW,
[ 8152 ] = LW,
[ 8153 ] = ALC + BS + ENC + ENG + LW + TAIL + LW_Q,	--q LW
[ 8154 ] = LW,
[ 8165 ] = LW + LW_Q,	--q LW
[ 8167 ] = LW,
[ 8168 ] = BS + LW,
[ 8169 ] = LW,
[ 8170 ] = BS + ENC + ENG + LW + TAIL + Q,
[ 8171 ] = LW,
[ 8172 ] = LW,
[ 8173 ] = LW_Q,		--q LW
[ 8175 ] = LW_Q,		--q LW
[ 8176 ] = LW_Q,		--q LW
[ 8185 ] = DMF,
[ 8187 ] = LW_Q,		--q LW
[ 8189 ] = LW_Q,		--q LW
[ 8191 ] = LW_Q,		--q LW
[ 8193 ] = LW_Q,		--q LW
[ 8197 ] = LW_Q,		--q LW
[ 8198 ] = LW_Q,		--q LW
[ 8203 ] = LW_Q,		--q LW
[ 8204 ] = LW_Q,		--q LW
[ 8211 ] = LW_Q,		--q LW
[ 8214 ] = LW_Q,		--q LW
[ 8244 ] = Q,
[ 8343 ] = LW + TAIL + VENDOR,
[ 8365 ] = COOK,
[ 8368 ] = LW,
[ 8391 ] = Q,
[ 8392 ] = Q,
[ 8393 ] = Q,
[ 8394 ] = Q,
[ 8396 ] = Q,
[ 8411 ] = Q,
[ 8424 ] = Q,
[ 8483 ] = Q,
[ 8831 ] = ALC + ENC + TAIL,
[ 8836 ] = ALC + PALADIN,
[ 8838 ] = ALC + ENC,
[ 8839 ] = ALC,
[ 8845 ] = ALC,
[ 8846 ] = ALC + Q,		--q BRD
[ 8925 ] = ALC + ENC + VENDOR,
[ 8932 ] = VENDOR + COOK_Q,		--q VENDOR
[ 8949 ] = LW,
[ 8951 ] = LW,
[ 9060 ] = ENG,
[ 9061 ] = COOK + ENG,	--q AQ / SILITHUS
[ 9224 ] = ENC,
[ 9260 ] = ALC,
[ 9262 ] = ALC,
[ 9259 ] = ALLI,			--q ALLIANCE
[ 9264 ] = WARLOCK,			--q WARLOCK MOUNT
[ 9308 ] = Q,			--q ALLIANCE
[ 9313 ] = DMF,
[ 10026 ] = ENG,
[ 10285 ] = ENG + TAIL,
[ 10286 ] = ALC + ENG + TAIL,
[ 10290 ] = TAIL + VENDOR,
[ 10450 ] = Q,
[ 10500 ] = ENG,
[ 10502 ] = ENG,
[ 10505 ] = ENG,
[ 10507 ] = ENG + ENG_Q,	--q ENG
[ 10543 ] = ENG,
[ 10546 ] = ENG,
[ 10558 ] = ENG,
[ 10559 ] = ENG + ENG_Q,	--q ENG
[ 10560 ] = ENG + Q,	--q
[ 10561 ] = ENG + Q,	--q
[ 10562 ] = Q,
[ 10575 ] = Q,
[ 10576 ] = ENG,
[ 10577 ] = ENG,
[ 10586 ] = ENG,
[ 10592 ] = ENG,
[ 10593 ] = Q,
[ 10620 ] = ALC,
[ 10647 ] = ENG + VENDOR,
[ 10648 ] = ENG + VENDOR,
[ 10938 ] = BS + ENC,
[ 10939 ] = ENC,
[ 10940 ] = ENC,
[ 10978 ] = ENC,
[ 10998 ] = ENC,
[ 11018 ] = Q,			--q
[ 11040 ] = TAIL + Q,	--q
[ 11082 ] = ENC,
[ 11083 ] = ALC + ENC,
[ 11084 ] = ENC,
[ 11128 ] = ENC + Q,
[ 11134 ] = ENC,
[ 11135 ] = ENC,
[ 11137 ] = ENC + TAIL,
[ 11138 ] = ENC,
[ 11139 ] = ENC,
[ 11144 ] = ENC,
[ 11174 ] = ENC + Q,		--q FELWOOD SALVE
[ 11175 ] = ENC,
[ 11176 ] = ALC + ENC + TAIL,
[ 11177 ] = ENC,
[ 11178 ] = ENC,
[ 11184 ] = BS + Q,		--q
[ 11185 ] = BS + Q,		--q
[ 11186 ] = BS + Q,		--q
[ 11188 ] = BS + Q,		--q
[ 11291 ] = ENC + VENDOR,
[ 11315 ] = Q,			--q BOP?
[ 11370 ] = Q,	-- MOUNT QUEST
[ 11371 ] = BS + ENG,
[ 11382 ] = BS + ENC + Q,
[ 11404 ] = DMF,
[ 11407 ] = DMF,
[ 11477 ] = HORDE,			--q HORDE
[ 11516 ] = Q,
[ 11563 ] = Q,
[ 11564 ] = Q,
[ 11567 ] = Q,
[ 11590 ] = DMF,
[ 11732 ] = Q,				-- q LIBRAM
[ 11733 ] = Q,				-- q LIBRAM
[ 11734 ] = Q,				-- q LIBRAM
[ 11736 ] = Q,				-- q LIBRAM
[ 11737 ] = Q,				-- q LIBRAM
[ 11751 ] = Q,
[ 11752 ] = Q,
[ 11753 ] = Q,
[ 11754 ] = BS + ENC + LW + Q,		-- q LIBRAM
[ 11951 ] = Q,
[ 11952 ] = Q,
[ 12037 ] = COOK,
[ 12184 ] = COOK,
[ 12202 ] = COOK,
[ 12203 ] = COOK,
[ 12204 ] = COOK,
[ 12205 ] = COOK,
[ 12206 ] = COOK,
[ 12207 ] = COOK + COOK_Q,	--q
[ 12208 ] = COOK,
[ 12223 ] = COOK,
[ 12238 ] = ALLI,			--q ALLIANCE
[ 12359 ] = ALC + BS + ENC + ENG + Q,  --q  BS
[ 12360 ] = BS + ENG + TAIL + PALADIN + WARLOCK,			--q MOUNT QUESTS (AQ QUEST)
[ 12361 ] = BS + ENG,
[ 12363 ] = ALC,
[ 12364 ] = BS + ENG + TAIL,
[ 12365 ] = BS + ENG,
[ 12431 ] = Q,			--q NO EXP
[ 12432 ] = Q,			--q NO EXP
[ 12433 ] = Q,			--q NO EXP
[ 12434 ] = Q,			--q NO EXP
[ 12435 ] = Q,			--q NO EXP
[ 12436 ] = Q,			--q NO EXP
[ 12607 ] = LW,
[ 12644 ] = BS + DMF,
[ 12655 ] = BS + ENG,
[ 12662 ] = BS + TAIL,
[ 12735 ] = Q,
[ 12753 ] = BS + LW + Q,
[ 12799 ] = BS + ENG,
[ 12800 ] = BS + ENG + TAIL + PALADIN + SHAMAN,		--q SHAMAN PALADIN MOUNT? AQ
[ 12803 ] = ALC + BS + ENC + ENG + LW + TAIL,
[ 12804 ] = ALC + BS + ENG + LW + TAIL,
[ 12808 ] = ALC + BS + ENC + ENG + TAIL,
[ 12809 ] = BS + ENC + LW + TAIL,
[ 12810 ] = BS + ENG + LW + TAIL,
[ 12811 ] = BS + ENC + TAIL,
[ 12938 ] = ALC + Q,
--[ 13365 ] = BS + ENG,		-- TYPO SOMETHING IS MISSING
[ 13180 ] = Q,		-- ALSO PALADIN MOUNT QUEST
[ 13422 ] = ALC,
[ 13423 ] = ALC,
[ 13463 ] = ALC,
[ 13464 ] = ALC,
[ 13465 ] = ALC,
[ 13466 ] = ALC,
[ 13467 ] = ALC + ENC + ENG,
[ 13468 ] = ALC + ENC + TAIL,
[ 13510 ] = BS,
[ 13512 ] = BS,			-- q ?? RAID QUEST
[ 13545 ] = HORDE,			--q HORDE
[ 13546 ] = HORDE,			--q HORDE
[ 13754 ] = COOK,
[ 13755 ] = COOK,
[ 13756 ] = COOK,
[ 13758 ] = COOK,
[ 13759 ] = COOK,
[ 13760 ] = COOK,
[ 13888 ] = COOK,
[ 13889 ] = COOK,
[ 13893 ] = COOK,
[ 13926 ] = ENC + TAIL,
[ 14044 ] = LW,
[ 14047 ] = FAID + BS + ENG + LW + TAIL + Q,	-- REP QUESTS & PALADIN MOUNT
[ 14048 ] = LW + TAIL + Q,
[ 14227 ] = ENG + LW + TAIL,
[ 14256 ] = LW + TAIL + WARLOCK,		--q WARLOCK
[ 14341 ] = LW + TAIL + VENDOR + Q,
[ 14342 ] = LW + TAIL,
[ 14343 ] = ENC,
[ 14344 ] = ENC + TAIL + Q,	--WARLOCK,		-- WARLOCK MOUNT, DM LIBRAM
[ 15407 ] = ENG + LW,
[ 15408 ] = LW,
[ 15409 ] = LW,
[ 15410 ] = LW,
[ 15412 ] = LW,
[ 15414 ] = LW,
[ 15415 ] = LW,
[ 15416 ] = LW + WARLOCK,		--q WARLOCK MOUNT
[ 15417 ] = BS + LW,
[ 15419 ] = LW,
[ 15420 ] = LW,
[ 15422 ] = LW,
[ 15423 ] = LW,
[ 15564 ] = DMF,
[ 15992 ] = ENG,
[ 15994 ] = ENG + Q + DMF,
[ 16000 ] = ENG,
[ 16006 ] = ENG,
[ 16202 ] = ENC,
[ 16203 ] = ENC + TAIL,
[ 16204 ] = ENC,
[ 16206 ] = ENC,
[ 16885 ] = ROGUE,		--q ROGUE
[ 17010 ] = BS + ENG + LW + TAIL + Q,
[ 17011 ] = BS + ENG + LW + TAIL + Q,
[ 17012 ] = BS + LW + TAIL + Q,
[ 17034 ] = ENC + VENDOR,
[ 17035 ] = ENC + VENDOR,
[ 17194 ] = COOK + VENDOR,
[ 17196 ] = COOK + VENDOR,
[ 17202 ] = ENG + VENDOR,
[ 17203 ] = BS,		--q BS
[ 18240 ] = LW + TAIL + Q,
[ 18255 ] = COOK,
[ 18256 ] = ALC + ENC + VENDOR,
[ 18329 ] = Q,
[ 18330 ] = Q,
[ 18331 ] = Q,
[ 18332 ] = Q,
[ 18333 ] = Q,
[ 18334 ] = Q,
[ 18335 ] = Q,	--SHAMAN + PALADIN,		--q LIBRAM SHAMAN PALADIN(MOUNT)
[ 18512 ] = ENC + LW,
[ 18631 ] = ENG,
[ 18944 ] = Q,
[ 18945 ] = Q,
[ 19441 ] = FAID,
[ 19698 ] = Q,
[ 19699 ] = Q,
[ 19700 ] = Q,
[ 19701 ] = Q,
[ 19702 ] = Q,
[ 19703 ] = Q,
[ 19704 ] = Q,
[ 19705 ] = Q,
[ 19706 ] = Q,
[ 19726 ] = BS + ENG + LW + TAIL,
[ 19767 ] = LW,
[ 19768 ] = LW,
[ 19774 ] = BS + ENG,
[ 19813 ] = Q,
[ 19814 ] = Q,
[ 19815 ] = Q,
[ 19816 ] = Q,
[ 19817 ] = Q,
[ 19818 ] = Q,
[ 19819 ] = Q,
[ 19820 ] = Q,
[ 19821 ] = Q,
[ 19858 ] = Q,
[ 19933 ] = DMF,
[ 19943 ] = ALC,
[ 20381 ] = LW,
[ 20424 ] = COOK,
[ 20498 ] = LW,
[ 20500 ] = LW,
[ 20501 ] = LW,
[ 20520 ] = BS + TAIL,
[ 20725 ] = BS + ENC,
[ 21024 ] = COOK,	--q	AQ MALLET?
[ 21071 ] = COOK,
[ 21153 ] = COOK,
[ 22202 ] = BS,
[ 22203 ] = BS,
[ 22682 ] = BS + LW + TAIL
}
