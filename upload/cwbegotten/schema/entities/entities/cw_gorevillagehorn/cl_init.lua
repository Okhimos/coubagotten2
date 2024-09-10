include("shared.lua");

-- Called when the target ID HUD should be painted.
function ENT:HUDPaintTargetID(x, y, alpha)
	local colorTargetID = Clockwork.option:GetColor("target_id")
	local colorWhite = Clockwork.option:GetColor("white")
	
	y = Clockwork.kernel:DrawInfo("Древний Горн", x, y, colorTargetID, alpha)
	y = Clockwork.kernel:DrawInfo("Горейский боевой рог, изготовленный вручную, чтобы издавать звук, который при подувании разносится по всему Лесу.", x, y, colorWhite, alpha);
end;

local function CreateMenu(state)
	if (IsValid(menu)) then
		menu:Remove();
	end;
	
	local scrW = ScrW();
	local scrH = ScrH();
	local menu = DermaMenu();
		
	menu:SetMinimumWidth(150);
	
	if state == "Gore" then
		menu:AddOption("Созвать Всех Воинов", function() Clockwork.kernel:RunCommand("GoreicHornSummonAll") end);
        menu:AddOption("Созвать Рейдовый Отряд", function() Clockwork.kernel:RunCommand("GoreicHornSummonRaid") end);
	end
	
	menu:Open();
	menu:SetPos(scrW / 2 - (menu:GetWide() / 2), scrH / 2 - (menu:GetTall() / 2));
end

netstream.Hook("OpenGoreicHornMenu", function(state)
	CreateMenu(state);
end);