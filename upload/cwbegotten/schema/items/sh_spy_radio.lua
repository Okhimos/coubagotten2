-- Reserve for events/admins only - Aly

local ITEM = Clockwork.item:New();
	ITEM.name = "ECW Рация";
	ITEM.model = "models/Items/battery.mdl";
	ITEM.weight = 1;
	ITEM.category = "Communication"
	ITEM.description = "Переносной блок радиоэлектронной борьбы, который чудом сохранился на протяжении веков.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/handheld_radio.png"
	ITEM.customFunctions = {"Frequency", "Turn On", "Turn Off", "Jamming On", "Jamming Off"};
	
	-- ITEM.itemSpawnerInfo = {category = "Communication", rarity = 150};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;

	if (SERVER) then
		function ITEM:OnCustomFunction(player, name)
			if (name == "Frequency") then
				netstream.Start(player, "Frequency", player:GetCharacterData("frequency", ""));
			elseif (name == "Turn On") then
				netstream.Start(player, "SetRadioState", player:GetCharacterData("radioState", false));
			elseif (name == "Turn Off") then
				netstream.Start(player, "SetRadioState", player:GetCharacterData("radioState", false));
			elseif (name == "Jamming On") then
				netstream.Start(player, "SetECWJamming", true);
			elseif (name == "Jamming Off") then
				netstream.Start(player, "SetECWJamming", false);
			end;
		end;
	end;
ITEM:Register();