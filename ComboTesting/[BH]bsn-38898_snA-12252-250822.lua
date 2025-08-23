--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
--Partially rewritten by edo9300
--[[message
在逃離三一的地下監牢的最後階段，
擋在聖園彌香與本能光秀面前的，竟然是一場殘局!?
（根據2025-08-22更新的內容為準）
*編按：快速上膛龍的①效果是時選發啊XP
	我方起始LP: 1100
	對方起始LP: 11000
	獲勝條件: 請在1回合內獲勝
]]
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,5)
Debug.SetAIName("臨時調整的殘局機關")
Debug.SetPlayerInfo(0,1100,0,0)
Debug.SetPlayerInfo(1,11000,0,0)

--Main Deck (yours)
Debug.AddCard(44095762,0,0,LOCATION_DECK,0,POS_FACEDOWN)

--Extra Deck (yours)
Debug.AddCard(72529749,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(73539069,0,0,LOCATION_EXTRA,0,POS_FACEDOWN) --撞針
Debug.AddCard(98462037,0,0,LOCATION_EXTRA,0,POS_FACEDOWN) --閃刀姬L2

--Hand (yours)
Debug.AddCard(12950294,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(7987191,0,0,LOCATION_HAND,0,POS_FACEDOWN) --槍管R龍
Debug.AddCard(6556178,0,0,LOCATION_HAND,0,POS_FACEDOWN)

--GY (yours)
Debug.AddCard(95448692,0,0,LOCATION_GRAVE,0,POS_FACEUP)
Debug.AddCard(68987122,0,0,LOCATION_GRAVE,0,POS_FACEUP,true)
--Debug.AddCard(78474168,0,0,LOCATION_GRAVE,0,POS_FACEUP) --突破技能

--Monster Zones (yours)
Debug.AddCard(98978921,0,0,LOCATION_MZONE,6,POS_FACEUP_ATTACK,true)
Debug.AddCard(98777036,0,0,LOCATION_MZONE,0,POS_FACEUP_ATTACK,true)
Debug.AddCard(31353051,0,0,LOCATION_MZONE,2,POS_FACEUP_ATTACK,true)
Debug.AddCard(26655293,0,0,LOCATION_MZONE,4,POS_FACEUP_ATTACK,true)
local m_0=Debug.AddCard(12023931,0,0,LOCATION_MZONE,3,POS_FACEUP_ATTACK,true)
Debug.PreSummon(m_0,SUMMON_TYPE_LINK,0,0,false)

--Monster Zones (opponent's)
Debug.AddCard(60349525,1,1,LOCATION_MZONE,1,POS_FACEUP_ATTACK,true)
local m_3=Debug.AddCard(60349525,1,1,LOCATION_MZONE,2,POS_FACEUP_ATTACK,true)
local m_4=Debug.AddCard(94092230,1,1,LOCATION_MZONE,4,POS_FACEUP_ATTACK,true)
local m_5=Debug.AddCard(74997493,1,1,LOCATION_MZONE,6,POS_FACEUP_ATTACK,true)
local m_1=Debug.AddCard(77585513,1,1,LOCATION_MZONE,0,POS_FACEUP_ATTACK,true)

--Spell & Trap Zones (opponent's)
Debug.AddCard(85742772,1,1,LOCATION_SZONE,3,POS_FACEUP)
Debug.AddCard(58921041,1,1,LOCATION_SZONE,2,POS_FACEUP)
Debug.AddCard(23516703,1,1,LOCATION_SZONE,1,POS_FACEUP)
Debug.AddCard(62279055,1,1,LOCATION_SZONE,0,POS_FACEDOWN)
--Debug.AddCard(10045474,1,1,LOCATION_SZONE,0,POS_FACEDOWN) --好強！太強了！我要發動《無限泡影》！
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
--Add ATK/DEF, copied from c74997493.lua
local function AddATKDEF(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_UPDATE_ATTACK)
	e1:SetValue(300)
	e1:SetReset(RESET_EVENT|RESETS_STANDARD)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EFFECT_UPDATE_DEFENSE)
	c:RegisterEffect(e2)
end
function SSDspREGOP(e,tp,eg,ep,ev,re,r,rp)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_FIELD+EFFECT_TYPE_TRIGGER_F)
	e1:SetProperty(EFFECT_FLAG_DELAY)
	e1:SetCode(EVENT_SUMMON_SUCCESS)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCondition(aux.zptcon(Card.IsFaceup))
	e1:SetOperation(s.atkop)
	e1:SetReset(RESET_EVENT|RESETS_STANDARD)
	c:RegisterEffect(e1)
	local e2=e1:Clone()
	e2:SetCode(EVENT_SPSUMMON_SUCCESS)
	c:RegisterEffect(e2)
end
--Equipped Cards
Equip(eq_0,m_1)
--鎖龍蛇加攻防
AddATKDEF(m_3)
AddATKDEF(m_4)
aux.BeginPuzzle()