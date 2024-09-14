--[[
	Begotten 3
	Created by cash wednesday, gabs, DETrooper and alyousha35
--]]

-- Called when the post progress bar info is needed.
function cwAlchemy:GetProgressBarInfoAction(action, percentage)
	if (action == "transferring_contents_container") then
		return {text = "Вы перемещаете содержимое одного контейнера в другой.", percentage = percentage, flash = percentage > 75};
	elseif (action == "transferring_contents_dissolvable") then
		return {text = "You are transferring a dissolvable to a container.", percentage = percentage, flash = percentage > 75};
	elseif (action == "patting_out_fire") then
		return {text = "Вы пытаетесь потушить огонь!", percentage = percentage, flash = percentage > 75};
	end;
end;