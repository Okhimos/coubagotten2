--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

Clockwork.kernel:IncludePrefixed("shared.lua")

-- Called when the target ID HUD should be painted.
function ENT:HUDPaintTargetID(x, y, alpha)
	local broken = self:GetNWBool("broken");
	
	if broken then
		y = Clockwork.kernel:DrawInfo("Огромная паровая машина, созданная кланом Шагалакс. Кажется, он не функционирует..", x, y, Clockwork.option:GetColor("white"), alpha);
	else
		y = Clockwork.kernel:DrawInfo("Огромная паровая машина, созданная кланом Шагалакс, изрыгающая пар с ненавистью к Южанам.", x, y, Clockwork.option:GetColor("white"), alpha);
	end
end;