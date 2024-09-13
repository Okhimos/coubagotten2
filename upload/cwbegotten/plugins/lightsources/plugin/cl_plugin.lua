--[[
	Begotten III: Jesus Wept
--]]

-- A function to get the oil text.
function cwLantern:GetOilText()
	local oil = Clockwork.Client:GetNetVar("oil", 0);
	local text = "No Information";

	if (oil) then
		if (oil <= 100 and oil >= 60) then
			text = "ПОЛНАЯ";
		elseif (oil < 60 and oil >= 15) then
			text = "УГАСАЕТ...";
		elseif (oil < 15 and oil >= 1) then
			text = "ЕЛЕ СВЕТИТ...";
		elseif (oil <= 0) then
			text = "МАСЛО ЗАКОНЧИЛОСЬ...";
		end;
	end;
	
	return text;
end;