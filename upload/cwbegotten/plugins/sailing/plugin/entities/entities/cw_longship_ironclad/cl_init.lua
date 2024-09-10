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
		y = Clockwork.kernel:DrawInfo("Паровой бронированный монстр, выкованный легендарными кузнецами клана Шагалакс.", x, y, Clockwork.option:GetColor("white"), alpha);
	else
		y = Clockwork.kernel:DrawInfo("Паровой бронированный монстр, выкованный легендарными кузнецами клана Шагалакс. На борту выгравировано '"..name.."' при помощи рунической Письменности Горов.", x, y, Clockwork.option:GetColor("white"), alpha);
	end
end;