--[[
	Begotten III: Jesus Wept
--]]

local hitgroupToString = {
	[HITGROUP_CHEST] = "chest",
	[HITGROUP_HEAD] = "head",
	[HITGROUP_STOMACH] = "stomach",
	[HITGROUP_LEFTARM] = "left arm",
	[HITGROUP_RIGHTARM] = "right arm",
	[HITGROUP_LEFTLEG] = "left leg",
	[HITGROUP_RIGHTLEG] = "right leg",
	[HITGROUP_GENERIC] = "generic",
}

local limbs = {
	["Chest"] = {priority = 2},
	["Head"] = {priority = 1},
	["Stomach"] = {priority = 3},
	["Left Arm"] = {priority = 4},
	["Right Arm"] = {priority = 5},
	["Left Leg"] = {priority = 6},
	["Right Leg"] = {priority = 7},
}

-- Called when the HUD is painted.
function cwMedicalSystem:HUDPaint()
	if (self.bloodScreens and #self.bloodScreens > 0) then
		local frameTime = RealFrameTime();
		
		for k, v in pairs (self.bloodScreens) do
			local decal = v.decal;
			local x = v.x;
			local y = v.y;
			local rotation = v.rotation;
			local size = v.size;
			
			if (v.alpha > 0) then
				v.alpha = v.alpha - frameTime * 30;
			else
				self.bloodScreens[k] = nil;
			end;

			surface.SetDrawColor(255, 255, 255, 255);
			surface.SetMaterial(decal);
			surface.DrawTexturedRectRotated(x, y, size, size, rotation);
		end;
	end;
end;

function cwMedicalSystem:GetEntityMenuOptions(entity, options)
	if (entity:GetClass() == "prop_ragdoll") then
		local player = Clockwork.entity:GetPlayer(entity);

		if player and player:Alive() then
			entity = player;
		end;
	end
	
	if entity:IsPlayer() and entity:Alive() then
		if !Clockwork.Client:IsWeaponRaised() then
			local inventoryList = Clockwork.inventory:GetAsItemsList(Clockwork.inventory:GetClient());
			
			for k, itemTable in pairs (inventoryList) do
				if options["Heal"] and options["Heal"][itemTable.name] then continue end;
			
				if itemTable.baseItem == "medical_base" and itemTable.applicable then
					if !options["Heal"] then
						options["Heal"] = {}
					end;
					
					local optionsTable = {};
					
					if itemTable.limbs == "all" then
						optionsTable[string.gsub("Give", "^.", string.upper)] = function()
							Clockwork.inventory:InventoryAction("give_all", itemTable.uniqueID, itemTable.itemID);
						end;
					else
						local methods = itemTable.limbs;
						
						if itemTable.isSurgeryItem then
							if entity:IsRagdolled() then
								for i = 1, #methods do
									local hitGroupString = hitgroupToString[methods[i]];
									
									optionsTable[string.gsub(hitGroupString, "^.", string.upper)] = function()
										Clockwork.inventory:InventoryAction(string.gsub("give_"..hitGroupString, " ", "_"), itemTable.uniqueID, itemTable.itemID);
									end;
								end;
							end
						else
							for i = 1, #methods do
								local hitGroupString = hitgroupToString[methods[i]];
								
								optionsTable[string.gsub(hitGroupString, "^.", string.upper)] = function()
									Clockwork.inventory:InventoryAction(string.gsub("give_"..hitGroupString, " ", "_"), itemTable.uniqueID, itemTable.itemID);
								end;
							end;
						end;
					end;
					
					options["Heal"][itemTable.name] = optionsTable;
				end
			end
		end
	end;
end;

-- Called every frame.
--[[function cwMedicalSystem:Think()
	local action = Clockwork.player:GetAction(Clockwork.Client);
	local curTime = CurTime();
	
	if (Clockwork.Client:Alive() and action == "die") then
		bleedOutTrack = "begotten/l4d2/puddleofyou.wav";
		
		if (!bleedOutPatch and bleedOutTrack != nil) then
			bleedOutPatch = CreateSound(Clockwork.Client, bleedOutTrack);
			
			if (!bleedOutPatch:IsPlaying()) then
				bleedOutPatch:PlayEx(1, 100);
			end;
		end;
		
		clingingTrack = "begotten/soundtrack/sh4/conflicting_view.mp3";
		
		if (!clingingPatch and clingingTrack != nil) then
			clingingPatch = CreateSound(Clockwork.Client, clingingTrack);
			
			if (!clingingPatch:IsPlaying()) then
				clingingPatch:PlayEx(1, 100);
			end;
		end;
	elseif (Clockwork.Client:Alive() and action != "die") then
		if (bleedOutPatch and bleedOutPatch:IsPlaying()) then
			bleedOutPatch:Stop();
			bleedOutPatch = nil;
		end;
		
		if (clingingPatch and clingingPatch:IsPlaying()) then
			clingingPatch:Stop();
			clingingPatch = nil;
		end;
	elseif (!Clockwork.Client:Alive() and action != "die") then
		if (bleedOutPatch and bleedOutPatch:IsPlaying()) then
			bleedOutPatch:FadeOut(8);
			bleedOutPatch = nil;
		end;
		
		if (clingingPatch and clingingPatch:IsPlaying()) then
			clingingPatch:FadeOut(8);
			clingingPatch = nil;
		end;
		
		if (!Clockwork.kernel:IsChoosingCharacter() and Clockwork.Client:HasInitialized()) then
			if (!Clockwork.Client.nextDeath or Clockwork.Client.nextDeath < curTime) then
				Clockwork.Client.nextDeath = curTime + 60;
				
				RunConsoleCommand("stopsound");
				
				timer.Simple(0.1, function()
					Clockwork.Client:EmitSound("begotten/soundtrack/sh3/uncomfortable_silence.mp3");
					Clockwork.Client:EmitSound("begotten/l4d2/leftfordeath.wav");
				end);
			end;
		end;
	end;
end;]]--

-- Called when the foreground HUD should be painted.
function cwMedicalSystem:HUDPaintForeground()
	if (Clockwork.Client:Alive() and Clockwork.Client:HasInitialized()) then
		local colorRed = Clockwork.option:GetColor("negative_hint");
		local colorWhite = Clockwork.option:GetColor("white");
		local action = Clockwork.player:GetAction(Clockwork.Client);
		
		if (action == "die") then
			local scrW = ScrW();
			local srcH = ScrH();
			local alpha = 255;
			local x = scrW / 2;
			local y = (srcH / 2) - 128;

			Clockwork.kernel:OverrideMainFont(Clockwork.option:GetFont("menu_text_small"));
			y = Clockwork.kernel:DrawInfo("ТЫ УМИРАЕШЬ ОТ СВОИХ РАН...", x, y, colorRed, alpha);
			Clockwork.kernel:OverrideMainFont(false);
		elseif (action == "die_bleedout") then
			local scrW = ScrW();
			local srcH = ScrH();
			local alpha = 255;
			local x = scrW / 2;
			local y = (srcH / 2) - 128;

			Clockwork.kernel:OverrideMainFont(Clockwork.option:GetFont("menu_text_small"));
			y = Clockwork.kernel:DrawInfo("ТЫ ИСТЕКАЕШЬ КРОВЬЮ...", x, y, colorRed, alpha);
			Clockwork.kernel:OverrideMainFont(false);
		end;	
	end;
end;

-- Called when the post progress bar info is needed.
function cwMedicalSystem:GetProgressBarInfoAction(action, percentage)
	if (action == "heal") then
		return {text = "Ты лечишь себя. Нажми ЛКМ, чтобы отменить.", percentage = percentage, flash = percentage > 75};
	elseif (action == "healing") then
		return {text = "Ты лечишь кого-то. Нажми ЛКМ, чтобы отменить.", percentage = percentage, flash = percentage > 75};
	elseif (action == "performing_surgery") then
		return {text = "Ты проводишь кому-то операцию. Нажми ЛКМ, чтобы отменить.", percentage = percentage, flash = percentage > 75};
	elseif (action == "chloroform") then
		return {text = "Ты используешь на ком-то хлороформ. Нажми ЛКМ, чтобы отменить.", percentage = percentage, flash = percentage > 75};
	elseif (action == "die") then
		return {text = "Ты медленно умираешь.", percentage = percentage, flash = percentage > 75};
	elseif (action == "die_bleedout") then
		return {text = "Ты медленно истекаешь кровью.", percentage = percentage, flash = percentage > 75};
	end;
end;

-- Called when the local player attempts to get up.
function cwMedicalSystem:PlayerCanGetUp(action)
	if action == "die" or action == "die_bleedout" then
		return false;
	end
end;

-- Called when the screenspace effects are rendered.
function cwMedicalSystem:RenderScreenspaceEffects()
	if Clockwork.Client:HasInitialized() and Clockwork.Client:Alive() and !Clockwork.kernel:IsChoosingCharacter() then
		local curTime = CurTime();
			
		if (self.morphineDream and self.morphineDream > curTime) then
			--[[if (self.flashed) then
				self.flashed = nil;
			end;]]--
			
			local modify = {};
				modify["$pp_colour_contrast"] = 6;
				modify["$pp_colour_colour"] = 0.8;
			DrawColorModify(modify);
			
			if (!morphinePatch) then
				morphinePatch = CreateSound(Clockwork.Client, "begotten/ambient/special/morphine_dream_loop.wav");
				
				if (!morphinePatch:IsPlaying()) then
					morphinePatch:PlayEx(0, 100);
					morphinePatch:ChangeVolume(1, 3);
					self.IsFadingMorphine = false;
				end;
			end;
		else
			--[[if (!self.flashed) then
				self.flashed = true;
				
				cwExplosives:AddStunEffect(4);
			end;]]--
		
			--[[local bloodLevel = Clockwork.Client:GetNWInt("bloodLevel") or self.maxBloodLevel;
			local lethalBloodLoss = self.lethalBloodLoss;
			
			if bloodLevel < self.maxBloodLevel then
				local modify = {};
				
				modify["$pp_colour_colour"] = math.Clamp((bloodLevel - lethalBloodLoss) / lethalBloodLoss, 0, 1);
					
				DrawColorModify(modify);
			end]]--
			
			if (morphinePatch and !self.IsFadingMorphine) then
				morphinePatch:FadeOut(8);
				self.IsFadingMorphine = true;
				
				Schema:AddFlashEffect();
				
				timer.Simple(8, function()
					morphinePatch = nil;
				end);
			end;
		end;
		
		if (!self.nauseaAttack or self.nauseaAttack < curTime) then
			if !Clockwork.Client:IsRagdolled() and not Clockwork.Client.dueling and Clockwork.Client:HasInitialized() and !Clockwork.Client.LoadingText then
				local symptoms = Clockwork.Client:GetNetVar("symptoms", {});
				
				if table.HasValue(symptoms, "Nausea") then
					local strings = {"Черт..Я вот-вот блевану!", "Меня сейчас стошнит!"};
					
					CRAZYBOB = 75;
					
					Clockwork.chatBox:Add(nil, nil, Color(255, 255, 150, 255), "*** "..strings[math.random(1, #strings)]);
				end
			end
			
			self.nauseaAttack = curTime + math.random(300, 900);
			
			if self.headache and self.headache < curTime + 30 then
				self.headache = curTime + math.random(30, 60);
			end
		end
		
		if (!self.headache or self.headache < curTime) then
			if !Clockwork.Client:IsRagdolled() and not Clockwork.Client.dueling and Clockwork.Client:HasInitialized() and !Clockwork.Client.LoadingText then
				local symptoms = Clockwork.Client:GetNetVar("symptoms", {});
				
				if table.HasValue(symptoms, "Headaches") then
					local strings = {"My head is pounding!", "Моя блядская голова!", "Как же болит голова...Блядь."};
					
					if cwMelee then
						util.ScreenShake(Clockwork.Client:GetPos(), 15, 2, 3, 10);
						cwMelee.blurAmount = 5;
					end
					
					Clockwork.chatBox:Add(nil, nil, Color(255, 255, 150, 255), "*** "..strings[math.random(1, #strings)]);
					Clockwork.Client:EmitSound("begotten/ui/sanity_damage.mp3");
					
					netstream.Start("TakeSanity", 5);
				end
			end
			
			self.headache = curTime + math.random(120, 360);
			
			if self.headache and self.nauseaAttack < curTime + 30 then
				self.nauseaAttack = curTime + math.random(30, 60);
			end
		end
	end;
end;

-- Called when the local player's item menu should be adjusted.
function cwMedicalSystem:PlayerAdjustItemMenu(itemTable, menuPanel, itemFunctions)
	if (itemTable.isMedical) then
		if (itemTable.applicable) then
			if itemTable.limbs == "all" then
				if itemTable.useOnSelf then
					menuPanel:AddOption("Apply", function()
						Clockwork.inventory:InventoryAction("apply_all", itemTable.uniqueID, itemTable.itemID);
					end);
				end;
				
				menuPanel:AddOption("Give", function()
					Clockwork.inventory:InventoryAction("give_all", itemTable.uniqueID, itemTable.itemID);
				end);
			else
				local methods = itemTable.limbs;
				
				if itemTable.useOnSelf then
					local subMenu = menuPanel:AddSubMenu("Apply to...");
				
					if (table.IsEmpty(itemTable.limbs)) then
						for k, v in SortedPairsByMemberValue (limbs, "priority") do
							local hitGroupString = hitgroupToString[k];
							
							subMenu:AddOption(string.utf8upper(hitGroupString:utf8sub(1, 1)) .. hitGroupString:utf8sub(2), function()
								Clockwork.inventory:InventoryAction(string.gsub("apply_"..hitGroupString, " ", "_"), itemTable.uniqueID, itemTable.itemID);
							end);
						end;
					else
						for i = 1, #methods do
							local hitGroupString = hitgroupToString[methods[i]];
							
							subMenu:AddOption(string.utf8upper(hitGroupString:utf8sub(1, 1)) .. hitGroupString:utf8sub(2), function()
								Clockwork.inventory:InventoryAction(string.gsub("apply_"..hitGroupString, " ", "_"), itemTable.uniqueID, itemTable.itemID);
							end);
						end;
					end;
				end;
				
				if itemTable.isSurgeryItem then
					subMenu = menuPanel:AddSubMenu(itemTable.useText.."...");
					
					for i = 1, #methods do
						local hitGroupString = hitgroupToString[methods[i]];
						
						subMenu:AddOption(string.utf8upper(hitGroupString:utf8sub(1, 1)) .. hitGroupString:utf8sub(2), function()
							Clockwork.inventory:InventoryAction(string.gsub("give_"..hitGroupString, " ", "_"), itemTable.uniqueID, itemTable.itemID);
						end);
					end;
				else
					subMenu = menuPanel:AddSubMenu("Give...");
					
					for i = 1, #methods do
						local hitGroupString = hitgroupToString[methods[i]];
						
						subMenu:AddOption(string.utf8upper(hitGroupString:utf8sub(1, 1)) .. hitGroupString:utf8sub(2), function()
							Clockwork.inventory:InventoryAction(string.gsub("give_"..hitGroupString, " ", "_"), itemTable.uniqueID, itemTable.itemID);
						end);
					end;
				end;
			end;
		end;
		
		if (itemTable.ingestible and !table.IsEmpty(itemTable.ingestible) and itemTable.useOnSelf) then
			local methods = itemTable.ingestible;
			
			if (table.Count(itemTable.ingestible) > 1) then
				local subMenu = menuPanel:AddSubMenu("Ingest...");

				for k, v in pairs (methods) do
					if v ~= false then
						subMenu:AddOption(string.utf8upper(k:utf8sub(1, 1)) .. k:utf8sub(2), function()
							Clockwork.inventory:InventoryAction("ingest_"..k, itemTable.uniqueID, itemTable.itemID);
						end);
					end
				end;
			else
				for k, v in pairs (methods) do
					if v ~= false then
						menuPanel:AddOption(string.utf8upper(k:utf8sub(1, 1)) .. k:utf8sub(2), function()
							Clockwork.inventory:InventoryAction("ingest_"..k, itemTable.uniqueID, itemTable.itemID);
						end);
					end;
				end;
			end;
		end;
	end;
end;

-- Called when the target's symptoms should be drawn.
function cwMedicalSystem:DrawTargetPlayerSymptoms(target, alpha, x, y)
	local textColor = Color(200, 50, 50, 255);
	local symptoms = target:GetNetVar("symptoms", {});
	local symptomText;
	
	for i = 1, #symptoms do
		local symptom = symptoms[i];
		
		if symptom == "Paleness" then
			if symptomText then
				symptomText = symptomText.." Он выглядит очень бледным и болезненным.";
			else
				symptomText = "Он выглядит очень бледным и болезненным.";
			end
		elseif symptom == "Pustules" then
			if symptomText then
				symptomText = symptomText.." Он покрыт пастулами и бубонами.";
			else
				symptomText = "Он покрыт пастулами и бубонами.";
			end
		--[[elseif symptom == "Deformities" then
			if symptomText then
				symptomText = symptomText.." Their skin is deformed and discolored, and their eyes bulging.";
			else
				symptomText = "Their skin is deformed and discolored, and their eyes bulging.";
			end]]
		end
	end

	if symptomText then
		return Clockwork.kernel:DrawInfo(Clockwork.kernel:ParseData(symptomText), x, y, textColor, alpha);
	end
end

function cwMedicalSystem:ModifyStatusEffects(tab)
	local bloodLevel = Clockwork.Client:GetNWInt("bloodLevel", self.maxBloodLevel);
	local symptoms = Clockwork.Client:GetNetVar("symptoms", {});

	if Clockwork.Client.cwLimbs then
		for k, v in pairs(Clockwork.Client.cwLimbs) do
			local hitGroupString = k;
			
			if isnumber(k) then
				hitGroupString = hitgroupToString[k];
			end
			
			if v.bleeding then
				table.insert(tab, {text = "(-) "..(string.utf8upper(hitGroupString:utf8sub(1, 1)) .. hitGroupString:utf8sub(2))..": Bleeding", color = Color(200, 40, 40)});
			end
			
			--[[if v.infected and v.infected > 0 then
				if v.infected == 1 then
					table.insert(tab, {text = "(-) "..string.gsub(hitGroupString, "^.", string.upper)..": Minor Infection", color = Color(200, 40, 40)});
				elseif v.infected == 2 then
					table.insert(tab, {text = "(-) "..string.gsub(hitGroupString, "^.", string.upper)..": Infection", color = Color(200, 40, 40)});
				else
					table.insert(tab, {text = "(-) "..string.gsub(hitGroupString, "^.", string.upper)..": Major Infection", color = Color(200, 40, 40)});
				end
			end]]--
		end
	end
	
	if bloodLevel <= self.maxBloodLevel - 250 and bloodLevel > self.maxBloodLevel - 750 then
		table.insert(tab, {text = "(-) Лёгкая Кровопотеря", color = Color(200, 40, 40)});
	elseif bloodLevel <= self.maxBloodLevel - 750 and bloodLevel > self.maxBloodLevel - 1500 then
		table.insert(tab, {text = "(-) Кровопотеря", color = Color(200, 40, 40)});
	elseif bloodLevel <= self.maxBloodLevel - 1500 and bloodLevel > self.lethalBloodLoss then
		table.insert(tab, {text = "(-) Серьёзная Кровопотеря", color = Color(200, 40, 40)});
	end
	
	for i = 1, #symptoms do
		table.insert(tab, {text = "(-) "..symptoms[i], color = Color(200, 40, 40)});
	end
	
	if Clockwork.Client.cwInjuries then
		for k, v in pairs(Clockwork.Client.cwInjuries) do
			local hitGroupString = hitgroupToString[k];
			
			for i = 1, #v do
				local injury = self.cwInjuryTable[v[i]];
				
				table.insert(tab, {text = "(-) "..(string.utf8upper(hitGroupString:utf8sub(1, 1)) .. hitGroupString:utf8sub(2))..": "..injury.name, color = Color(200, 40, 40)});
			end
		end
	end
end