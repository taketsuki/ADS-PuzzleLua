--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
--Partially rewritten by edo9300
--[[message
在逃離三一的地下監牢的最後階段，
擋在聖園彌香與本能光秀面前的，竟然是一場殘局!?
（根據個人方式調整了下我方處境）

	我方起始LP: 1100
	對方起始LP: 11000
	獲勝條件: 請在1回合內獲勝
]]
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI+DUEL_1ST_TURN_DRAW,5)
Debug.SetAIName("臨時調整的殘局機關")
Debug.SetPlayerInfo(0,1100,0,0)
Debug.SetPlayerInfo(1,11000,0,0)

--Main Deck (yours)
Debug.AddCard(53046408,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(5318639,0,0,LOCATION_DECK,0,POS_FACEDOWN)
Debug.AddCard(40619825,0,0,LOCATION_HAND,0,POS_FACEDOWN)

--Extra Deck (yours)
Debug.AddCard(72529749,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(73539069,0,0,LOCATION_EXTRA,0,POS_FACEDOWN) --撞針
--Debug.AddCard(98462037,0,0,LOCATION_EXTRA,0,POS_FACEDOWN),閃刀姬L2

--Hand (yours)
Debug.AddCard(97687912,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(70046172,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(54458867,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(79759861,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--Debug.AddCard(83104731,0,0,LOCATION_HAND,0,POS_FACEDOWN),原本的古機巨
Debug.AddCard(7987191,0,0,LOCATION_HAND,0,POS_FACEDOWN) --槍管R龍
Debug.AddCard(42878636,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--Debug.AddCard(53266486,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--Debug.AddCard(93612434,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--Debug.AddCard(32476603,0,0,LOCATION_HAND,0,POS_FACEDOWN)
--Debug.AddCard(83764718,0,0,LOCATION_HAND,0,POS_FACEDOWN)

--GY (yours)
Debug.AddCard(95448692,0,0,LOCATION_GRAVE,0,POS_FACEUP)
Debug.AddCard(68987122,0,0,LOCATION_GRAVE,0,POS_FACEUP,true)
Debug.AddCard(78474168,0,0,LOCATION_GRAVE,0,POS_FACEUP) --突破技能

--Monster Zones (yours)
Debug.AddCard(98978921,0,0,LOCATION_MZONE,6,POS_FACEUP_ATTACK,true)
Debug.AddCard(98777036,0,0,LOCATION_MZONE,0,POS_FACEUP_ATTACK,true)
Debug.AddCard(31353051,0,0,LOCATION_MZONE,2,POS_FACEUP_ATTACK,true)
Debug.AddCard(26655293,0,0,LOCATION_MZONE,4,POS_FACEUP_ATTACK,true)
local m_0=Debug.AddCard(12023931,0,0,LOCATION_MZONE,3,POS_FACEUP_ATTACK,true)
Debug.PreSummon(m_0,SUMMON_TYPE_LINK,0,0,false)

--Monster Zones (opponent's)
Debug.AddCard(60349525,1,1,LOCATION_MZONE,4,POS_FACEUP_ATTACK,true)
Debug.AddCard(60349525,1,1,LOCATION_MZONE,2,POS_FACEUP_ATTACK,true)
Debug.AddCard(67288539,1,1,LOCATION_MZONE,6,POS_FACEUP_ATTACK,true)
local m_1=Debug.AddCard(77585513,1,1,LOCATION_MZONE,3,POS_FACEUP_ATTACK,true)

--Spell & Trap Zones (opponent's)
Debug.AddCard(85742772,1,1,LOCATION_SZONE,3,POS_FACEUP)
Debug.AddCard(58921041,1,1,LOCATION_SZONE,2,POS_FACEUP)
Debug.AddCard(23516703,1,1,LOCATION_SZONE,1,POS_FACEUP)
Debug.AddCard(62279055,1,1,LOCATION_SZONE,0,POS_FACEDOWN)
local eq_0=Debug.AddCard(303660,1,1,LOCATION_SZONE,4,POS_FACEUP)

Debug.ReloadFieldEnd()

--Equip Function
local function Equip(c,target)
	Debug.PreEquip(c,target)
	local ctype=c:Type()
	if ctype&TYPE_EQUIP==0 then
		local code=EFFECT_CHANGE_TYPE
		local value=TYPE_EQUIP+TYPE_SPELL
		if c:IsType(TYPE_TRAP) then
			code=EFFECT_ADD_TYPE
			value=TYPE_EQUIP
		elseif ctype&TYPE_UNION~=0 then
			value=value+TYPE_UNION
		elseif ctype&TYPE_TOKEN~=0 then
			value=value+TYPE_TOKEN
		end
		local eff=Effect.CreateEffect(c)
		eff:SetType(EFFECT_TYPE_SINGLE)
		eff:SetCode(code)
		eff:SetValue(value)
		eff:SetProperty(EFFECT_FLAG_CANNOT_DISABLE)
		eff:SetReset(RESET_EVENT+0x17e0000)
		c:RegisterEffect(eff,true)
	end
end

--Equipped Cards
Equip(eq_0,m_1)
aux.BeginPuzzle()