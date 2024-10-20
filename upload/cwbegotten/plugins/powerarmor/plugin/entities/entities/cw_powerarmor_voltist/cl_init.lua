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
	
	y = Clockwork.kernel:DrawInfo("Силовая Броня Вольтистов", x, y, colorTargetID, alpha)
	y = Clockwork.kernel:DrawInfo("Самодельный комплект силовой брони, используемый продвинутыми группами технопоклонников. Он состоит из металлических пластин, кевлара и передовых технологических компонентов.", x, y, colorWhite, alpha);
end;

local function CreateMenu(state)
	if (IsValid(menu)) then
		menu:Remove();
	end;
	
	local scrW = ScrW();
	local scrH = ScrH();
	local menu = DermaMenu();
		
	menu:SetMinimumWidth(150);
	
	menu:AddOption("Войти в Броню", function() Clockwork.Client:ConCommand("cw_EnterPowerArmor") end);
	
	menu:Open();
	menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
end

netstream.Hook("OpenPowerArmorMenu", function(state)
	CreateMenu(state);
end);