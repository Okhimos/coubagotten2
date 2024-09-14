--[[
	By: DETrooper
--]]

local cwSailing = cwSailing;

local ITEM = Clockwork.item:New();
	ITEM.name = "Свиток Клана Харальд";
	ITEM.uniqueID = "scroll_longship";
	ITEM.category = "Naval";
	ITEM.model = "models/items/magic/scrolls/scroll_open.mdl";
	ITEM.weight = 0.1;
	ITEM.description = "Свиток и некоторое базовое навигационное оборудование. Он показывает подробную карту, где пришвартован Горейский Корабль.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll_open.png";
	ITEM.longshipEnt = "cw_longship";
	ITEM:AddData("customName", "", true);
	ITEM:AddData("health", -1, true);
	
	function ITEM:OnUseCustom(player, itemEntity, itemFunction)
		if (game.GetMap() != "rp_begotten3") then
			return;
		end;
	
		local faction = player:GetFaction();
		
		if (faction ~= "Goreic Warrior") then
			Schema:EasyText(player, "chocolate", "Ты не той фракции");
			return false;
		end;
		
		if player:GetCharacterData("LastZone") ~= "gore" then
			Schema:EasyText(player, "peru", "Ты должен быть в Лесу, чтобы пользоваться этим!");
			return false;
		end
		
		--[[if itemFunction == "dock" then
			local longshipEnt = cwSailing:LongshipExists(self.itemID);
			
			if longshipEnt then
				longshipEnt:Remove();
			else
				Schema:EasyText(player, "peru", "Корабль Пришвартован!");
			end
		else]]if itemFunction == "undock" then
			if cwSailing:LongshipExists(self.itemID) then
				Schema:EasyText(player, "peru", "Корабль Отшвартован!");
				return false;
			end
			
			local longshipEnt = cwSailing:SpawnLongship(player, "docks", self);
			
			if longshipEnt then
				if self:GetData("customName") and self:GetData("customName") ~= "" then
					longshipEnt:SetNWString("name", self:GetData("customName"));
				end
				
				if longshipEnt.longshipType ~= "ironclad" then
					if self:GetData("health") == -1 then
						if player:GetSubfaction() == "Clan Harald" then
							longshipEnt.health = 1000;
						else
							longshipEnt.health = 500;
						end
					else
						longshipEnt.health = self:GetData("health", 500);
					end
					
					--self:SetData("health", longshipEnt.health);
				end
			end
		elseif itemFunction == "rename" then
			Clockwork.dermaRequest:RequestString(player, "Rename Longship", "Какое имя ты хочешь дать своему судну?", "", function(result)
				if result and result:len() > 0 then
					local longshipEnt = cwSailing:LongshipExists(self.itemID);
				
					if IsValid(longshipEnt) then
						longshipEnt:SetNWString("name", result);
					end
					
					self:SetData("customName", result); 
				end
			end);
			
			return false;
		end
		
		player:EmitSound("begotten/items/note_turn.wav");

		--return false; -- Prevent this item from being used, it should be permanent.
		
		return true;
	end
	
	function ITEM:GetCustomName()
		local customName = self:GetData("customName");
		
		if customName and customName ~= "" then
			return "Scroll of '"..customName.."'";
		else
			return self.name;
		end
	end

	--[[function ITEM:CanTakeStorage(player, storageTable)
		local faction = player:GetFaction();
		
		if (faction ~= "Goreic Warrior") then
			return false;
		end;
	end;
	
	function ITEM:CanPickup(player, quickUse, itemEntity)
		local faction = player:GetFaction();
		
		if (faction ~= "Goreic Warrior") then
			return false;
		end;
	end;]]--
	
	function ITEM:OnDrop(player, itemEntity)
		
	end;
Clockwork.item:Register(ITEM);

