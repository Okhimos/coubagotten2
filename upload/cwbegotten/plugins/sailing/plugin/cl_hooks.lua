--[[
	Begotten III: Jesus Wept
--]]

local cwSailing = cwSailing;

function cwSailing:GetProgressBarInfoAction(action, percentage)
	if (action == "burn_longship") then
		return {text = "Вы поджигаете корабль. ЛКМ чтобы отменить.", percentage = percentage, flash = percentage < 10};
	elseif (action == "extinguish_longship") then
		return {text = "Вы пытаетесь потушить корабль. ЛКМ чтобы отменить.", percentage = percentage, flash = percentage < 10};
	elseif (action == "repair_longship") then
		return {text = "Вы чините корабль. ЛКМ чтобы отменить.", percentage = percentage, flash = percentage < 10};
	elseif (action == "repair_alarm") then
		return {text = "Вы чините сигнализацию. ЛКМ чтобы отменить.", percentage = percentage, flash = percentage < 10};
	elseif (action == "repair_steam_engine") then
		return {text = "Вы чините паровой двигатель. ЛКМ чтобы отменить.", percentage = percentage, flash = percentage < 10};
	elseif (action == "refuel_ironclad") then
		return {text = "Вы добавляете уголь в двигатель броненосца. ЛКМ чтобы отменить.", percentage = percentage, flash = percentage < 10};
	end
end

-- Called when the local player's item menu should be adjusted.
function cwSailing:PlayerAdjustItemMenu(itemTable, menuPanel, itemFunctions)
	if (itemTable.uniqueID == "scroll_longship" or itemTable.uniqueID == "scroll_ironclad") then
		if Clockwork.Client:GetFaction() == "Goreic Warrior" and Clockwork.Client:GetZone() == "gore" then
			if (game.GetMap() != "rp_begotten3") then
				return;
			end;
			
			--[[menuPanel:AddOption("Dock", function()
				Clockwork.inventory:InventoryAction("dock", itemTable.uniqueID, itemTable.itemID);
			end);]]--

			menuPanel:AddOption("Подготовить", function()
				Clockwork.inventory:InventoryAction("undock", itemTable.uniqueID, itemTable.itemID);
			end);
			
			menuPanel:AddOption("Переименовать", function()
				Clockwork.inventory:InventoryAction("rename", itemTable.uniqueID, itemTable.itemID);
			end);
		end
	end
end;

function cwSailing:SubModifyItemMarkupTooltip(category, maximumWeight, weight, condition, percentage, name, itemTable, x, y, width, height, frame, bShowWeight)
	if category == "Naval" then
		local health = itemTable:GetData("health");
		
		if health then
			if health > 0 then
				frame:AddText("Состояние Корабля: "..tostring(health), Color(110, 30, 30), nil, 0.9);
			end
		end
	end
end

function cwSailing:CreateMenu(data)
	if (IsValid(menu)) then
		menu:Remove();
	end;
	
	local scrW = ScrW();
	local scrH = ScrH();
	local menu = DermaMenu();
	local isAdmin = Clockwork.Client:IsAdmin();
	local zone = Clockwork.Client:GetZone();
		
	menu:SetMinimumWidth(150);
	
	if !data then
		data = {};
	end
	
	local entity = data.entity;
	
	if !IsValid(entity) then
		return;
	end
	
	local location = data.location;
	
	if data.ignitable then
		if !data.ignited and !data.destination then
			if Clockwork.Client:GetFaction() ~= "Goreic Warrior" then
				local activeWeapon = Clockwork.Client:GetActiveWeapon();
				
				if activeWeapon:IsValid() and activeWeapon:GetClass() == "cw_lantern" and Clockwork.Client:IsWeaponRaised(activeWeapon) then
					local oil = Clockwork.Client:GetNetVar("oil", 0);
				
					--if oil >= 75 then
					if oil >= 1 then
						menu:AddOption("Сжечь", function() Clockwork.Client:ConCommand("cw_BurnShip") end);
					end
				end
			end
		end
	end
	
	if isAdmin or data.cargoholdopenable then
		menu:AddOption("Трюм", function() Clockwork.Client:ConCommand("cw_CargoHold") end);
	end
	
	menu:AddOption("Осмотреть", function() Clockwork.Client:ConCommand("cw_CheckShipStatus") end);
	
	if data.ignited then
		menu:AddOption("Потушить", function() Clockwork.Client:ConCommand("cw_ExtinguishShip") end);
	end
	
	if data.repairable then
		menu:AddOption("Починить", function() Clockwork.Client:ConCommand("cw_RepairShip") end);
	end
	
	if data.destination and data.location and !string.find(zone, "sea_") then
		menu:AddOption("Отменить Поход", function() Clockwork.Client:ConCommand("cw_AbortSailing") end);
	end
	
	if data.isOwner then
		if data.entity:GetNWBool("freeSailing") then
			menu:AddOption("Отключить Свободное Плавание", function() Clockwork.Client:ConCommand("cw_ShipToggleFreeSailing") end);
		else
			menu:AddOption("Включить Свободное Плавание", function() Clockwork.Client:ConCommand("cw_ShipToggleFreeSailing") end);
		end
		
		if data.location == "docks" then
			menu:AddOption("Пришвартовать", function() Clockwork.Client:ConCommand("cw_DockLongship") end);
		end
	end
	
	if data.sailable or (isAdmin and Clockwork.player:IsNoClipping(Clockwork.Client) and !data.destination) then
		local location = data.location;
		local submenu = menu:AddSubMenu("Отправиться", function() end);
			
		if location ~= "docks" then
			if location == "hell" or location == "wastelandlava" or location == "styx" then
				submenu:AddOption(" Отправиться по Реке Стикс в Горейский Лес", function() Clockwork.Client:ConCommand("cw_MoveShipGoreForest") end);
			else
				submenu:AddOption(" Отправиться по Морю в Горейский Лес", function() Clockwork.Client:ConCommand("cw_MoveShipGoreForest") end);
			end
		end
			
		if zone ~= "wasteland" then
			if location == "hell" or location == "styx" then
				submenu:AddOption(" Отправиться по реке Стикс в Долину Рока", function() Clockwork.Client:ConCommand("cw_MoveShipWasteland") end);
			else
				submenu:AddOption(" Отправиться по морю в Долину Рока", function() Clockwork.Client:ConCommand("cw_MoveShipWasteland") end);
			end
			
			submenu:AddOption("Отправиться по реке Стикс на Лавовый Берег", function() Clockwork.Client:ConCommand("cw_MoveShipLava") end);
		end
			
		if location ~= "hell" then
			submenu:AddOption("Отправиться по реке Стикс в Ад", function() Clockwork.Client:ConCommand("cw_MoveShipHell") end);
		end
	end
	
	if isAdmin then
		menu:AddOption("[ADMIN] Одобрить или Отклонить разрешение рейда Ада.", function() Clockwork.Client:ConCommand("cw_ShipToggleEnchantment") end);
	
		if location == "calm" or location == "rough" or location == "styx" then
			menu:AddOption("[ADMIN] Ускорить Таймер", function() Clockwork.Client:ConCommand("cw_ShipTimerSpeed") end);
			menu:AddOption("[ADMIN] Заморозить Таймер", function() Clockwork.Client:ConCommand("cw_ShipTimerPause") end);
		end
	end
	
	menu:Open();
	
	menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
