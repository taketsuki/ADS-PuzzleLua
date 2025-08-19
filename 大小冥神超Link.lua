--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
--Partially rewritten by edo9300
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN+DUEL_SIMPLE_AI,5)
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Extra Deck (yours)
Debug.AddCard(98127546,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(71818935,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)

--Hand (yours)
Debug.AddCard(80965043,0,0,LOCATION_HAND,0,POS_FACEDOWN)

--Monster Zones (yours)
Debug.AddCard(52354896,0,0,LOCATION_MZONE,4,POS_FACEUP_ATTACK,true)
Debug.AddCard(53577438,0,0,LOCATION_MZONE,2,POS_FACEUP_ATTACK,true)

--Monster Zones (opponent's)
Debug.AddCard(53577438,1,1,LOCATION_MZONE,0,POS_FACEUP_DEFENSE,true)
Debug.AddCard(52354896,1,1,LOCATION_MZONE,1,POS_FACEUP_DEFENSE,true)

Debug.ReloadFieldEnd()
aux.BeginPuzzle()