local ITEM = Clockwork.item:New();
	ITEM.name = "Свиток с Броненосцем";
	ITEM.uniqueID = "scroll_ironclad";
	ITEM.category = "Naval";
	ITEM.model = "models/items/magic/scrolls/scroll_open.mdl";
	ITEM.weight = 0.1;
	ITEM.description = "В легендах Клана Шагалакс говорится, что тысяча паровых танков обрушилась на последователей Сияния. Живущие в лесу последователи Младшего Сына продолжили эту традицию, адаптировав свои методы к морским боевым машинам.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/scroll_open.png";
	ITEM.longshipEnt = "cw_longship_ironclad";
	ITEM:AddData("customName", "", true);
	ITEM:AddData("fuel", 0);
	ITEM:AddData("machinegunUpgrade", false);
	ITEM:AddData("ammo", 0);
	
	function ITEM:OnUseCustom(player, itemEntity, itemFunction)
		if (game.GetMap() != "rp_begotten3") then
			return;
		end;
	
		local faction = player:GetFaction();
		
		if (faction ~= "Goreic Warrior") then
			Schema:EasyText(player, "chocolate", "Ты не той фракции!");
			return false;
		end;
		
		if player:GetCharacterData("LastZone") ~= "gore" then
			Schema:EasyText(player, "peru", "Ты должен быть в Лесу!");
			return false;
		end
		
		--[[if itemFunction == "dock" then
			local longshipEnt = cwSailing:LongshipExists(self.itemID);
			
			if longshipEnt then
				longshipEnt:Remove();
			else
				Schema:EasyText(player, "peru", "Броненосец Пришвартован!");
			end
		else]]if itemFunction == "undock" then
			if cwSailing:LongshipExists(self.itemID) then
				Schema:EasyText(player, "peru", "Броненосец Отшвартован!");
				return false;
			end
			
			local longshipEnt = cwSailing:SpawnLongship(player, "docks", self);
			
			if longshipEnt then
				if self:GetData("customName") and self:GetData("customName") ~= "" then
					longshipEnt:SetNWString("name", self:GetData("customName"));
				end
			end
		elseif itemFunction == "rename" then
			Clockwork.dermaRequest:RequestString(player, "Rename Ironclad", "Какое имя ты хочешь дать этому чуду инженерной мысли?", "", function(result)
				if result and result:len() > 0 then
					local longshipEnt = cwSailing:LongshipExists(self.itemID);
				
					if IsValid(longshipEnt) then
						longshipEnt:SetNWString("name", result);
					end
					
					self:SetData("customName", result); 
				end
			end);
		end
		
		player:EmitSound("begotten/items/note_turn.wav");

		--return false; -- Prevent this item from being used, it should be permanent.
		
		return true;
	end
	
	function ITEM:GetCustomName()
		local customName = self:GetData("customName");
		
		if customName and customName ~= "" then
			return "Scroll of '"..customName.."'";
		else
			return self.name;
		end
	end

	--[[function ITEM:CanTakeStorage(player, storageTable)
		local faction = player:GetFaction();
		
		if (faction ~= "Goreic Warrior") then
			return false;
		end;
	end;
	
	function ITEM:CanPickup(player, quickUse, itemEntity)
		local faction = player:GetFaction();
		
		if (faction ~= "Goreic Warrior") then
			return false;
		end;
	end;]]--
	
	function ITEM:OnDrop(player, itemEntity)
		
	end;
Clockwork.item:Register(ITEM);

local ITEM = Clockwork.item:New();
	ITEM.name = "Комплект для модернизации «Броненосца»";
	ITEM.uniqueID = "ironclad_mgupgrade";
	ITEM.category = "Naval";
	ITEM.model = "models/kali/vehicles/cod4/technical_mg_m2.mdl";
	ITEM.weight = 30;
	ITEM.description = "В устных историях записано, что клан Шагалакс когда-то полагался на подавляющую огневую мощь в индустриальной войне с южным соперником. Среди племен приграничной области, ранее известной как Юта, такие примеры можно найти и собрать за непомерную цену.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ironclad_mgupgrade.png";
	ITEM.useText = "Улучшить Броненосец?";
	
	function ITEM:OnUse(player, itemEntity, itemFunction)
		if (game.GetMap() != "rp_begotten3") then
			return;
		end;
		
		local characterID = player:GetCharacterKey();
		local longshipEnt;
		
		for i, v in ipairs(ents.FindByClass("cw_longship_ironclad")) do
			if v.ownerID and v.ownerID == characterID then
				longshipEnt = v;
				
				break;
			end
		end
		
		if !IsValid(longshipEnt) or longshipEnt:GetClass() ~= "cw_longship_ironclad" then
			Schema:EasyText(player, "peru", "На Броненосец нельзя повесить второй Пулемёт!");
			
			return false;
		end
		
		local tr = util.TraceHull({
			start = player:EyePos(),
			endpos = player:GetPos() - Vector(0, 0, 100),
			maxs = player:OBBMaxs(),
			mins = player:OBBMins(),
			filter = function( ent ) return ( ent == longshipEnt ) end,
			collisiongroup = COLLISION_GROUP_NONE,
		});
		
		if !IsValid(tr.Entity) or tr.Entity ~= longshipEnt then
			Schema:EasyText(player, "peru", "Ты должен стоять на Броненосце!");
			
			return false;
		end
		
		--[[if longshipEnt.itemID then
			local itemTable = item.FindInstance(longshipEnt.itemID);
			
			if itemTable then
				if itemTable:GetData("machinegunUpgrade") == true then
					Schema:EasyText(player, "peru", "Теперь эта машина оснащена орудием смерти!");
				
					return false;
				else
					itemTable:SetData("machinegunUpgrade", true);
				end
			end
		end]]--
		
		if IsValid(longshipEnt.machinegun) then
			Schema:EasyText(player, "peru", "This ironclad has already been upgraded!");
			
			return false;
		end
		
		player:EmitSound("oneuse_deploy.ogg");
		
		longshipEnt:AttachMachinegun();
	end;
	
	function ITEM:OnDrop(player, itemEntity)
		
	end;
Clockwork.item:Register(ITEM);

local ITEM = Clockwork.item:New();
	ITEM.name = "Короб Патрон для Пулемета";
	ITEM.uniqueID = "ironclad_ammo_box";
	ITEM.category = "Naval";
	ITEM.model = "models/kali/vehicles/cod4/technical_mg_m2_ammobox_closed.mdl";
	ITEM.weight = 15;
	ITEM.description = "Ящик со старыми боеприпасами, приобретенными у далеких горейских племен Юты, специально для использования в пулемете броненосца.";
	ITEM.iconoverride = "materials/begotten/ui/itemicons/ironclad_ammo_box.png";
	
	function ITEM:OnDrop(player, itemEntity)
		
	end;
Clockwork.item:Register(ITEM);