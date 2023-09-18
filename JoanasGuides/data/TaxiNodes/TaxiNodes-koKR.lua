--[[ AUTOGENERATED - DO NOT MODIFY]]
--[[ See license.txt for license and copyright information ]]
if (GetLocale() ~= "koKR") then return end
select(2, ...).SetupGlobalFacade()

TaxiNodes = {
	[1] = "노스샤이어 대성당",
	[2] = "스톰윈드 (엘윈 숲)",
	[3] = "프로그래머의 섬",
	[4] = "감시의 언덕 (서부 몰락지대)",
	[5] = "레이크샤이어 (붉은마루 산맥)",
	[6] = "아이언포지 (던 모로)",
	[7] = "메네실 항구 (저습지)",
	[8] = "텔사마 (모단 호수)",
	[9] = "무법항 (가시덤불 골짜기)",
	[10] = "공동묘지 (은빛소나무 숲)",
	[11] = "언더시티 (티리스팔 숲)",
	[12] = "다크샤이어 (그늘숲)",
	[13] = "타렌 밀농장 (힐스브래드 구릉지)",
	[14] = "사우스쇼어 (힐스브래드 구릉지)",
	[15] = "동부 역병지대",
	[16] = "임시 주둔지 (아라시 고원)",
	[17] = "해머폴 (아라시 고원)",
	[18] = "무법항 (가시덤불 골짜기)",
	[19] = "무법항 (가시덤불 골짜기)",
	[20] = "그롬골 (가시덤불 골짜기)",
	[21] = "카르가스 (황야의 땅)",
	[22] = "썬더 블러프 (멀고어)",
	[23] = "오그리마 (듀로타)",
	[24] = "일반 (비행선 경로)",
	[25] = "크로스로드 (불모의 땅)",
	[26] = "아우버다인 (어둠의 해안)",
	[27] = "루테란 마을 (텔드랏실)",
	[28] = "아스트라나르 (잿빛 골짜기)",
	[29] = "해바위 야영지 (돌발톱 산맥)",
	[30] = "높새바람 봉우리 (버섯구름 봉우리)",
	[31] = "탈라나르 (페랄라스)",
	[32] = "테라모어 섬 (먼지진흙 습지대)",
	[33] = "돌발톱 봉우리 (돌발톱 산맥)",
	[34] = "운송 수단 (무법항 ~ 톱니항)",
	[35] = "운송 수단 (오그리마 비행선)",
	[36] = "일반 (세계 대상)",
	[37] = "나이젤의 야영지 (잊혀진 땅)",
	[38] = "그늘수렵 마을 (잊혀진 땅)",
	[39] = "가젯잔 (타나리스)",
	[40] = "가젯잔 (타나리스)",
	[41] = "페더문 요새 (페랄라스)",
	[42] = "모자케 야영지 (페랄라스)",
	[43] = "맹금의 봉우리 (동부 내륙지)",
	[44] = "발로르모크 (아즈샤라)",
	[45] = "네더가드 요새 (저주받은 땅)",
	[46] = "사우스쇼어 선착장 (힐스브래드 구릉지)",
	[47] = "운송 수단 (그롬골 ~ 오그리마)",
	[48] = "피멍울 초소 (악령의 숲)",
	[49] = "달의 숲",
	[50] = "운송 수단 (메네실 여객선)",
	[51] = "운송 수단 (루테란 ~ 아우버다인)",
	[52] = "눈망루 마을 (여명의 설원)",
	[53] = "눈망루 마을 (여명의 설원)",
	[54] = "운송 수단 (페더문 - 페랄라스)",
	[55] = "담쟁이 마을 (먼지진흙 습지대)",
	[56] = "스토나드 (슬픔의 늪)",
	[57] = "고기잡이 마을 (텔드랏실)",
	[58] = "조람가르 전초기지 (잿빛 골짜기)",
	[59] = "던 발다르 (알터랙 계곡)",
	[60] = "서리늑대 요새 (알터랙 계곡)",
	[61] = "토막나무 주둔지 (잿빛 골짜기)",
	[62] = "나이트헤이븐 (달의 숲)",
	[63] = "나이트헤이븐 (달의 숲)",
	[64] = "탈렌드리스 초소 (아즈샤라)",
	[65] = "갈퀴가지 숲 (악령의 숲)",
	[66] = "서리바람 야영지 (서부 역병지대)",
	[67] = "희망의 빛 예배당 (동부 역병지대)",
	[68] = "희망의 빛 예배당 (동부 역병지대)",
	[69] = "달의 숲",
	[70] = "화염 마루 (불타는 평원)",
	[71] = "모건의 망루 (불타는 평원)",
	[72] = "세나리온 요새 (실리더스)",
	[73] = "세나리온 요새 (실리더스)",
	[74] = "토륨 조합 거점 (이글거리는 협곡)",
	[75] = "토륨 조합 거점 (이글거리는 협곡)",
	[76] = "레반터스크 마을 (동부 내륙지)",
	[77] = "타우라조 야영지 (불모의 땅)",
	[78] = "낙스라마스",
	[79] = "마샬의 야영지 (운고로 분화구)",
	[80] = "톱니항 (불모의 땅)",
	[84] = "역병의 숲 경비탑 (동부 역병지대)",
	[85] = "북부관문 경비탑 (동부 역병지대)",
	[86] = "동부방벽 경비탑 (동부 역병지대)",
	[87] = "산마루 경비탑 (동부 역병지대)",
}