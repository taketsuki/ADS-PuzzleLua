--Created using senpaizuri's Puzzle Maker (updated by Naim & Larry126)
--Partially rewritten by edo9300
Debug.ReloadFieldBegin(DUEL_ATTACK_FIRST_TURN,5) -- +DUEL_SIMPLE_AI
Debug.SetPlayerInfo(0,8000,0,0)
Debug.SetPlayerInfo(1,8000,0,0)

--Extra Deck (yours)
Debug.AddCard(46759931,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)

--Hand (yours)
Debug.AddCard(40044918,0,0,LOCATION_HAND,0,POS_FACEDOWN)
Debug.AddCard(24094653,0,0,LOCATION_HAND,0,POS_FACEDOWN)

--Monster Zones (yours)
Debug.AddCard(58004362,0,0,LOCATION_MZONE,5,POS_FACEUP_ATTACK,true)
Debug.AddCard(22865492,0,0,LOCATION_MZONE,1,POS_FACEDOWN_DEFENSE,true)

--Monster Zones (opponent's)
Debug.AddCard(69946549,1,1,LOCATION_MZONE,0,POS_FACEUP_ATTACK,true)
Debug.AddCard(4928565,1,1,LOCATION_MZONE,1,POS_FACEUP_ATTACK,true)
Debug.AddCard(55623480,1,1,LOCATION_MZONE,2,POS_FACEUP_ATTACK,true)
Debug.AddCard(50277355,1,1,LOCATION_MZONE,5,POS_FACEUP_ATTACK,true)

Debug.ReloadFieldEnd()
aux.BeginPuzzle()