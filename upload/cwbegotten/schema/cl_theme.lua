--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

surface.CreateFont("corruption_IntroTextTiny", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:ScaleToWideScreen(24),
	weight		= 600,
	antialiase	= true,
	shadow 		= false
});

surface.CreateFont("Subtitle_Whisper", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:ScaleToWideScreen(20),
	weight		= 100,
	antialiase	= true,
	shadow 		= false
})

surface.CreateFont("Subtitle_Talk", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:ScaleToWideScreen(26),
	weight		= 100,
	antialiase	= true,
	shadow 		= false
})

surface.CreateFont("Subtitle_Yell", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:ScaleToWideScreen(32),
	weight		= 100,
	antialiase	= true,
	shadow 		= false
})

surface.CreateFont("corruption_IntroTextSmall", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:ScaleToWideScreen(24),
	weight		= 500,
	antialiase	= true,
	shadow 		= false
})

surface.CreateFont("Ritual_Button", {
	font		= "Ikusuteito",
	size		= Clockwork.kernel:ScaleToWideScreen(32),
	weight		= 100,
	antialiase	= true,
	shadow 		= false
})

surface.CreateFont("Ritual_Text", {
	font		= "Ikusuteito",
	size		= Clockwork.kernel:ScaleToWideScreen(26),
	weight		= 100,
	antialiase	= true,
	shadow 		= false
})

surface.CreateFont("BarTextBegotten", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:ScaleToWideScreen(28),
	weight		= 100,
	antialiase	= true,
	shadow 		= false
})

surface.CreateFont("Decay_FormText", {
	-- Changed the font to not scale via UI - DETrooper
	
	--size = Clockwork.kernel:FontScreenScale(6),
	size = Clockwork.kernel:ScaleToWideScreen(18),
	weight = 700,
	antialias = true,
	font = "Times New Roman"
})

surface.CreateFont("DecayButtonText", {
	size = Clockwork.kernel:FontScreenScale(18),
	weight = 700,
	antialias = true,
	font = "Day Roman"
})

surface.CreateFont("begotten_InventoryText", {
	font		= "Vinque Rg",
	size		= ScaleToWideScreen(24),
	weight		= 700,
	antialiase	= true,
	shadow 		= false
})

surface.CreateFont("begotten_InventoryTextSmall", {
	font		= "Vinque Rg",
	size		= ScaleToWideScreen(20),
	weight		= 700,
	antialiase	= true,
	shadow 		= false
})

