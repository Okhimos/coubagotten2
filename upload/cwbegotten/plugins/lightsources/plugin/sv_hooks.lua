--[[
	Begotten III: Jesus Wept
--]]

-- Called at an interval while a player is connected.
function cwLantern:PlayerThink(player, curTime, infoTable, alive, initialized, plyTab)
	local activeWeapon = player:GetActiveWeapon();
	
	if !activeWeapon:IsValid() then return end;
	
	local lanternOnHip = player:GetNetVar("lanternOnHip");

	if lanternOnHip and (!player:HasWeapon("cw_lantern") or activeWeapon:GetClass() == "cw_lantern") then
		player:SetNetVar("lanternOnHip", false);
		lanternOnHip = false;
	end

	if !plyTab.nextLanternBurn then plyTab.nextLanternBurn = curTime + math.random(60, 120); end

	if (plyTab.nextLanternBurn <= curTime and lanternOnHip and player:GetNetVar("oil", 0) > 20 and !player:GetVelocity():IsZero()) then
		plyTab.nextLanternBurn = curTime + math.random(60, 120);

		if (math.random(0, (player:HasTrait("marked") and 50 or 150)) == 0) then
			local pronoun = (player:GetGender() == GENDER_FEMALE and "себя" or "себя");

			Clockwork.chatBox:AddInTargetRadius(player, "me", "случайно разливает немного масла из лампы на "..pronoun..", поджигая "..pronoun.."!", player:GetPos(), Clockwork.config:Get("talk_radius"):Get() * 2);
			player:Ignite(5);
		end
	end

	if (activeWeapon:GetClass() != "cw_lantern" and lanternOnHip) then
		if (!plyTab.nextOilDrop or curTime > plyTab.nextOilDrop) then
			local lanternWeapon = player:GetWeapon("cw_lantern");

			if (lanternWeapon) then
				local weaponItemTable = item.GetByWeapon(lanternWeapon);
				
				if weaponItemTable then
					local currentOil = weaponItemTable:GetData("oil");

					weaponItemTable:SetData("oil", math.Clamp(currentOil - 1, 0, 100));
					player:SetNetVar("oil", math.Clamp(currentOil - 1, 0, 100));
				end

				plyTab.nextOilDrop = curTime + 30;
			end
		end;
		
		return;
	end

	if activeWeapon:GetClass() == "cw_lantern" then
		local weaponItemTable = item.GetByWeapon(activeWeapon);
		
		if weaponItemTable then
			local currentOil = weaponItemTable:GetData("oil");
			
			if (tonumber(currentOil) > 0) then
				local bWeaponRaised = player:IsWeaponRaised(activeWeapon);

				if (bWeaponRaised) then
					if (!plyTab.lanternSound) then
						player:EmitSound("lantern/lantern_on.wav", 60, math.random(95, 105));
						plyTab.lanternSound = true;
					end;
					
					if (!plyTab.nextOilDrop or curTime > plyTab.nextOilDrop) then
						weaponItemTable:SetData("oil", math.Clamp(currentOil - 1, 0, 100));
						player:SetNetVar("oil", math.Round(weaponItemTable:GetData("oil"), 0));

						plyTab.nextOilDrop = curTime + 30;
					end;
				else
					if (plyTab.lanternSound) then
						player:EmitSound("lantern/lantern_off.wav", 60, math.random(95, 105));
						plyTab.lanternSound = false;
					end;
				end;
				
				if !player:GetNetVar("oil") then
					player:SetNetVar("oil", math.Round(weaponItemTable:GetData("oil"), 0));
				end
				
				return;
			end;
		end;
	end
	
	if player:GetNetVar("oil") then
		player:SetNetVar("oil", nil);
	end;
end;

function cwLantern:PlayerCharacterLoaded(player)
	if player:GetNetVar("oil") then
		player:SetNetVar("oil", nil);
	end
	
	if player:GetNetVar("lanternOnHip") then
		player:SetNetVar("lanternOnHip", false);
	end
end

-- Called when a player is killed.
function cwLantern:PlayerDeath(player)
	if !player.opponent then
		if player:GetNetVar("oil") then
			player:SetNetVar("oil", nil);
		end
		
		if player:GetNetVar("lanternOnHip") then
			player:SetNetVar("lanternOnHip", false);
		end
	end
end;

function cwLantern:PrePlayerLowerWeapon(player, oldWeapon, newWeapon)
	if (!IsValid(oldWeapon) or !IsValid(player)) then return; end

	if (oldWeapon:GetClass() == "cw_lantern" and player:IsWeaponRaised() and player:HasBelief("ingenious")) then
		if !player:GetNetVar("lanternOnHip") then
			player:SetNetVar("lanternOnHip", true);
		end
	elseif (newWeapon == "cw_lantern") then
		if player:GetNetVar("lanternOnHip") then
			player:SetNetVar("lanternOnHip", false);
		end
	end
end