end

netstream.Hook("OpenAlarmMenu", function(alarmEnt)
	if IsValid(alarmEnt) then
		if (IsValid(menu)) then
			menu:Remove();
		end;
		
		local scrW = ScrW();
		local scrH = ScrH();
		local menu = DermaMenu();
		
		menu:SetMinimumWidth(150);
		
		menu:AddOption("Осмотреть", function()
			Schema:EasyText("skyblue", "Самодельная система сигнализации с сейсмическими датчиками, настроенная на включение сигнала тревоги в случае прибытия кораблей Северных Захватчиков. Стоит обратить внимание, что сигнал тревоги недостаточно мощный, чтобы его можно было услышать из Башни Света, и он сработает только в том случае, если у Горвотча есть люди.");
		end);
		
		if alarmEnt:GetNWBool("broken") then
			menu:AddOption("Починить", function() Clockwork.Client:ConCommand("cw_RepairGorewatchAlarm") end);
		end
		
		menu:Open();
		menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
	end
end);

netstream.Hook("OpenLongshipMenu", function(data)
	cwSailing:CreateMenu(data);
end);

netstream.Hook("OpenSteamEngineMenu", function(steamEngineEnt)
	if IsValid(steamEngineEnt) then
		if (IsValid(menu)) then
			menu:Remove();
		end;
		
		local scrW = ScrW();
		local scrH = ScrH();
		local menu = DermaMenu();
		
		menu:SetMinimumWidth(150);
		
		menu:AddOption("Examine", function()
			if steamEngineEnt:GetNWBool("turnedOn") then
				Schema:EasyText("skyblue", "Монстр из древности, доведенный до рабочего состояния Кланом Шагалакс. Он приводит в действие Броненосец. Излучает едкий дым и оглушительный шум.");
			else
				Schema:EasyText("skyblue", "Монстр из древности, доведенный до рабочего состояния Кланом Шагалакс. Он приводит в действие Броненосец. Излучает едкий дым и оглушительный шум. По всей видимости, не функционирует.");
			end
		end);
		
		if steamEngineEnt:GetNWBool("broken") then
			menu:AddOption("Починить", function() Clockwork.Client:ConCommand("cw_SteamEngineRepair") end);
		else
			menu:AddOption("Добавить Топливо", function() Clockwork.Client:ConCommand("cw_SteamEngineFuel refuel") end);
			menu:AddOption("Проверить Топливо", function() Clockwork.Client:ConCommand("cw_SteamEngineFuel check") end);
		
			if steamEngineEnt:GetNWBool("turnedOn") then
				menu:AddOption("Отключить Двигатель", function() Clockwork.Client:ConCommand("cw_SteamEngine off") end);
			else
				menu:AddOption("Завести Двигатель", function() Clockwork.Client:ConCommand("cw_SteamEngine on") end);
			end
		end
		
		menu:Open();
		menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
	end
end);

netstream.Hook("DrowningCutscene", function(data)
	CreateSound(Clockwork.Client, "begotten/score5.mp3"):PlayEx(1, 100);
end);