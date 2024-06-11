BEGIN QD_DJOAP

	IF ~True()~ THEN BEGIN main
		SAY @1000
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0)~ + @1001 + character_points
		+ ~Global("QD_JOAP_CHARACTER_POINTS","GLOBAL",0)~ + @1001 + no_character_points
		+ ~Global("Specialist","GLOBAL",0) LevelGT(Protagonist,6)~ + @1002 + specialization1
		+ ~GlobalGT("Specialist","GLOBAL",0) Global("QD_JOAP_SECOND_SPECIALIZATION","GLOBAL",0) LevelGT(Protagonist,11)~ + @1003 + specialization2
		++ ~Nothing.~ EXIT  
	END  

	IF ~~ THEN BEGIN specialization1 
		SAY @1004 
		++ @1005 + specialization1.combat
		++ @1006 + specialization1.trickery
		++ @1007 + specialization1.magic
		++ @1008 + main
	END 


	IF ~~ THEN BEGIN specialization1.combat 
		SAY @1009
		+ ~Global("Specialist","GLOBAL",0)~ + @1010 DO ~SetGlobal("Specialist","GLOBAL",1) ChangeStat(Protagonist,STR,1,ADD)~ + specialization_pause
		+ ~Global("Specialist","GLOBAL",0)~ + @1011 + specialization1
		+ ~GlobalGT("Specialist","GLOBAL",0)~ + @1012 DO ~SetGlobal("QD_JOAP_SECOND_SPECIALIZATION","GLOBAL",1) SetGlobal("Specialist","GLOBAL",1) ChangeStat(Protagonist,STR,1,ADD)~ + specialization_pause
		+ ~GlobalGT("Specialist","GLOBAL",0)~ + @1011 + specialization2
		++ @1008 + main
	END 

	IF ~~ THEN BEGIN specialization1.trickery 
		SAY @1013
		+ ~Global("Specialist","GLOBAL",0)~ + @1014 DO ~SetGlobal("Specialist","GLOBAL",2) ChangeStat(Protagonist,DEX,1,ADD)~ + specialization_pause
		+ ~Global("Specialist","GLOBAL",0)~ + @1011 + specialization1
		+ ~GlobalGT("Specialist","GLOBAL",0)~ + @1015 DO ~SetGlobal("QD_JOAP_SECOND_SPECIALIZATION","GLOBAL",1) SetGlobal("Specialist","GLOBAL",2) ChangeStat(Protagonist,DEX,1,ADD)~ + specialization_pause
		+ ~GlobalGT("Specialist","GLOBAL",0)~ + @1011 + specialization2
		++ @1008 + main
	END 

	IF ~~ THEN BEGIN specialization1.magic 
		SAY @1016
		+ ~Global("Specialist","GLOBAL",0)~ + @1017 DO ~SetGlobal("Specialist","GLOBAL",3) ChangeStat(Protagonist,INT,1,ADD)~ + specialization_pause
		+ ~Global("Specialist","GLOBAL",0)~ + @1011 + specialization1
		+ ~GlobalGT("Specialist","GLOBAL",0)~ + @1018 DO ~SetGlobal("QD_JOAP_SECOND_SPECIALIZATION","GLOBAL",1) SetGlobal("Specialist","GLOBAL",3) ChangeStat(Protagonist,INT,1,ADD)~ + specialization_pause
		+ ~GlobalGT("Specialist","GLOBAL",0)~ + @1011 + specialization2
		++ @1008 + main
	END 


	IF ~~ THEN BEGIN specialization2 
		SAY @1004
		+ ~Global("Specialist","GLOBAL",1)~ + @1019 + specialization2.combat
		+ ~Global("Specialist","GLOBAL",1)~ + @1020 + specialization1.trickery
		+ ~Global("Specialist","GLOBAL",1)~ + @1021 + specialization1.magic
		+ ~Global("Specialist","GLOBAL",2)~ + @1022 + specialization2.trickery
		+ ~Global("Specialist","GLOBAL",2)~ + @1023 + specialization1.combat
		+ ~Global("Specialist","GLOBAL",2)~ + @1024 + specialization1.magic
		+ ~Global("Specialist","GLOBAL",3)~ + @1025 + specialization2.magic
		+ ~Global("Specialist","GLOBAL",3)~ + @1026 + specialization1.combat
		+ ~Global("Specialist","GLOBAL",3)~ + @1027 + specialization1.trickery
		++ @1008 + main
	END 


	IF ~~ THEN BEGIN specialization2.combat 
		SAY @1028
		++ @1010 DO ~SetGlobal("QD_JOAP_SECOND_SPECIALIZATION","GLOBAL",1) SetGlobal("Specialist","GLOBAL",4) ChangeStat(Protagonist,STR,1,ADD) ChangeStat(Protagonist,Con,1,ADD) ChangeStat(Protagonist,MAXHITPOINTS,3,ADD)~ + specialization_pause
		++ @1011 + specialization2
		++ @1008 + main
	END 

		IF ~~ THEN BEGIN specialization2.trickery 
		SAY @1029 
		++ @1014 DO ~SetGlobal("QD_JOAP_SECOND_SPECIALIZATION","GLOBAL",1) SetGlobal("Specialist","GLOBAL",5) ChangeStat(Protagonist,DEX,2,ADD) ChangeStat(Protagonist,LUCK,1,ADD)~ + specialization_pause
		++ @1011 + specialization2
		++ @1008+ main
	END 

		IF ~~ THEN BEGIN specialization2.magic 
		SAY @1030
		++ @1017 DO ~SetGlobal("QD_JOAP_SECOND_SPECIALIZATION","GLOBAL",1) SetGlobal("Specialist","GLOBAL",6) ChangeStat(Protagonist,INT,2,ADD) ChangeStat(Protagonist,WIS,1,ADD) ChangeStat(Protagonist,LORE,5,ADD)~ + specialization_pause
		++ @1011 + specialization2
		++ @1008 + main
	END 

	IF ~~ THEN BEGIN character_points
		SAY @1031  
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,STR)~ + @1032 + strength 
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,DEX)~ + @1033 + dexterity 
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,CON)~ + @1034 + constitution 
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,INT)~ + @1035 + intelligence 
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,WIS)~ + @1036 + wisdom 
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,CHR)~ + @1037 + charisma 
		++ @1008 + main 
	END 

	IF ~~ THEN BEGIN strength 
		SAY @1038 
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,STR)~ + ~1~ DO ~ChangeStat(Protagonist,STR,1,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-1) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",1) CheckStatLT(Protagonist,24,STR)~ + ~2~ DO ~ChangeStat(Protagonist,STR,2,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-2) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",2) CheckStatLT(Protagonist,23,STR)~ + ~3~ DO ~ChangeStat(Protagonist,STR,3,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-3) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",3) CheckStatLT(Protagonist,22,STR)~ + ~4~ DO ~ChangeStat(Protagonist,STR,4,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-4) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",4) CheckStatLT(Protagonist,21,STR)~ + ~5~ DO ~ChangeStat(Protagonist,STR,5,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-5) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		++ @1039 + character_points
	END 

	IF ~~ THEN BEGIN dexterity 
		SAY @1040
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,DEX)~ + ~1~ DO ~ChangeStat(Protagonist,DEX,1,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-1) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",1) CheckStatLT(Protagonist,24,DEX)~ + ~2~ DO ~ChangeStat(Protagonist,DEX,2,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-2) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",2) CheckStatLT(Protagonist,23,DEX)~ + ~3~ DO ~ChangeStat(Protagonist,DEX,3,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-3) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",3) CheckStatLT(Protagonist,22,DEX)~ + ~4~ DO ~ChangeStat(Protagonist,DEX,4,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-4) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",4) CheckStatLT(Protagonist,21,DEX)~ + ~5~ DO ~ChangeStat(Protagonist,DEX,5,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-5) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		++ @1039 + character_points
	END 

	IF ~~ THEN BEGIN constitution 
		SAY @1041
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,CON)~ + ~1~ DO ~ChangeStat(Protagonist,CON,1,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-1) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",1) CheckStatLT(Protagonist,24,CON)~ + ~2~ DO ~ChangeStat(Protagonist,CON,2,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-2) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",2) CheckStatLT(Protagonist,23,CON)~ + ~3~ DO ~ChangeStat(Protagonist,CON,3,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-3) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",3) CheckStatLT(Protagonist,22,CON)~ + ~4~ DO ~ChangeStat(Protagonist,CON,4,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-4) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",4) CheckStatLT(Protagonist,21,CON)~ + ~5~ DO ~ChangeStat(Protagonist,CON,5,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-5) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		++ @1039 + character_points
	END 

	IF ~~ THEN BEGIN intelligence 
		SAY @1042
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,INT)~ + ~1~ DO ~ChangeStat(Protagonist,INT,1,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-1) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",1) CheckStatLT(Protagonist,24,INT)~ + ~2~ DO ~ChangeStat(Protagonist,INT,2,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-2) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",2) CheckStatLT(Protagonist,23,INT)~ + ~3~ DO ~ChangeStat(Protagonist,INT,3,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-3) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",3) CheckStatLT(Protagonist,22,INT)~ + ~4~ DO ~ChangeStat(Protagonist,INT,4,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-4) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",4) CheckStatLT(Protagonist,21,INT)~ + ~5~ DO ~ChangeStat(Protagonist,INT,5,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-5) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		++ @1039 + character_points
	END 

	IF ~~ THEN BEGIN wisdom 
		SAY @1043 
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,WIS)~ + ~1~ DO ~ChangeStat(Protagonist,WIS,1,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-1) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",1) CheckStatLT(Protagonist,24,WIS)~ + ~2~ DO ~ChangeStat(Protagonist,WIS,2,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-2) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",2) CheckStatLT(Protagonist,23,WIS)~ + ~3~ DO ~ChangeStat(Protagonist,WIS,3,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-3) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",3) CheckStatLT(Protagonist,22,WIS)~ + ~4~ DO ~ChangeStat(Protagonist,WIS,4,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-4) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",4) CheckStatLT(Protagonist,21,WIS)~ + ~5~ DO ~ChangeStat(Protagonist,WIS,5,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-5) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		++ @1039 + character_points
	END 

	IF ~~ THEN BEGIN charisma 
		SAY @1044
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",0) CheckStatLT(Protagonist,25,CHR)~ + ~1~ DO ~ChangeStat(Protagonist,CHR,1,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-1) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",1) CheckStatLT(Protagonist,24,CHR)~ + ~2~ DO ~ChangeStat(Protagonist,CHR,2,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-2) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",2) CheckStatLT(Protagonist,23,CHR)~ + ~3~ DO ~ChangeStat(Protagonist,CHR,3,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-3) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",3) CheckStatLT(Protagonist,22,CHR)~ + ~4~ DO ~ChangeStat(Protagonist,CHR,4,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-4) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		+ ~GlobalGT("QD_JOAP_CHARACTER_POINTS","GLOBAL",4) CheckStatLT(Protagonist,21,CHR)~ + ~5~ DO ~ChangeStat(Protagonist,CHR,5,ADD) IncrementGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL",-5) SetTokenGlobal("QD_JOAP_CHARACTER_POINTS","GLOBAL","QD_JOAP_POINTS")~ + token_pause_state
		++ @1039 + character_points
	END 

	IF ~~ THEN BEGIN no_character_points
		SAY @1045
		IF ~~ GOTO main
	END 

	IF ~~ THEN BEGIN token_pause_state
		SAY @1046
		IF ~~ GOTO character_points
	END 

	IF ~~ THEN BEGIN specialization_pause
		SAY @1046
		IF ~~ GOTO main
	END 




