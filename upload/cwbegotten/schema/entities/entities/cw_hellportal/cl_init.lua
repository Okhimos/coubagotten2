--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

include("shared.lua");

-- Called when the target ID HUD should be painted.
function ENT:HUDPaintTargetID(x, y, alpha)
	local colorTargetID = Clockwork.option:GetColor("target_id")
	local colorWhite = Clockwork.option:GetColor("white")
	
	y = Clockwork.kernel:DrawInfo("Портал", x, y, colorTargetID, alpha)
	y = Clockwork.kernel:DrawInfo("Путь в Другие Миры", x, y, colorWhite, alpha);
end;

local function CreateMenu(state)
	if (IsValid(menu)) then
		menu:Remove();
	end;
	
	local scrW = ScrW();
	local scrH = ScrH();
	local menu = DermaMenu();
		
	menu:SetMinimumWidth(150);

	local subMenu = menu:AddSubMenu("Отправиться...");
	
	subMenu:AddOption("...Арке Погибели", function() Clockwork.Client:ConCommand("cw_HellPortalArch") end);
	subMenu:AddOption("...К Столпам Творения", function() Clockwork.Client:ConCommand("cw_HellPortalPillars") end);
	
	menu:Open();
	menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
end

netstream.Hook("OpenHellPortalMenu", function(state)
	CreateMenu(state);
end);