--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local ITEM = Clockwork.item:New();
	ITEM.name = "Маленький Бутылек Масла";
	ITEM.model = "models/weapons/w_oil.mdl";
	ITEM.weight = 0.1;
   ITEM.uniqueID = "small_bottle_of_oil"
	ITEM.useText = "Заправить";
	ITEM.category = "Fuel"
	ITEM.iconoverride = "materials/begotten/ui/itemicons/small_oil.png";
	ITEM.description = "Небольших размеров бутылек, доверху заполненный маслом.";
	ITEM.useSound = "begotten/ui/use_oil.mp3";
	ITEM.uniqueID = "small_oil";
	
	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		local activeWeapon = player:GetActiveWeapon();
		
		if (activeWeapon:GetClass() == "cw_lantern") then
			local weaponItemTable = item.GetByWeapon(activeWeapon);
			
			if weaponItemTable then
				local currentOil = weaponItemTable:GetData("oil");
				
				weaponItemTable:SetData("oil", math.Clamp(currentOil + 30, 0, 100));
				player:SetNetVar("oil", math.Round(weaponItemTable:GetData("oil"), 0));
				
				if (currentOil + 30) > 100 then
					Schema:EasyText(player, "olive", "Часть масла вылилась из лампы. Похоже, она полная.");
				end;
				
				return;
			end
		end
		
		Schema:EasyText(player, "firebrick", "Чтобы заправить лампу, ее нужно держать в руках!");
		
		return false;
	end;
	
	ITEM.itemSpawnerInfo = {category = "Industrial Junk", rarity = 80, bNoSupercrate = true};

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end;
ITEM:Register();