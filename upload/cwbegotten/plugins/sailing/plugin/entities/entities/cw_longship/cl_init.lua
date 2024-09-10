--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

Clockwork.kernel:IncludePrefixed("shared.lua")

-- Called when the target ID HUD should be painted.
function ENT:HUDPaintTargetID(x, y, alpha)
	local name = self:GetNWString("name");
	
	if !name or name:len() == 0 then
		y = Clockwork.kernel:DrawInfo("Большой Корабль северных захватчиков.", x, y, Clockwork.option:GetColor("white"), alpha);
	else
		y = Clockwork.kernel:DrawInfo("Большой Корабль северных захватчиков. На корме выгравировано '"..name.."' при помощи рунической письменности Горов.", x, y, Clockwork.option:GetColor("white"), alpha);
	end
end;