surface.CreateFont("DialogueTextQuestion", {
	font = "Ikusuteito",
	size = ScaleToWideScreen(35),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("DialogueTextAnswer", {
	font = " Ikusuteito",
	size = ScaleToWideScreen(30),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("DialogueTextAnswerItalics", {
	font = "Ikusuteito",
	size = ScaleToWideScreen(30),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("DialogueTextAnswerBold", {
	font = "Ikusuteito",
	size = ScaleToWideScreen(30),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("Civ5Tooltip5", {
	font = "Vinque Rg",
	size = ScaleToWideScreen(27),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("Civ5Tooltip1", {
	font = "Vinque Rg",
	size = ScaleToWideScreen(25),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("Civ5ToolTip2", {
	font = "Vinque Rg",
	size = ScaleToWideScreen(18),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("Civ5ToolTip4", {
	font = "Vinque Rg",
	size = ScaleToWideScreen(23),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("Civ5ToolTip5", {
	font = "Vinque Rg",
	size = ScaleToWideScreen(40),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("Civ5ToolTi3", {
	font = "Vinque Rg",
	size = ScaleToWideScreen(20),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("Civ5ToolTip3", {
	font = "Vinque Rg",
	size = ScaleToWideScreen(20),
	weight = 700,
	antialiase = true,
	shadow = false
})

surface.CreateFont("schema_ThickArial", {
	font		= "UK_Antique",
	size		= Clockwork.kernel:FontScreenScale(8),
	weight		= 700,
	antialiase	= true,
	additive 	= false
});

surface.CreateFont("schema_PlayerInfoText", {
	font		= "Oranienbaum",
	size		= Clockwork.kernel:FontScreenScale(7),
	weight		= 600,
	antialiase	= true,
	additive 	= false
});

surface.CreateFont("schema_Large3D2D", {
	font		= "Oranienbaum",
	size		= Clockwork.kernel:GetFontSize3D(),
	weight		= 600,
	antialiase	= true,
	additive 	= false
});

surface.CreateFont("schema_IntroTextSmall", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:FontScreenScale(10),
	weight		= 600,
	antialiase	= true,
	additive 	= false
});

surface.CreateFont("schema_IntroTextTiny", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:FontScreenScale(9),
	weight		= 600,
	antialiase	= true,
	additive 	= false
});

surface.CreateFont("schema_CinematicText", {
	font		= "Oranienbaum",
	size		= Clockwork.kernel:FontScreenScale(8),
	weight		= 600,
	antialiase	= true,
	additive 	= false
});

surface.CreateFont("schema_IntroTextBig", {
	font		= "Oranienbaum",
	size		= Clockwork.kernel:FontScreenScale(18),
	weight		= 600,
	antialiase	= true,
	additive 	= false
});

surface.CreateFont("schema_MainText", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:FontScreenScale(7),
	weight		= 600,
	antialiase	= true,
	additive 	= false
});

surface.CreateFont("schema_TargetIDText", {
	font		= "Oranienbaum",
	size		= Clockwork.kernel:FontScreenScale(7),
	weight		= 600,
	antialiase	= true,
	additive 	= false
});

surface.CreateFont("schema_MenuTextHuge", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:FontScreenScale(30),
	weight		= 600,
	antialiase	= true,
	additive 	= false
});

surface.CreateFont("schema_MenuTextBig", {
	font		= "Vinque Rg",
	size		= Clockwork.kernel:FontScreenScale(18),
	weight		= 600,
	antialiase	= true,
	additive 	= false
});

Clockwork.option:SetColor("information", Color(170, 0, 0, 255));
Clockwork.option:SetColor("background", Color(0, 0, 0, 255));
Clockwork.option:SetColor("target_id", Color(200, 20, 20, 255));

Clockwork.option:SetFont("bar_text", "schema_TargetIDText");
Clockwork.option:SetFont("main_text", "schema_MainText");
Clockwork.option:SetFont("hints_text", "schema_IntroTextTiny");
Clockwork.option:SetFont("large_3d_2d", "schema_Large3D2D");
Clockwork.option:SetFont("menu_text_big", "schema_MenuTextBig");
Clockwork.option:SetFont("menu_text_huge", "schema_MenuTextHuge");
Clockwork.option:SetFont("target_id_text", "schema_TargetIDText");
Clockwork.option:SetFont("cinematic_text", "schema_CinematicText");
Clockwork.option:SetFont("date_time_text", "schema_IntroTextSmall");
Clockwork.option:SetFont("intro_text_big", "schema_IntroTextBig");
Clockwork.option:SetFont("menu_text_tiny", "schema_IntroTextTiny");
Clockwork.option:SetFont("menu_text_small", "schema_IntroTextSmall");
Clockwork.option:SetFont("intro_text_tiny", "schema_IntroTextTiny");
Clockwork.option:SetFont("intro_text_small", "schema_IntroTextSmall");
Clockwork.option:SetFont("player_info_text", "schema_PlayerInfoText");

local DIRTY_TEXTURE = Material("begotten/dirty.png");
local SCRATCH_TEXTURE = Material("begotten/scratch.png");

-- Called just before a bar is drawn.
function Schema:PreDrawBar(barInfo)
	surface.SetDrawColor(255, 255, 255, 150);
	surface.SetMaterial(SCRATCH_TEXTURE);
	surface.DrawTexturedRect(barInfo.x, barInfo.y, barInfo.width, barInfo.height);
	
	barInfo.drawBackground = false;
	barInfo.drawProgress = false;
	
	if (barInfo.text) then
		barInfo.text = string.upper(barInfo.text);
	end;
end;

-- Called just after a bar is drawn.
function Schema:PostDrawBar(barInfo)
	surface.SetDrawColor(barInfo.color.r, barInfo.color.g, barInfo.color.b, barInfo.color.a);
	surface.SetMaterial(SCRATCH_TEXTURE);
	surface.DrawTexturedRect(barInfo.x, barInfo.y, barInfo.progressWidth, barInfo.height);
end;

-- Called just before the weapon selection info is drawn.
function Schema:PreDrawWeaponSelectionInfo(info)
	surface.SetDrawColor(255, 255, 255, math.min(200, info.alpha));
	surface.SetMaterial(DIRTY_TEXTURE);
	surface.DrawTexturedRect(info.x, info.y, info.width, info.height);
	
	info.drawBackground = false;
end;

-- Called just before the local player's information is drawn.
function Schema:PreDrawPlayerInfo(boxInfo, information, subInformation)
	surface.SetDrawColor(255, 255, 255, 100);
	surface.SetMaterial(DIRTY_TEXTURE);
	surface.DrawTexturedRect(boxInfo.x, boxInfo.y, boxInfo.width, boxInfo.height);
	
	boxInfo.drawBackground = false;
end;