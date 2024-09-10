--[[
	Begotten III: Jesus Wept
--]]

-- A function to add a new injury to the master table.
function cwMedicalSystem:RegisterInjury(uniqueID, data)
	if (!self.cwInjuryTable) then
		self.cwInjuryTable = {};
	end;

	if (!uniqueID or !isstring(uniqueID) or !data or !istable(data) or table.IsEmpty(data)) then
		return;
	elseif (!data.uniqueID) then
		data.uniqueID = uniqueID;
	end;

	local healItem = data.healItem;

	if (healItem) then
		if (!self.cwCureItems) then
			self.cwCureItems = {};
		end;
		
		if (!self.cwCureItems[healItem]) then
			self.cwCureItems[healItem] = {};
		end;
		
		table.insert(self.cwCureItems[healItem], uniqueID);
	end;
	
	if (!data.limb or !istable(data.limb) or table.IsEmpty(data.limb)) then
		data.limb = table.Copy(self.cwDefaultLimbs);
	end;

	self.cwInjuryTable[uniqueID] = table.Copy(data);
end;

local INJURY = {};
	INJURY.uniqueID = "broken_bone";
	INJURY.name = "Сломанная Конечность";
	INJURY.description = "Эта конечность имеет сломанную кость!";
	INJURY.symptom = " похоже, кость сломана.";
cwMedicalSystem:RegisterInjury(INJURY.uniqueID, INJURY);

local INJURY = {};
	INJURY.uniqueID = "burn";
	INJURY.name = "Ожог";
	INJURY.description = "Сильный ожог этой конечности!";
	INJURY.symptom = " сильно обгорел.";
	INJURY.OnReceive = function(injuryTable, player)
		local maxHealth = player:GetMaxHealth();
		
		player:SetMaxHealth(maxHealth);
		player:SetHealth(math.min(player:Health(), maxHealth));
	end;
	INJURY.OnTake = function(injuryTable, player)
		player:SetMaxHealth(player:GetMaxHealth());
	end;
cwMedicalSystem:RegisterInjury(INJURY.uniqueID, INJURY);

local INJURY = {};
	INJURY.uniqueID = "gash";
	INJURY.name = "Рваная Рана";
	INJURY.description = "У вас серьезная рана на этой конечности! Ее нельзя вылечить обычными повязками.";
	INJURY.symptom = " разорван и сильно кровоточит.";
	INJURY.causesBleeding = true;
	INJURY.surgeryInfo = {
		{tool = "suture", texts = {"начинает зашивать серьезную рану NAME's LIMB используя для этого иглу и нитку."}, messups = {texts = {"случайно пронзает NAME's LIMB пытаясь ее зашить!"}, damage = 5, causesBleeding = true}},
	};
cwMedicalSystem:RegisterInjury(INJURY.uniqueID, INJURY);

local INJURY = {};
	INJURY.uniqueID = "gunshot_wound";
	INJURY.name = "Пулевое Ранение";
	INJURY.description = "У тебя пуля застряла в этой конечности!";
	INJURY.symptom = " имеет пулевое отверстие, из которого хлещет кровь!";
	INJURY.causesBleeding = true;
	INJURY.surgeryInfo = {
		{tool = "scalpel", texts = {"начинает делать надрез на NAME's LIMB при помощи скальпеля."}, messups = {texts = {"очень неудачно двигает своей рукой и случайно прокалывает  NAME's LIMB пытаясь сделать надрез."}, damage = 5, causesBleeding = true}},
		{tool = "forceps", texts = {"использует щипцы, чтобы вытянуть пулю из NAME's LIMB, пытаясь сделать все аккуратно."}, messups = {texts = {"неловко двигает щипцами из-за чего пуля заходит еще глубже в NAME's."}}},
		{tool = "suture", texts = {"начинает зашивать рану на NAME's LIMB при помощи иглы и нитки."}, messups = {texts = {"случайно протыкает иголкой NAME's LIMB пытаясь зашить ту!"}, damage = 5, causesBleeding = true}},
	};
cwMedicalSystem:RegisterInjury(INJURY.uniqueID, INJURY);

local INJURY = {};
	INJURY.uniqueID = "infection";
	INJURY.name = "Инфекция";
	INJURY.description = "У тебя инфекция на этой конечности!";
	INJURY.symptom = " имеет гнойную инфекцию на месте предыдущей раны.";
cwMedicalSystem:RegisterInjury(INJURY.uniqueID, INJURY);

local INJURY = {};
	INJURY.uniqueID = "minor_infection";
	INJURY.name = "Слабая Инфекция";
	INJURY.description = "Твоя конечность слегка гноится!";
	INJURY.symptom = " имеет небольшую инфекцию на месте раны.";
cwMedicalSystem:RegisterInjury(INJURY.uniqueID, INJURY);
