local ITEM = Clockwork.item:New();
	ITEM.name = "Рация";
	ITEM.model = "models/damnation/radio.mdl";
	ITEM.weight = 1;
    ITEM.uniqueID = "handheld_radio"
	ITEM.category = "Communication"
	ITEM.description = "Древнее технологическое достижение ушедшей эпохи, позволяющее осуществлять связь на огромных расстояниях.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/handheld_radio.png"
	ITEM.customFunctions = {"Частота", "Включить", "Выключить"};
	ITEM.itemSpawnerInfo = {category = "Communication", rarity = 800, bNoSupercrate = true};
	
	ITEM.components = {breakdownType = "breakdown", items = {"tech", "tech"}};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	if (SERVER) then
		function ITEM:OnCustomFunction(player, name)
			if (name == "Частота") then
				netstream.Start(player, "Frequency", player:GetCharacterData("frequency", ""));
			elseif (name == "Включить") then
				netstream.Start(player, "SetRadioState", player:GetCharacterData("radioState", false));
			elseif (name == "Выключить") then
				netstream.Start(player, "SetRadioState", player:GetCharacterData("radioState", false));
			end;
		end;
	end;
ITEM:Register();