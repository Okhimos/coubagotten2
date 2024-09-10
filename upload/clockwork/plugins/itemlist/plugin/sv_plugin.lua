--[[
	BEGOTTEN III: Developed by DETrooper, cash wednesday, gabs & alyousha35
--]]

netstream.Hook("MenuItemSpawn", function(player, uniqueID)
	if (!IsValid(player)) then return; end
	if (!Clockwork.player:HasFlags(player, "s")) then return; end

	local itemTable = item.CreateInstance(uniqueID)

	if (itemTable) then
		local pos = player:GetEyeTraceNoCursor().HitPos;
		local normal = player:GetEyeTraceNoCursor().HitNormal;
		local item = Clockwork.entity:CreateItem(nil, itemTable, pos)

		Clockwork.entity:MakeFlushToGround(item, pos, normal)
		Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name() .. " spawned a " .. itemTable.name .. " (" .. itemTable.uniqueID .. ") " .. itemTable.itemID .. ".")

		undo.Create("Spawned Item")
			undo.AddEntity(item)
			undo.SetPlayer(player)
			undo.SetCustomUndoText("Undone Item!")
		undo.Finish()
	end
end)

netstream.Hook("MenuItemGive", function(player, uniqueID)
	if (!IsValid(player)) then return; end
	if (!Clockwork.player:HasFlags(player, "s")) then return; end

	local itemTable = item.CreateInstance(uniqueID)

	if (itemTable) then
		player:GiveItem(itemTable, true)
		Schema:EasyText(player, "cornflowerblue", "You gave yourself a " .. itemTable.name .. ".")
		Clockwork.kernel:PrintLog(LOGTYPE_GENERIC, player:Name() .. " gave themselves a " .. itemTable.name .. " (" ..itemTable.uniqueID .. ") " .. itemTable.itemID .. ".")
	end
end)