--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

cwShacks.shackData = {
	["market"] = {
		["M1"] = {name = "Хижина M1", floor = 0, price = 700},
		["M2"] = {name = "Хижина M2", floor = 0, price = 700},
		["M3"] = {name = "Хижина M3", floor = 0, price = 700},
		["M4"] = {name = "Хижина M4", floor = 0, price = 700},
	},
	["floor1"] = {
		["A1"] = {name = "Хижина A1", floor = 1, price = 500},
		["A2"] = {name = "Хижина A2", floor = 1, price = 500},
		["A3"] = {name = "Хижина A3", floor = 1, price = 500},
		["A4"] = {name = "Хижина A4", floor = 1, price = 500},
	},
	["floor2"] = {
		["B1"] = {name = "Хижина B1", floor = 2, price = 350},
		["B2"] = {name = "Хижина B2", floor = 2, price = 350},
		["B3"] = {name = "Хижина B3", floor = 2, price = 350},
		["B4"] = {name = "Хижина B4", floor = 2, price = 350},
		["B5"] = {name = "Хижина B5", floor = 2, price = 350},
		["B6"] = {name = "Хижина B6", floor = 2, price = 350},
		["B7"] = {name = "Хижина B7", floor = 2, price = 350},
		["B8"] = {name = "Хижина B8", floor = 2, price = 350},
		["B9"] = {name = "Комната B1", floor = 2, price = 1000},
		["B10"] = {name = "Комната B2", floor = 2, price = 1000},
		["B11"] = {name = "Комната B3", floor = 2, price = 1000},
		["B12"] = {name = "Комната B4", floor = 2, price = 1000},
	},
	["floor3"] = {
		["C2"] = {name = "Комната C2", floor = 3, price = 1000},
		["C3"] = {name = "Комната C3", floor = 3, price = 1000},
		["C4"] = {name = "Комната C4", floor = 3, price = 1000},
	},
	["floor4"] = {
		["D1"] = {name = "Хижина D1", floor = 4, price = 600},
		["D2"] = {name = "Комната D1", floor = 4, price = 1000},
	},
};

netstream.Hook("ShackInfo", function(data)
	if data then
		cwShacks.shacks = data;
	end
end);