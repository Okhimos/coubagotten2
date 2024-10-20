--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

local ITEM = item.New(nil, true);
	ITEM.name = "Shot Base"
	ITEM.useText = "Зарядить"
	ITEM.useSound = false
	ITEM.category = "Shot"
	ITEM.roundsText = "Патроны"
	ITEM:AddData("Rounds", 1, true) -- default to 1 round
	ITEM.equippable = false; -- this blocks equipping the item as a melee weapon.
	ITEM.ammoMagazineSize = nil;
	ITEM.requiredReloadBelief = nil;
	
	-- A function to get the item's weight.
	function ITEM:GetItemWeight()
		return (self.weight / self.ammoMagazineSize) * self:GetData("Rounds") or 1;
	end

	-- A function to get the item's space.
	function ITEM:GetItemSpace()
		return (self.space / self.ammoMagazineSize) * self:GetData("Rounds") or 1;
	end
	
	-- Called whent he item entity's menu options are needed.
	function ITEM:GetEntityMenuOptions(entity, options)
		if self.ammoMagazineSize then
			local ammo = self:GetAmmoMagazine();
			
			if ammo and ammo > 0 then
				options["Unload Shot"] = {
					isArgTable = true,
					arguments = "cwItemMagazineAmmo",
					toolTip = toolTip
				};
			end;
		end;
	end;

	-- Called when a player uses the item.
	function ITEM:OnUse(player, itemEntity)
		if self.ammoType then
			if itemEntity and itemEntity.beingUsed then
				Schema:EasyText(player, "peru", "Этот предмет уже используется!");
				return false;
			end
			
			if player.HasBelief and self.requiredReloadBelief then
				if !player:HasBelief(self.requiredReloadBelief) then
					Schema:EasyText(player, "chocolate", "У тебя нету убеждения '"..cwBeliefs:GetBeliefName(self.requiredReloadBelief).."', а оно нужно для зарядки этого оружия!");
					
					return false;
				end
			end

			for i, v in ipairs(player:GetWeaponsEquipped()) do
				if v and self:CanUseOnItem(player, v, false) then
					self:UseOnItem(player, v, true, itemEntity);
					return false; -- Gets taken by the UseOnItem function after a delay.
				end
			end
		end
		
		Schema:EasyText(player, "chocolate", "У тебя нет оружия, в которое можно было бы зарядить этот патрон!");
		return false;
	end
	
	function ITEM:UseOnItem(player, weaponItem, canUse, itemEntity)
		if canUse or self:CanUseOnItem(player, weaponItem, true) then
			local consumeTime = weaponItem.reloadTime or 10;
		
			if player:HasBelief("dexterity") then
				consumeTime = math.Round(consumeTime * 0.67);
			end
			
			if player.holyPowderkegActive then
				consumeTime = math.Round(consumeTime * 0.33);
			end
			
			if weaponItem.reloadSounds then
				player:EmitSound(weaponItem.reloadSounds[1]);
			
				for i = 2, #weaponItem.reloadSounds do
					timer.Create(player:EntIndex().."reload"..i, consumeTime * ((i - 1) / #weaponItem.reloadSounds), 1, function()
						if IsValid(player) and Clockwork.player:GetAction(player) == "reloading" then
							player:EmitSound(weaponItem.reloadSounds[i]);
						end
					end);
				end
			end
			
			local weaponRaised = Clockwork.player:GetWeaponRaised(player);
			
			if weaponRaised then
				Clockwork.player:SetWeaponRaised(player, false);
			end
			
			if itemEntity then
				itemEntity.beingUsed = true;
				player.itemUsing = itemEntity;
			end
			
			player:SetLocalVar("cwProgressBarVerb", weaponItem.name);
			player:SetLocalVar("cwProgressBarItem", self.name);
			
			player.lastLoadedShot = self.uniqueID;
			
			Clockwork.player:SetAction(player, "reloading", consumeTime, nil, function()
				if IsValid(player) and weaponItem then
					if itemEntity and !IsValid(itemEntity) then
						Schema:EasyText(player, "peru", "Патрон, который вы заряжали, больше не существует!");
						return;
					end
					
					local weaponItemAmmo = weaponItem:GetData("Ammo");
				
					if not weaponItem.usesMagazine then
						table.insert(weaponItemAmmo, self.ammoType);
						
						weaponItem:SetData("Ammo", weaponItemAmmo);
					elseif #weaponItemAmmo <= 0 then
						if self.ammoMagazineSize then
							local rounds = self:GetAmmoMagazine();
							
							if rounds and rounds > 0 then
								for j = 1, rounds do
									table.insert(weaponItemAmmo, self.ammoType);
								end

								weaponItem:SetData("Ammo", weaponItemAmmo);
							end
						else
							-- Chambered single round.
							 
							table.insert(weaponItemAmmo, self.ammoType);
							
							weaponItem:SetData("Ammo", weaponItemAmmo);
						end
					end
					
					if weaponRaised then
						Clockwork.player:SetWeaponRaised(player, true);
					end
					
					if IsValid(itemEntity) then
						itemEntity:Remove();
					else
						player:TakeItem(self, true);
					end
				end
			end);
		end
	end
	
	function ITEM:CanUseOnItem(player, weaponItem, bNotify)
		local action = Clockwork.player:GetAction(player);
		
		if (action == "reloading") then
			if bNotify then
				Schema:EasyText(player, "peru", "Ты уже перезаряжаешься!");
			end
			
			return false;
		end
		
		if weaponItem and (weaponItem.category == "Firearms" or weaponItem.category == "Crossbows") and weaponItem.ammoTypes then
			if table.HasValue(weaponItem.ammoTypes, self.ammoType) then
				local weaponItemAmmo = weaponItem:GetData("Ammo");
				
				if weaponItemAmmo and #weaponItemAmmo < weaponItem.ammoCapacity then
					if player.HasBelief and self.requiredReloadBelief then
						if !player:HasBelief(self.requiredReloadBelief) then
							if bNotify then
								Schema:EasyText(player, "chocolate", "У тебя нету убеждения, '"..cwBeliefs:GetBeliefName(self.requiredReloadBelief).."', а оно необходимо для зарядки этого типа оружия!");
							end
							
							return false;
						end
					end
					
					if weaponItem.category == "Firearms" then
						if (player:WaterLevel() >= 3) then 
							Schema:EasyText(player, "peru", "Ты не можешь сделать это под водой!");
							
							return false;
						end
						
						if cwWeather then
							local lastZone = player:GetCharacterData("LastZone");
							local zoneTable = zones:FindByID(lastZone);
							
							if zoneTable and zoneTable.hasWeather and cwWeather:IsOutside(player:EyePos()) then
								if lastZone == "wasteland" or lastZone == "tower" then
									local weather = cwWeather.weather;
									
									if weather == "acidrain" or weather == "bloodstorm" or weather == "thunderstorm" then
										Schema:EasyText(player, "peru", "Слишком мокро, порох вымокнет! Нельзя делать это сейчас!");
								
										return false;
									end
								end
							end
						end
					end
					
					if not weaponItem.usesMagazine then
						return true;
					else
						if self.ammoMagazineSize and #weaponItemAmmo <= 0 then			
							local roundsLeft = self:GetAmmoMagazine();
							
							if roundsLeft and roundsLeft > 0 then
								return true;
							else
								if bNotify then
									Schema:EasyText(player, "peru", "Этот магазин пуст!!");
								end
								
								return false;
							end
						elseif #weaponItemAmmo <= 0 then
							-- Chambered single round.
							return true;
						else
							if bNotify then
								Schema:EasyText(player, "peru", "В настоящее время это оружие заряжено!");
							end
							
							return false;
						end
					end
				else
					if bNotify then
						Schema:EasyText(player, "peru", "У этого оружия закончились боеприпасы!");
					end
					
					return false;
				end
			else
				if bNotify then
					Schema:EasyText(player, "peru", "Это оружие использует другие патроны!");
				end
				
				return false;
			end
		else
			if bNotify then
				Schema:EasyText(player, "peru", "Это оружие не может использовать боеприпасы!");
			end
			
			return false;
		end
	end
	
	function ITEM:UseOnMagazine(player, magazineItem)
		if magazineItem and magazineItem.category == "Shot" and magazineItem.ammoMagazineSize then
			if magazineItem.ammoName == self.ammoName then
				local magazineItemAmmo = magazineItem:GetAmmoMagazine();
				
				if magazineItemAmmo and magazineItemAmmo < magazineItem.ammoMagazineSize then
					if magazineItem.SetAmmoMagazine then
						if SERVER then
							magazineItem:SetAmmoMagazine(magazineItemAmmo + 1);
							player:EmitSound("weapons/request day of defeat/m1903 springfield clipin.wav", 60, math.random(98, 102));
						end
						
						return true;
					end
				else
					Schema:EasyText(player, "peru", "Магазин этого оружия полон!");
					return false;
				end
			else
				Schema:EasyText(player, "peru", "Этот магазин не является правильным типом боеприпасов для данного патрона!");
				return false;
			end
		else
			Schema:EasyText(player, "chocolate", "Вы должны зарядить этот патрон в подходящий магазин или оружие!");
			return false;
		end
	end
	
	function ITEM:TakeFromMagazine(player)
		if IsValid(player) and self.ammoMagazineSize then
			local itemAmmo = self:GetAmmoMagazine();

			if itemAmmo and itemAmmo > 0 then
				local ammoItemID = string.gsub(string.lower(self.ammoName), " ", "_");
				local ammoItem = item.CreateInstance(ammoItemID);
				
				if ammoItem then
					self:SetAmmoMagazine(itemAmmo - 1);
					player:EmitSound("weapons/m1911/handling/m1911_boltback.wav", 60, math.random(98, 102), 0.7);
					player:GiveItem(ammoItem);
				end
				
				return;
			end
			
			Schema:EasyText(player, "peru", "Этот магазин нельзя разрядить!");
			return;
		end
	end

	-- Called when a player drops the item.
	function ITEM:OnDrop(player, position) end

	if (SERVER) then
		function ITEM:OnGenerated()
			self:SetData("Rounds", self.ammoMagazineSize)
		end
	else
		function ITEM:GetClientSideInfo()
			return Clockwork.kernel:AddMarkupLine("", "Rounds: "..self.ammoMagazineSize)
		end
	end
	
	function ITEM:GetAmmoMagazine()
		if self.ammoMagazineSize then
			-- Item is magazine.
			local rounds = self:GetData("Rounds");
			
			if (rounds) then
				return rounds;
			else
				return self.ammoMagazineSize;
			end;
		end;
	end;
	
	function ITEM:SetAmmoMagazine(amount)
		if self.ammoMagazineSize then
			if amount and self.SetData then
				self:SetData("Rounds", amount);
			end
		end;
	end
	
	ITEM:AddQueryProxy("ammoMagazineSize", ITEM.GetAmmoMagazine)
ITEM:Register()