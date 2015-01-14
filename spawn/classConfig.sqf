#define VIP_ITEMS "ItemAntibiotic","ItemBloodbag","ItemEpinephrine","ItemMorphine"
#define VIP_TOOLS "Binocular_Vector","NVGoggles","ItemCompass","ItemHatchet","ItemKnife","Itemmatchbox","Itemetool","ItemSledge","ItemWatch","ItemGPS","ItemCrowbar"

_startBag = "DZ_Patrol_Pack_EP1";
_startMags = ["ItemBandage",3,"ItemPainkiller","ItemWaterbottle","FoodPistachio","17Rnd_9x19_glock17",3];
_startWeps = ["ItemMap","ItemFlashlight","ItemToolbox","glock17_EP1"];
_customLoadout = [
	"76561198133816969", // ebay //76561198014219874
	"0",
	"0"
];
_customLoadouts = [
	["ebay's Loadout","GUE_Soldier_2_DZ","BanditW2_DZ",["100Rnd_762x51_M240",2,"30Rnd_9x19_UZI_SD",3,"Skin_GUE_Soldier_Sniper_DZ",VIP_ITEMS],["Mk_48_DZ","UZI_SD_EP1",VIP_TOOLS],"DZ_Backpack_EP1",["5Rnd_86x70_L115A1",3],["BAF_LRR_scoped_W"]], // Replace duplicates with constants
	[],
	[]
];
_classLevel1 = ["76561198133816969","0","0"];
_classLevel2 = ["0","0","0"]; // To include other VIP levels in this list use +
_classLevel3 = ["0","0","0"];
_publicClasses = [
	[
		"Random",
		[["Survivor2_DZ","Haris_Press_EP1_DZ","Rocker1_DZ"],["SurvivorW2_DZ","SurvivorWdesert_DZ","SurvivorWurban_DZ"]],
		["ItemAntibiotic",2,"ItemMorphine","ItemEpinephrine"],2, // do not set number higher than # of unique mags
		["ItemCompass","ItemHatchet","ItemCrowbar"],2, // do not set number higher than # of unique tools
		["M4A1","AK_74","BAF_L85A2_RIS_Holo"],2,
		["MakarovSD","Colt1911","revolver_EP1"],3,
		["DZ_Assault_Pack_EP1","DZ_ALICE_Pack_EP1"], // use [""] for none
		[],4, // bag items
		[],2, // bag tools
		[],2, // bag wep
		[],3, // bag pistol
		0,0
	],
	["Bandit","Bandit2_DZ","BanditW1_DZ",["10x_303",2],["LeeEnfield"],"",[],[],0,-2000],
	["Hero","Soldier_Sniper_PMC_DZ","SurvivorWpink_DZ",["10x_303",2],["LeeEnfield"],"",[],[],0,5000],
	["Survivor","Survivor2_DZ","SurvivorW2_DZ",[],[],"",[],[],0,0],
	["British Soldier","Soldier1_DZ","SurvivorWcombat_DZ",["30Rnd_556x45_Stanag",2],["BAF_L85A2_RIS_Holo"],"",[],[],0,0],
	["Business Person","Functionary1_EP1_DZ","SurvivorWurban_DZ",["8Rnd_B_Beneli_74Slug",3,"ItemBriefcaseS20oz"],["Remington870_lamp"],"",[],[],0,0],
	["Civilian","Haris_Press_EP1_DZ","SurvivorW3_DZ",["15Rnd_W1866_Slug",2],["Winchester1866"],"",[],[],0,0],
	["Czech Soldier","CZ_Special_Forces_GL_DES_EP1_DZ","SurvivorWcombat_DZ",["30Rnd_762x39_SA58",2],["Sa58P_EP1"],"",[],[],0,0],
	["Police Officer","RU_Policeman_DZ","SurvivorWdesert_DZ",["8Rnd_B_Beneli_74Slug",3],["M1014"],"",[],[],0,0],
	["Rocker","Rocker1_DZ","SurvivorWurban_DZ",["30Rnd_9x19_MP5SD",2],["MP5SD"],"",[],[],0,0],
	["Terrorist","TK_INS_Soldier_EP1_DZ","BanditW2_DZ",["30Rnd_545x39_AK",2],["AK_74"],"",[],[],0,0],
	["US Soldier","Graves_Light_DZ","SurvivorWcombat_DZ",["30Rnd_556x45_Stanag",2],["M4A1"],"",[],[],0,0],
	["VIP Scout","INS_Soldier_AR_DZ","SurvivorW3_DZ",["100Rnd_556x45_BetaCMag",2,"15Rnd_9x19_M9SD",3,VIP_ITEMS],["m16a4_acg","M9SD","Binocular_Vector"],"DZ_ALICE_Pack_EP1",[],[],1,0],
	["VIP Specialist","INS_Soldier_CO_DZ","SurvivorWdesert_DZ",["100Rnd_762x51_M240",2,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["Mk_48_DZ","UZI_SD_EP1","Binocular_Vector"],"DZ_British_ACU",[],[],2,0],
	["VIP Sniper","GUE_Soldier_Sniper_DZ","SurvivorWurban_DZ",["20Rnd_762x51_DMR",2,"30Rnd_9x19_UZI_SD",3,VIP_ITEMS],["DMR","UZI_SD_EP1","Binocular_Vector"],"DZ_Backpack_EP1",[],[],3,0]
];