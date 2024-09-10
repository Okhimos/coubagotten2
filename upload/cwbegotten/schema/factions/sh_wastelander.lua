--[[
	Begotten III: Jesus Wept
	By: DETrooper, cash wednesday, gabs, alyousha35

	Other credits: kurozael, Alex Grist, Mr. Meow, zigbomb
--]]

-- Names for random name selection.
RANDOM_FORENAMES = {
	["glazic"] = {
		["male"] = {"Абрахам", "Аарон", "Адам", "Алан", "Альберт", "Альфред", "Александр", "Аттикус", "Андрей", "Антон", "Ангус", "Аллен", "Алвин", "Альберт", "Амброус", "Арнольд", "Артур", "Буфорд", "Бенджамин", "Бенедикт", "Бернард", "Бригам", "Брекстон", "Барнабас", "Боксер", "Чарльз", "Христофер", "Клэренс", "Кларк", "Клейтон", "Кэлвин", "Честер", "Корнелиус", "Давид", "Дональд", "Даниэль", "Дункан", "Элиас", "Эрик", "Юджин", "Стас", "Эрнест", "Эдвард", "Эрл", "Францис", "Георг", "Грегори", "Геральт", "Гровер", "Гордон", "Гектор", "Гарольд", "Горацио", "Генри", "Айзек", "Иан", "Джозеф", "Джеффри", "Джон", "Джонатан", "Джебедая", "Джеймс", "Иаков", "Джулиан", "Джастин", "Джосая", "Джошуа", "Кармин", "Леонард", "Луи", "Лэвренс", "Леланд", "Лукас", "Лионель", "Ламонт", "Лиман", "Магнус", "Мозэ", "Майкл", "Микеланджио", "Маркус", "Мартин", "Милтон", "Натаниэль", "Ной", "Николас", "Оливер", "Обадая", "Одиссей", "Оруэлл", "Овен", "Филипп", "Петр", "Павел", "Патрик", "Реджинальд", "Роберт", "Ричард", "Рональд", "Руфус", "Ретт", "Семюэль", "Скотт", "Стивен", "Самсон", "Сильвестр", "Тэодор", "Томас", "Тимоти", "Аптон", "Улисс", "Виктор", "Винсент", "Виллиам", "Уолтер", "Вилбур", "Уоллес", "Захар"},
		["female"] = {"Адела", "Адрисана", "Алиса", "Амелия", "Анна", "Аудрей", "Авелина", "Беатрис", "Каролина", "Катерина", "Сесиллия", "Дейзи", "Довн", "Элла", "Элеанора", "Елизавета", "Эмма", "Глория", "Грейс", "Елена", "Изабель", "Изабелла", "Йеннифер", "Джоан", "Джоанна", "Джулия", "Джулиана", "Лавра", "Ливия", "Маделина", "Маргарет", "Мария", "Мэри", "Олимпия", "Скарлет", "Сара", "Сильвия", "София", "Сьюзанна", "Феодора", "Виктория", "Вирджиния", "Валерия", "Зельда"}
	},
	["goreic"] = {
		["male"] = {"Але", "Алфр", "Алфгейр", "Андрэс", "Анлауфр", "Анундр", "Арнбъорн", "Арнгримр", "Арни", "Арнфаст", "Асбъорн", "Бэгги", "Балдр", "Барид", "Бенгт", "Берси", "Бертил", "Биргер", "Бъорн", "Бо", "Борквард", "Ботулифр", "Браги", "Будли", "Даг", "Дан", "Дир", "Эйлиф", "Эгилл", "Эмунд", "Эйнар", "Эйрик", "Эскилд", "Фалки", "Фэйст", "Филип", "Фредрик", "Фрирек", "Фроди", "Фрейр", "Фолки", "Гендальфр", "Геирр", "Георг", "Гнупа", "Горм", "Гремер", "Гримр", "Гудфрид", "Гудмундр", "Гудродр", "Гунарр", "Хакон", "Халстейн", "Харальд", "Хаукр", "Хельги", "Хемминг", "Хольмгер", "Храфн", "Хролфр", "Хрейн", "Ъэстеин", "Хъялмар", "Хродгар", "Хродульфр", "Хрорек", "Хусинг", "Ингольфер", "Ингемар", "Ингъялнд", "Ивар", "Жедвард", "Жон", "Карл", "Кэттил", "Кэттилмунд", "Къяртан", "Клас", "Кнут", "Кол", "Колбъорн", "Магнус", "Маркус", "Магни", "Мэтс", "Нилс", "Никлас", "Оддр", "Офеиг", "Олафр", "Ормр", "Оттарр", "Рефр", "Рефил", "Рагнар", "Рикульфр", "Рогнвальд", "Скули", "Снори", "Сибъор", "Сигъюрор", "Старкадр", "Штейн", "Стурла", "Стубйорн", "Стиркер", "Сумурлиди", "Суни", "Свэн", "Сверкер", "Семунд", "Солве", "Сорквер", "Тоук", "Толир", "Дорбьорн", "Дорфей", "Дорбранд", "Дордр", "Доргил", "Дорштейн", "Дорольф", "Тостэ", "Тотил", "Трайгв", "Тайк", "Ульфр", "Вагн", "Вальдемар", "Эйк", "Унгвар", "Орвар", "Ойштейн"},
		["female"] = {"Алета", "Альфхидир", "Альфрид", "Альвор", "Анна", "Аса", "Аслауг", "Аста", "Астрид", "Бита", "Бигритта", "Бъорн", "Бодил", "Ботхильдир", "Цесилла", "Эдла", "Элин", "Елизавета", "Фрея", "Гердур", "Глод", "Грима", "Гуннхилдр", "Гурли", "Гудран", "Гила", "Гурид", "Гида", "Халфрид", "Галла", "Хелен", "Холмфрид", "Иллиана", "Inga", "Ingfrid", "Ingibjörg", "Ingjerðr", "Ingrid", "Karin", "Katarina", "Kraka", "Kristina", "Linda", "Maer", "Мальфрид", "Маргарета", "Мария", "Рикисса", "Рогнфрид", "Рогнхильдр", "Сага", "Сара", "Сиф", "Зигриф", "Скульд", "София", "Сванхилдр", "Ульфхилдр", "Вигдис", "Ульва", "Урса"}
	}
};
-- У МЕНЯ БОЛИТ РУКА И Я НЕ БУДУ ПЕРЕВОДИТЬ ЖЕНСКИЕ ИМЕНА ГОРОВ
RANDOM_SURNAMES = {
	["glazic"] = {
		"Абриаллас", "Аелиус", "Андерсон", "Антониус", "Аппиус", "Аркадиус", "Армстрогнг", "Армистэд", "Аетиус", "Аурелиус", "Бейтман", "Барклей", "Брутус", "Бучанус", "Каециллиус", "Карринас", "Кассиус", "Клеменс", "Корнелиус", "Чемберлин", "Кранстон", "Крассус", "Кравфорд", "Децимус", "Дилворф", "Домитиус", "Фабиус", "Флавиус", "Франклин", "Фульвиус", "Галериус", "Гамильтон", "Харрис", "Харвус", "Хонориус", "Горатиус", "Джулиус", "Юпитер", "Коилиус", "Крамми", "Лабениус", "Линкольн", "Мариус", "Морган", "Морриус", "Насенниус", "Освальд", "Опимиус", "Патробиус", "Паркер", "Петрониус", "Филадельфиус", "Помпеус", "Квинтикус", "Рандольф", "Робертс", "Руфиниус", "Септимус", "Северус", "Симмонс", "Шеридан", "Стивенс", "Стюарт", "Сулливан", "Суетониус", "Тэйлор", "Тэмпл", "Томпсон", "Титус", "Туллиус", "Тайлер", "Валериус", "Воренус", "Уэльс", "Вилкес", "Пиковидный", "Светикус"
	},
	["goreic"] = {
		"Аскельсон", "Аксель", "Славорожденный", "Бьйорсон", "Боргсон", "Кровожадный", "Эриксонн", "Эрлинг", "Древожденный", "Эстерсон", "Северожденный", "Светоненавистный", "Гусставсон", "Гуттармсон", "Харальдер", "Харальдорожденный", "Хелгассон", "Хэлвиг", "Хёскин", "Хексум", "Хольт", "Джостад", "Грандж", "Крёса", "Карстен", "Клиндерберг", "Кнудсоун", "Крогх", "Леиф", "Лорейнсон", "Матхир", "Ниигард", "Ниулуд", "Охольсон", "Олафсон", "Скрау", "Тотхельсон", "Торгримсон", "Иврисон", "Громорожденный"
	}
};

local FACTION = Clockwork.faction:New("Wanderer");
	FACTION.disabled = false; -- For events.
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_wanderers";
	FACTION.color = Color(160, 100, 15);
	FACTION.description = "The Wanderers are the carrion carcass eaters of the Wasteland. \nThey were the many lowly commoners of the County Districts, barely literate and ill-fed. \nTo survive as a Wanderer, one must be sharp and brutal, and choose their allegiance carefully. \nTheir weapons are their faith and fear, and their strife will be everlasting.";
	FACTION.availablefaiths = {"Faith of the Light", "Faith of the Family", "Faith of the Dark"};
	FACTION.imposters = true;
	FACTION.names = "glazic";
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name == "Goreic Warrior") then
			return false;
		end;
	end;
FACTION_WANDERER = FACTION:Register();

local FACTION = Clockwork.faction:New("Wanderer");
	FACTION.disabled = false; -- For events.
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_wanderers";
	FACTION.color = Color(160, 100, 15);
	FACTION.description = "Странники — личинки, пирующие на трупе мертвого мира. \nЭто многочисленные крестьяне из низших уездов, едва грамотные и недоедающие. \nЧтобы выжить в качестве Странника, нужно быть дерзким и жестоким, а также тщательно обдумывать каждое свое слово и действие. \nИх оружие — их вера и страх, а их борьба будет вечной.";
	FACTION.availablefaiths = {"Faith of the Light", "Faith of the Family", "Faith of the Dark"};
	FACTION.imposters = true;
	FACTION.names = "glazic";
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name == "Goreic Warrior") then
			return false;
		end;
	end;
FACTION_WANDERER = FACTION:Register();

local FACTION = Clockwork.faction:New("Gatekeeper");
	FACTION.disabled = false; -- For events.
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_gatekeepers";
	FACTION.color = Color(80, 100, 120);
	FACTION.description = "Привратники — это передовая линия обороны против бесчисленных нечестивых ужасов, которые угрожают Сиянию. \nИх ряды пополняются за счет мобилизованных жаждущих власти простолюдинов и фанатичных бичеванцев. \nОни должны служить Священной Иерархии усердно и беспрекословно, какими бы возмутительными ни были их требования. \nОт этих плохо обученных и плохо экипированных солдат ждут, что они отдадут свои жизни, защищая Свет. \nИ они так и сделают.";
	FACTION.availablefaiths = {"Faith of the Light"};
	FACTION.alliedfactions = {"Holy Hierarchy"};
	FACTION.singleGender = GENDER_MALE;
	FACTION.characterLimit = 2; -- # of characters of this faction a player can have.
	FACTION.ratio = 0.4; -- 0.3 slots per player (9 at 30 players).
	--FACTION.imposters = true; -- Kinisgers should get enlisted through /enlist on Wanderer disguises.
	FACTION.names = "glazic";
	FACTION.subfactions = {
		{name = "Legionary", subtitle = "Легионеры - Солдаты Церкви", description = "Священный Орден Привратников защищал Святую Иерархию от нечестивых угроз с незапамятных времен. За эти годы они пережили много изменений и значительно различаются по силе, оснащению и численности от округа к округу, но тем не менее имеют одну цель: защищать Святую Иерархию любой ценой. Легионеры представляют собой рядовых членов этого Священного Ордена и знают только Сияние. Эти люди представляют собой смесь профессиональных солдат, призванных на службу отбросов пустошей и религиозных фанатиков. Они служат в качестве передовых войск и стражников на службе Священной Иерархии, часто идя на значительный риск для продвижения целей своих министров или для их защиты.", attributes = {{Color(0, 225, 0), "(+) Обученный: Начинает с +15 максимальной выносливости"}, {Color(0, 225, 0), "(+) Сытый: Начинает с +25 максимального здоровья"}, {Color(0, 225, 0), "(+) Начинает с 6 уровнем Таинства"}, {Color(0, 225, 0), "(+) Единство: +100% получения веры при нанесении урона"}, {Color(225, 0, 0), "(-) Подвера 'Вольтизм' заблокирована"}}},
		{name = "Auxiliary", subtitle = "Ауксилярии - Кузнецы и Медики", description = "Являясь основой Святого Ордена и поставщиками его превосходной изобретательности, Ауксилиарии обеспечивают снабжение, поддерживают войска и действуют в качестве резервистов в бою. Как кузнецы, они вооружают ряды превосходным оружием, управляют пушками и укрепляют оборонительные позиции. Как Медики, они предотвращают вспышки заражений в рядах и лечат ранения, полученные в бою. От них по-прежнему ожидают, что они будут сражаться, если это необходимо, хотя они не так часто подвергаются опасности, как их собратья-легионеры", attributes = {{Color(0, 225, 0), "(+) Люди Знаний: +25% к приросту веры"}, {Color(0, 225, 0), "(+) Начинает с 12 уровнем Таинства"}, {Color(225, 0, 0), "(-) Слабый: Уровни III и IV дерева убеждений «Мастерство» заблокированы"}, {Color(225, 0, 0), "(-) Подвера 'Вольтизм' заблокирована"}}},
		{name = "Praeventor", startingRank = 12, whitelist = true, subtitle = "Превенторы - Разведчики и Убийцы", description = "Взяв название похожего подразделения из древнеримских времен, Превенторы служат небольшим, но элитным отрядом разведчиков, охотников и убийц для Святого Ордена. Набранные из самых преданных и опытных последователей Стойкого Сияния, Превенторы не имеют стандартизированного снаряжения,чтобы помочь им вписаться в толпу, выполняя свои обязанности в пустошах. Эти обязанности включают: сообщение о передвижениях противника, сбор ценных артефактов или необходимых припасов, убийство врагов Святой Иерархии или снайперская стрельба по целям на большом расстоянии, доставка или уничтожение целей, за которых назначены награды, и сбор информации.", attributes = {{Color(0, 225, 0), "(+) (+) Бегун: -25% к скости траты выносливости, +5% к скорости бега"}, {Color(0, 225, 0), "(+) Мастера Маскировки: Люди не видят ваш ранг"}, {Color(0, 225, 0), "(+) Начинает с 8 уровнем Таинства"}, {Color(225, 0, 0), "(-) 'Вольтизм', 'Солнечное Православие' заблокированы"}}},
	};
	FACTION.residualXPZones = { -- Zones that boost residual XP gain for this faction.
		["rp_begotten3"] = {
			{pos1 = Vector(1390, 10153, -938), pos2 = Vector(-2370, 11254, -1690), modifier = 2, nightModifier = 4}, -- Gate
			{pos1 = Vector(9422, 11862, -1210), pos2 = Vector(10055, 10389, -770), modifier = 3, nightModifier = 5}, -- Gorewatch
			{pos1 = Vector(3458, 12655 -814), pos2 = Vector(3335, 12769, -685), modifier = 2, nightModifier = 4}, -- Watchtower
			{pos1 = Vector(2742, 10244, -1194), pos2 = Vector(2913, 10071, -1074), modifier = 2, nightModifier = 4}, -- Watchtower
			{pos1 = Vector(-1963, 10678, -1055), pos2 = Vector(-2144, 10886, -1194), modifier = 2, nightModifier = 4}, -- Watchtower
			{pos1 = Vector(-3468, 12985, -375), pos2 = Vector(-3591, 13103, -241), modifier = 2, nightModifier = 4}, -- Watchtower
		},
	};
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name != "Wanderer" and faction.name != "Holy Hierarchy") then
			if player:GetSubfaction() ~= "Kinisger" then
				return false;
			end
		end;
		
		-- It is the IC responsibility of Gatekeepers to bloodtest recruits.
		--[[if player:GetFaith() ~= "Faith of the Light" or player:GetSubfaith() == "Voltism" then
			return false;
		end]]--
		
		if (!Clockwork.player:IsWhitelisted(player, "Gatekeeper")) then
			Clockwork.player:SetWhitelisted(player, "Gatekeeper", true);
		end;
	end;
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end
	
	if !Schema.RanksRestrictedWages then
		Schema.RanksRestrictedWages = {};
	end
	
	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	if !Schema.RanksToCoin then
		Schema.RanksToCoin = {};
	end
	
	Schema.Ranks["Gatekeeper"] = {
		[1] = "Послушник",
		[2] = "Причетник",
		[3] = "Подмастерье",
		[4] = "Мастер Кузнец",
		[5] = "Медикус",
		[6] = "Лазарь",
		[7] = "Эммисарий",
		[8] = "Знаменосец",
		[9] = "Оруженосец",
		[10] = "Пресвитёр",
		[11] = "Высший Привратник",
		[12] = "Разведчик",
		[13] = "Мастер Разведчик",
		[14] = "Остиарий",
	};
	
	Schema.RankTiers["Gatekeeper"] = {
		[1] = {"Послушник"},
		[2] = {"Причетник", "Остиарий", "Подмастерье", "Медикус", "Разведчик"},
		[3] = {"Эммисарий", "Мастер Кузнец", "Лазарь", "Мастер Разведчик", "Знаменосец", "Оруженосец"},
		[4] = {"Пресвитёр"},
		[5] = {"Высший Привратник"},
	};
	
	-- Do not grant wages to these ranks if they are inside the safezone.
	Schema.RanksRestrictedWages["Gatekeeper"] = {1, 2, 12, 13, 14};
	
	Schema.RanksToSubfaction["Gatekeeper"] = {
		["Разведчик"] = "Praeventor",
		["Мастер Разведчик"] = "Praeventor",
	};
	
	Schema.RanksToCoin["Gatekeeper"] = {
		[1] = 25,
		[2] = 35,
		[3] = 35,
		[4] = 35,
		[5] = 35,
		[6] = 50,
		[7] = 75,
		[8] = 35,
		[9] = 35,
		[10] = 100,
		[11] = 200, 
		[12] = 35,
		[13] = 75,
		[14] = 35,
	};
FACTION_GATEKEEPER = FACTION:Register();

local FACTION = Clockwork.faction:New("Holy Hierarchy");
	local ministerModels = {
		male = {
			clothes = "models/begotten/gatekeepers/minister_male.mdl",
			heads = {
				"male_01",
				"male_02",
				"male_03",
				"male_04",
				"male_05",
				"male_06",
				"male_07",
				"male_08",
				"male_09",
				"male_11",
				"male_12",
				"male_13",
				"male_16",
				"male_22",
				"male_56"
			},
		},
	};

	FACTION.disabled = false; -- For events.
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_hierarchy";
	FACTION.color = Color(225, 175, 0);
	FACTION.description = "Святая Иерархия - это высшие чины в обществе Стойкого Сияния. Они поддерживают идею просвещенного меньшинства и выступают в роли судей и администраторов, распространяющих Святой Свет. Однако, среди них немало коррумпированных личностей, которые преследуют лишь свои собственные интересы."
	FACTION.availablefaiths = {"Faith of the Light"};
	FACTION.alliedfactions = {"Gatekeeper"};
	FACTION.ratio = 0.1; -- 0.1 slots per player (3 at 30 players).
	--FACTION.imposters = true;
	FACTION.names = "glazic";
	FACTION.subfactions = {
		{name = "Ministry", subtitle = "Министерство - Несколько привилегированных надзирателей за обществом Сияния", description = "Святая Иерархия, возможно, единственный сохранившийся институт старого мира и единственная известная церковь Света. Многие рассматривают Святую Иерархию как прямое продолжение Империи Света, включая саму Святую Иерархию, которая продвигает эту историю, чтобы укрепить свою власть над своими подданными. Любой, кто сомневается в ее легитимности, казнится на месте. Управляя большей частью «цивилизованного» крестьянства, бродящего по пустошам, Святая Иерархия строго соблюдает свои религиозные кодексы, которые постоянно меняются по прихоти Папы. На самом верху Иерархии находится Папа, верховный по власти. Он живет в пентхаусе на верхнем этаже отеля в абсолютной роскоши по сравнению с лачугами, которые делит чернь. Ниже него находятся кардиналы, которые служат советом Папы. Еще ниже находятся епископы, многие из которых сейчас открыто восстают против нового Папы, а некоторые даже провозглашают его титул своим собственным. Наконец, есть священники, которые едва ли выше простолюдина и равны по рангу тем, кто в Рыцарях Солнца или Инквизиции. Обязанности священника часто включают в себя поиск древних текстов, хранящихся в великих архивах, в поисках любого преимущества, которое может быть предоставлено Иерархии над их соперниками, или ключей к расшифровке блужданий машины, о которой говорят так много странников.", models = ministerModels},
		{name = "Inquisition", subtitle = "Вторая инквизиция — Охотники, судьи и палачи", description = "Священный Орден Инквизиторов  — это древнее учреждение, основанное Лордом Максимусом во время его кампаний против Черных Шляп и рожденное необходимостью уничтожать шпионов и искоренять ересь. Хотя они были распущены после того, как их задача была выполнена, вскоре Инквизиция была восстановлена, поскольку враги Сияния только росли как в числе, так и в свирепости. Пришествие Подземного Бога и последующее вытеснение Темного Лорда из Ада только усилили потребность в Инквизиции, поскольку неизвестные силы теперь открыто обрушились на человечество. Инквизиция — важнейшая линия обороны Святой Иерархии, поскольку они искореняют скрытых врагов и отстаивают религиозную доктрину. Инквизиторы строго соблюдают сводки «Книги Закона», в которой подробно описана их методология и правила, которых должны придерживаться все последователи Стойкого Сияния. Инквизиция также обладает уникальной способностью призвать любого члена общества к ответу по «Книге Закона», включая членов Святой Иерархии. Однако обвинения в ереси не воспринимаются легкомысленно, и доказательство неправоты после обвинения кого-то, находящегося у власти, может иметь катастрофические последствия для обвинителя.", attributes = {{Color(0, 225, 0), "(+) Человек Знаний: +50% получаемой веры"}, {Color(0, 225, 0), "(+) Сытый: Начинает с +50 маскимального здоровья"}}}, 
		{name = "Knights of Sol", subtitle = "Рыцари Солнца - Самый преданный орден Сияния", description = "Всего несколько лет назад Скайлайт упал на Землю в пылающем аду, последнее обещание будущего для человечества рухнуло вместе с ним. Из его бесчисленных просветленных жителей появилось только семнадцать: Славные Семнадцать. Облачившись в великолепные белые доспехи и вооружившись ярко сияющими мечами, Славные Семнадцать убили каждого демона, который напал на них. Тысячи пали от их клинков, прежде чем демоны отступили во тьму, и казалось, что человечество проживет еще хотя бы один день. Хотя Славные Семнадцать больше не ходят по этой Земле, их наследие живет в недавно основанном Священном Ордене Рыцарей Солнца. Орден состоит из лучших из воинов, непревзойденных в доблести и рассматриваемых многими верующими как воплощение ангелов-хранителей. Рыцарям выдается абсолютно лучшее снаряжение, имеющееся в королевских арсеналах. Несмотря на это, Рыцарей никогда не видят с мушкетами или любым другим видом огнестрельного оружия, считая их слишком трусливыми для кого-то столь благородного положения. Известно также, что рыцари Солнца держат у себя на службе оруженосцев, которых часто набирают из числа привратников.", attributes = {{Color(0, 225, 0), "(+) Клятва: 70% защиты от пуль"}, {Color(0, 225, 0), "(+) Бастион: +25 Стабильности и Выносливости"}, {Color(0, 225, 0), "(+) Неумолимый: +75 максимального здоровья"}, {Color(225, 0, 0), "(-) Грузный: Скорость передвижения уменьшена на 15%"}}, models = ministerModels}
	};
	FACTION.singleGender = GENDER_MALE;
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		--if (faction.name != "Wanderer" and faction.name != "Gatekeeper") then
			--return false;
		--end;
		
		--[[if player:GetFaith() ~= "Faith of the Light" or player:GetSubfaith() == "Voltism" then
			return false;
		end]]--
		
		--[[if (!Clockwork.player:IsWhitelisted(player, "Holy Hierarchy")) then
			Clockwork.player:SetWhitelisted(player, "Holy Hierarchy", true);
		end;]]--
	end;
	
	if SERVER then
		function FACTION:CanEnlist(player, target, faction, subfaction)
			if faction == "Holy Hierarchy" then
				local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
				
				if playerSubfaction ~= "Ministry" then
					if subfaction and subfaction.name ~= playerSubfaction then
						return false;
					end
				end
			end
		end
		
		function FACTION:CanPromote(player, target, faction, subfaction)
			if faction == "Holy Hierarchy" then
				local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
				
				if playerSubfaction ~= "Ministry" then
					if subfaction and subfaction.name ~= playerSubfaction then
						return false;
					end
				end
			end
		end
		
		function FACTION:CanDemote(player, target, faction, subfaction)
			if faction == "Holy Hierarchy" then
				local playerSubfaction = player:GetNetVar("kinisgerOverrideSubfaction") or player:GetSubfaction();
				
				if playerSubfaction ~= "Ministry" then
					if subfaction and subfaction.name ~= playerSubfaction then
						return false;
					end
				end
			end
		end
	end
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end

	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	Schema.Ranks["Holy Hierarchy"] = {
		[1] = "Сир",
		[2] = "Ученик",
		[3] = "Викарий",
		[4] = "Юстициарий",
		[5] = "Инквизитор",
		[6] = "Министр",
		[7] = "Верховный Рыцарь",
		[8] = "Ординатор",
		[9] = "Магистр",
		[10] = "Верховный Инквизитор",
		[11] = "Регент",
	};
	
	Schema.RankTiers["Holy Hierarchy"] = {
		[1] = {"Сир", "Ученик", "Викарий"},
		[2] = {"Юстициарий", "Инквизитор", "Министр"},
		[3] = {"Верховный Рыцарь", "Ординатор", "Магистр"},
		[4] = {"Верховный Инквизитор", "Регент"},
	};
	
	Schema.RanksToSubfaction["Holy Hierarchy"] = {
		["Сир"] = "Knights of Sol",
		["Юстициарий"] = "Knights of Sol",
		["Верховный Рыцарь"] = "Knights of Sol",
		["Ученик"] = "Inquisition",
		["Инквизитор"] = "Inquisition",
		["Ординатор"] = "Inquisition",
		["Верховный Инквизитор"] = "Inquisition",
	};
FACTION_HIERARCHY = FACTION:Register();

local FACTION = Clockwork.faction:New("Goreic Warrior");
	FACTION.disabled = false; -- For events.
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_gores";
	FACTION.color = Color(100, 100, 100);
	FACTION.description = "Люди Севера, не имеющие себе равных по выносливости и силе, впервые собрались вместе. \nВ сердце их военного лагеря лежит Великое Древо, которое было изуродовано Святой Иерархией и должно быть восстановлено через кровопролитие. \nКланы должны отложить в сторону свои разногласия и начать благочестивый набег на последние оставшиеся южные земли, чтобы отомстить и обрести славу. \nЕсли их Великое Древо постигнет еще одна катастрофа, их связь с Пятью Богами будет навсегда разорвана, и весь мир погибнет. \nПо этой причине они должны терпеть еще сильнее, поскольку за рубежом гораздо больше угроз, чем разрушенная Иерархия."
	FACTION.availablefaiths = {"Faith of the Family"};
	FACTION.subfactionsToAvailableFaiths = {["Clan Reaver"] = {"Faith of the Family", "Faith of the Dark"}};
	FACTION.characterLimit = 2; -- # of characters of this faction a player can have.
	FACTION.ratio = 0.3; -- 0.2 slots per player (6 at 30 players).
	FACTION.imposters = true;
	FACTION.names = "goreic";
	FACTION.subfactions = {
		{name = "Clan Gore", subtitle = "Последователи Отца - Прирожденные воины и охотники", description = "Клан Гор в настоящее время известен как Клан Короны, титул, даруемый самому могущественному из всех Кланов. Клан Гор родился путем кровопролития и завоевания. У предыдущего Клан Короны и последователей Отца, Клана Горста, был военный вождь, который совершил ошибку, став отцом незаконнорожденного ребенка и оставив его на съедение волкам. Мальчика вместо этого вырастили эти волки, и он взял себе имя Король-Жнец Калкаслэш. С армией оборотней и оборотней дите прорубило себе путь в длинный зал своего отца и разорвало его в кровавое месиво своими когтями. С тех пор он захватил свой трон и заставил другие Кланы преклонить колени вместе со своей недавно собранной армией воинов. В течение следующих ста лет Клан Гор захватывал женщин тысячами и выводил новых воинов, поскольку они рождали тысячи еще безжалостных убийц, чтобы продолжить процесс. Отец суров и беспощаден, но благодаря его силе империи падут.", rivalry = "Clan Grock", attributes = {{Color(0, 225, 0), "(+) Рожденный Убивать: +50 Макс. Здоровья"}, {Color(0, 225, 0), "(+) Охотник с Пелёнок: +50% урона Животным"}, {Color(0, 225, 0), "(+) Начинает с 8 уровнем Таинства"}}}, 
		{name = "Clan Harald", subtitle = "Последователи Старшего Сына - Мореплаватели и Исследователи", description = "Клан Харальд — второй старейший клан, принадлежащий к горейским народам, старейшим является клан Грок. Соль моря течет в крови этих людей, а их дом — то, что лежит за пределами суши. За последние несколько сотен лет клан Харальд не имел настоящего вождя, с тех пор как он был проклят богом-обманщиком Сестрой. Любой человек, который называет себя вождем моря, а значит, главой клана Харальда, умрет от утопления. Хотя у клана Харальд с давних времен никогда не бывает главы, всегда существует совет самых опытных (и упрямых) моряков, которые следят за делами. В эти нынешние темные времена Харальды стремятся положить конец своему проклятию и стать новым кланом Короны, как они чувствуют, им всегда было суждено быть. Моряки из этого клана всегда будут враждовать с последователями Сестры, ужасными обманщиками, которые создают штормы, отправляющие их корабли в пылающее море. Неизвестно всем остальным кланам, что последователи Старшего Сына видят свое божество как огромного зверя, живущего в самых темных глубинах океана, и вскоре они разбудят его и увидят, как весь их мир погружается под воду, в то время как они процветают наверху благодаря своим могучим парусам.", rivalry = "Clan Reaver", attributes = {{Color(0, 225, 0), "(+) Дите Моря: +45 макс. здоровья"}, {Color(0, 225, 0), "(+) Имеет доступ к Особому Кораблю"}, {Color(0, 225, 0), "(+) Начинает с 6 уровнем Таинства"}}}, 
		{name = "Clan Reaver", subtitle = "Последователи Сестры - Рабовладельцы и Торговцы", description = "Самые богатые из всех кланов, Риверы являются сторонниками общества и экономики Горов, но другие часто смотрят на них свысока. Их считают слабыми и обманщиками, и другие кланы никогда не доверяют им, и на то есть веская причина. Народ Копья проклят жить на бесплодных землях, и по этой причине они должны выживать, совершая набеги на более слабые народы. Тем не менее, Риверы следуют за Сестрой и считают своим правом причинять страдания другим, даже если у них нет для этого никаких практических причин. Их дом — Зал Слез, ужасающее место, спрятанное где-то в лесу, где люди находятся на грани смерти, пока они доставляют им удовольствие. Вместо того, чтобы встречаться со своими врагами на открытом поле, как их жестокие братья, они накладывают проклятия на своих врагов или даже заставляют целые фракции выполнять свои приказы. Некоторые на Юге предполагают, что последователи Сестры на самом деле могут выполнять работу Темного Принца, хотя сами Риверы могут даже предположить, что оба бога - один и тот же.", rivalry = "Clan Harald", attributes = {{Color(0, 225, 0), "(+) Начинает с +25 Максимального Здоровья"}, {Color(0, 225, 0), "(+) Богатство: Получает Зарплату раз в час"}, {Color(0, 225, 0), "(+) Получает двойную сумму за продажу рабов"}, {Color(0, 225, 0), "(+) Вера во Тьму разблокирована"}, {Color(0, 225, 0), "(+) Начинает с 6 уровнем Таинства"}}}, 
		{name = "Clan Shagalax", subtitle = "Последователи Младшего Сына - Строители и кузнецы", description = "Говорят, что Шагалакс рождается со стальной кожей и расплавленным железом, текущим в его крови. Без своего металла кровожадные Горы метали бы палки и камни вместо своей могучей стали. Было время, когда последователи Младшего Сына считались самыми могущественными из всех Кланов и всех племен, объединенных под их знаменем; когда их паровые изрыгающие танки бросали пламя по долинам, превращая армии и леса в пепел. Жалкие стрелы отскакивали от множества стальных пластин, когда их легионы танков катились по полям испуганных племен и городов Сияния. Только когда слабаки Клана Краст предвидели сделки Клана Шагалакс с механическим Богом-Титаном, чтобы их титул Королевского Клана не имел сомнений. Так что, когда Подземный Бог вошел в этот мир, Шагалаксы воспользовались этим и начали вторжение в вечно ненавистную Империю Света с объединенной мощью племен Гор. Однако из них вскоре узнали, что у Подземного Бога нет союзников, и в момент их величайшей слабости их остатки были завоеваны последователями Отца по приказу Клана Краст. Тогда было решено, что только Отец и через него Клан Гор могут властвовать над другими Кланами. Те Шагалаксы, отрезанные от своих братьев во время вторжения Подземного Бога, теперь составляют многие из банд драчунов, которые терзают пустоши, но небольшое количество тех, кто все еще связан с Великим Древом, все еще остаются среди великих кланов. Многие Шагалаксы утверждают, что они верны Младшему Сыну, божеству милосердия и изобретательности.", rivalry = "Clan Crast", attributes = {{Color(0, 225, 0), "(+) Закаленный: +30 Макс. здоровья"}, {Color(0, 225, 0), "(+) Начинает с 8-го уровня Таинства, с очками вложенными в «Изобретательность»."}, {Color(0, 225, 0), "(+) Может создавать и использовать Огнестрел"}}}, 
		{name = "Clan Crast", subtitle = "Последователи Матери - Шаманы и Мистики", description = "В то время как все последователи Семьи уважают роль и вклад Матери в грубый, но справедливый цикл природы и смерти, на тех, кто действительно родился под ее началом, смотрят свысока, как на слабых и жалких. В давние дни всех последователей Матери сбрасывали с высоких скал, чтобы они разбились о камни внизу, поскольку они никогда не вырастут великими воинами, как последователи Отца. Затем более благосклонный Король Трона Коры решил, что одному из десяти детей, рожденных под знаком Матери, будет разрешено жить. Как всегда, эти счастливчики выросли странными и изуродованными маленькими существами, но у них были дары, которые делали их полезными. Некоторые стали бардами, артистами: жонглирующим гномом или двухголовым великаном. У других было Видение, способ заглянуть в темную пустоту самой судьбы. С новым поколением мистических существ был сформирован новый Клан, первый из когда-либо следовавших за Матерью. По сей день клан Краст процветает без кровопролития, поскольку их великие ослепленные провидцы смотрят во тьму, чтобы предупредить остальных об их грядущих опасностях. Когда провидец предвидел гибель Великого Древа от рук огнедышащих драконов Святой Иерархии, и никто ему не поверил, Горы научились никогда больше не пропускать мимо ушей слова Шаманов. Текущая линия клана Краст больше всего связана с друидами-клинками древности и стремится использовать их древнее оружие, выкованное самой Землей. Великий ритуал ждет клан Краст, чтобы восстановить их Великое Древо, и другие кланы ждут, чтобы увидеть это.", rivalry = "Clan Shagalax", attributes = {{Color(0, 225, 0), "(+) Начинает с +25 Максимального Здоровья"}, {Color(0, 225, 0), "(+) Начинает с 12 уровнем Таинства"}, {Color(0, 225, 0), "(+) Имеет доступ к Фамильяру-Ворону"}, {Color(225, 0, 0), "(-) Уродец: Имеет -4 стартовых очка"}}}, 
		{name = "Clan Grock", subtitle = "Последователи Старого Пути - Кочевники", description = "Первое племя Народа  Копья, что поселилось около Великого Древа. Самый старый клан из всех Горов и те, кто отказался следовать за богами Семьи. Хотя многие последователи Старых Обычаев признают существование Семьи, они предпочитают вместо этого идти своим путем и доверять себе, чтобы увидеть свой собственный путь в жизни. Все Горы верят, что им суждено умереть, и что бы они ни делали, это не изменится, и поэтому те, кто придерживается Старых Обычаев, соглашаются, что будут продолжать бороться за выживание, пока не наступит этот день. Средний Грок намного выше и сильнее своих братьев, с густым слоем черной шерсти, покрывающей их немытые тела, что придает им звериный вид. Клан Грок никогда не будет обладать какой-либо властью, поскольку их верования поощряют кочевой образ жизни, свободный от общества, законов и зависимости от других людей. Единственный раз, когда их призовут другие, это если их Великое Древо подвергнется нападению, и тогда и только тогда они бросятся защищать свои родные земли. Клан Грок считается посмешищем для других кланов, мужчин, которые предпочтут спать со зверями, чем с хорошей женщиной. Худшими из них являются клан Гор, высокомерные короли Древности, которые устраивали «Великие Охоты», чтобы убить как можно больше Гроков ради славы и права хвастовства. Тем не менее, когда их великие боги подводят их, боги Старых Обычаев всегда будут стоять.", rivalry = "Clan Gore", attributes = {{Color(0, 225, 0), "(+) Зверь: Начинает с +175 макс. здоровья"}, {Color(0, 225, 0), "(+) Взывая к Лесу: Боевой Клич восстанавливает выносливость"}, {Color(0, 225, 0), "(+) Начинает с 8 уровнем Таинства"}, {Color(225, 0, 0), "(-) Не носят тяжелую и среднюю броню"}, {Color(225, 0, 0), "(-) Не имеет прокачки в Вере"}}}
	};
	FACTION.models = {
		male = {
			clothes = "models/begotten/goreicwarfighters/goretribal_male.mdl",
			heads = {
				"male_90",
				"male_91",
				"male_92",
				"male_93",
				"male_94",
				"male_95",
				"male_96"
			},
		},
	};
	FACTION.singleGender = GENDER_MALE;
	
	if SERVER then
		function FACTION:CanPromote(player, target, faction, subfaction)
			if subfaction == "Clan Grock" then
				return false;
			end
		end
		
		function FACTION:CanDemote(player, target, faction, subfaction)
			if subfaction == "Clan Grock" then
				return false;
			end
		end
	end
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end

	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	Schema.Ranks["Goreic Warrior"] = {
		[1] = "",
		[2] = "Хускарл",
		[3] = "Прорицатель",
		[4] = "Провидец",
		[5] = "Адмирал",
		[6] = "Железнорожденный",
		[7] = "Мародер",
		[8] = "Красный Волк",
		[9] = "Вождь",
		[10] = "Старейшина",
		[11] = "Великий Адмирал",
		[12] = "Избранник Короля",
		[13] = "Король",
	};
	
	Schema.RankTiers["Goreic Warrior"] = {
		[1] = {"", "Прорицатель", "Мародер"},
		[2] = {"Хускарл", "Провидец", "Адмирал", "Железнорожденный", "Красный Волк"},
		[3] = {"Вождь", "Старейшина", "Великий Адмирал"},
		[4] = {"Избранник Короля"},
		[5] = {"Король"},
	};
	
	Schema.RanksToSubfaction["Goreic Warrior"] = {
		["Адмирал"] = "Clan Harald",
		["Великий Адмирал"] = "Clan Harald",
		["Прорицатель"] = "Clan Crast",
		["Провидец"] = "Clan Crast",
		["Старейшина"] = "Clan Crast",
		["Железнорожденный"] = "Clan Shagalax",
		["Мародер"] = "Clan Reaver",
		["Красный Волк"] = "Clan Reaver",
	};
FACTION_GOREIC = FACTION:Register();

local FACTION = Clockwork.faction:New("Children of Satan");
	FACTION.disabled = false; -- For events.
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_satanists";
	FACTION.color = Color(125, 10, 10);
	FACTION.description = "Those selected to join the Children of Satan are exceptional individuals, be they particularly twisted and cunning, or perhaps born with the blood of ancient royalty. \nFor this reason the Children are few in number compared to the other powers, but they make up for this with their unmatched skill and grace. \nThe average Child of Satan is centuries old, obsessed with higher forbidden knowledge and glorious works of art and passion, yet they still have very much to learn. \nFearing what becomes of their corrupted souls if they are to meet an unforseen fate before reaching Demonhood, a Child of Satan will rarely risk their life for a prize not satisfactory. \nThey are the unseen puppet masters; the Glaze and the Gore must be kept in the balance, for Satan desires more subjects in his war against the Undergod, and extinction will only result in His victory.";
	FACTION.availablefaiths = {"Faith of the Dark"};
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.ratio = 0.167; -- 0.167 slots per player (5 at 30 players).
	FACTION.names = "glazic";
	FACTION.subfactions = {
		{name = "Varazdat", subtitle = "House Varazdat - Master Swordsmen and Drinkers of Blood", description = "The Eastern Nigerii Empire is aptly known as the Land of a Thousand Princes for its infamous lust-crazed Emperors. Several of these Emperors held tremendous orgies in their palace grounds that led to many bastard children. Due to unclear laws of succession, this led to an unending stretch of wars hosted in the Far East for a throne soaked in blood. Among the thousands of claimants to the throne was the Varazdat child, one who had very little royal blood in him, but all the ambition in the world. While the other pretenders were propped up by wealthy spice merchants and noblemen, Varazdat was a gutter rat who began his climb by pickpocketing and throat slicing. He kidnapped other claimants and prepared their bodies into fine feasts, their tender meat spiced and roasted to perfection. For each would-be Prince he killed and cannibalized, he absorbed their power and birthright. At the end of his road he was positively bloated, his belly full of royalty, and his claim to the throne backed by millions of mercenaries. The Varazdat reign did not last very long, as most go, but it opened the way for future Emperors to seek powers from the Dark. Today those who share the blood of House Varazdat are feared as particularly ruthless schemers, and child-eaters.", attributes = {{Color(0, 225, 0), "(+) Bloodlust: +10% sprint speed when above 95% health"}, {Color(0, 225, 0), "(+) Lifeleech: 50% damage dealt returned as health."}, {Color(0, 225, 0), "(+) Eastern Warriors: Starts with +25 maximum health and +15 maximum stamina"}, {Color(0, 225, 0), "(+) Starts with the 'Savage' and 'Heart Eater' beliefs unlocked"}, {Color(0, 225, 0), "(+) Starts at Sacrament Level 5"}, {Color(225, 0, 0), "(-) Can only gain sustenance from feeding on human flesh"}, {Color(225, 0, 0), "(-) Crazed Cannibals: Sanity loss is increased by 50%"}}},
		{name = "Rekh-khet-sa", subtitle = "House Rekh-khet-sa - Immortal Sorcerers of the Darkness", description = "The formation of the House of Rekh-khet-sa dates back to long before recorded history within \'Egypt\', a forgotten land. Ancient Egyptians were tainted by Lucifer to use dark magics in their horrific pursuits of absolute immortality in the name of their Pharaoh. Although all of their original members are deceased, their greed for attaining immortality still persists to this very day, with their ancient texts being the basis for the Rekh-khet-sa\'s modern day reformation. Many members of the House Rekh-khet-sa pursue the so-called Ancient One's quest for immortality, imbued with visions from the Dark Prince, and obsessed with collecting artifacts to help achieve their goals, with some being successful and being able to perform such magics as reversing age. Because of this, many older members of Rekh-khet-sa tend to be wiser than the other houses, able to gain a wealth of experience. Though each member of this bloodline may be hundreds of years old, they live eternally in darkness. When the light of Sol shines upon them, they shrivel up, their perfect skin rotting away, revealing the cost of eternal life.", attributes = {{Color(0, 225, 0), "(+) Ancient Sorcerers: Gain no corruption or sanity loss"}, {Color(0, 225, 0), "(+) Can craft 'Hellforged Steel' without the 'Sorcerer' belief"}, {Color(0, 225, 0), "(+) Infinite level cap & +25% increased faith gain"}, {Color(0, 225, 0), "(+) Starts at Sacrament Level 16, with 'Primevalism' unlocked"}, {Color(225, 0, 0), "(-) Sustain periodic damage if outside during daytime"}}},
		{name = "Philimaxio", subtitle = "House Philimaxio - Black Knights Sworn to the Dark Prince", description = "When the Undergod swept over the lands of Sol to bring ruination and purification, almost all the central Districts fell immediately. The White Sentinels of District Seventeen begged to differ. Their stronghold was ravaged time and time again by the hordes of the unliving thralls, and each time they fell onto the blades of the Sentinels. They were no mere guardsmen, but renowned nobles of the iron-fisted Philimaxio family. In the Holy Hierarchy, very few noble houses would ever stoop so low as to bear arms directly. The Philimaxios were martialists, stout and hardy, always ready for the time in which a great foe would rise against them. Indeed they held their District Seventeen until there was no longer any reason to do so, as the Empire of Light shattered around them and they were stranded. Realizing their predicament, the Philimaxios found themselves surrounded by dark temptations. The Dark Prince whispered in their ears, wearing down on their spiritual resolve until they found themselves turning against the Light. The White Sentinels turned crimson as they slaughtered every serf, noble, and citizen alike within District Seventeen. The Philimaxios were one of the first to join the Children of Satan, seeking out the haunted manor where they would become unholy guardsmen of a Satanic Dreadlord. Quiet, strong, dutiful and unmoving, the sons of the Philimaxio Bloodline will hold back all who dare threaten the followers of Darkness.", attributes = {{Color(0, 225, 0), "(+) Armored Wall: Heavy armor is 15% more protective"}, {Color(0, 225, 0), "(+) Armor condition deterioration is halved"}, {Color(0, 225, 0), "(+) Bullet damage is reduced by 70%"}, {Color(0, 225, 0), "(+) Warrior Nobles: +50% maximum health and +25 maximum stability"}, {Color(0, 225, 0), "(+) Starts at Sacrament Level 6"}, {Color(225, 0, 0), "(-) Burdened: Run speed is decreased by 15%"}}},
		{name = "Kinisger", subtitle = "House Kinisger - Mutant Masters of Infiltration and Assassination", description = "Chaos, deception, and trickery. House Kinisger has existed since the The First Inquisition. When deception was high within the Empire of Light, Lord Maximus stepped forth and revealed the existence of the Black-Hats; black blooded mutants taking on the appearance of men of Faith who had infiltrated society to spread chaos. The Inquisition was then called to bring an end to the Black-Hats, with some having to use witchery to disguise their black blood to crimson red, and when the Inquisition had begun executing anyone they were mildly suspicious of they had to take to more extreme measures. This was the beginning of their pact, as they had used dark rituals to disguise their flesh into different appearances. Practically any Black-Hat who did not use this method was executed in the First Inquisition. Thus, the descendants of House Kinisger are all Black-Hats who still remain true to the Dark. Their members to this day have become experienced in the art of infiltrating society and have become excellent spies and ritual masters. Before turning to the Dark, the mutant amish of House Kinisger were the equivalent of cockroaches - willing to do anything to merely stay alive amongst men who sought their demise. They used their flesh sorcery to hide in plain sight, to live amongst the enemy. Now they have awoken to their true purpose, to sow chaos and doubt, to always seek to topple any great threat from within.", attributes = {{Color(0, 225, 0), "(+) Faceless: Unique Rituals to alter appearance or cloak"}, {Color(0, 225, 0), "(+) Assassin: Deal 25% more damage with daggers"}, {Color(0, 225, 0), "(+) Immune to blood tests (excluding false positives)"}, {Color(0, 225, 0), "(+) Starts at Sacrament Level 6"}, {Color(225, 0, 0), "(-) Mutant Blood: Start with -3 Trait Points"}}}
	};
	--FACTION.singleGender = GENDER_MALE;
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if player:GetFaith() ~= "Faith of the Dark" then
			return false;
		end
		
		if (!Clockwork.player:IsWhitelisted(player, "Children of Satan")) then
			Clockwork.player:SetWhitelisted(player, "Children of Satan", true);
		end;
	end;
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end

	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	Schema.Ranks["Children of Satan"] = {
		[1] = "",
		[2] = "Адский Паладин",
		[3] = "Фараон",
		[4] = "Султан",
		[5] = "Чёрный Палец",
		[6] = "Бессмертный",
		[7] = "Лорд Ужаса",
		[8] = "Ярмо Дьявола",
		[9] = "Оскверненный Святой",
	};
	
	Schema.RankTiers["Children of Satan"] = {
		[1] = {""},
		[2] = {"Адский Паладин", "Фараон", "Султан", "Чёрный Палец", "Бессмертный"},
		[3] = {"Лорд Ужаса"},
		[4] = {"Ярмо Дьявола", "Оскверненный Святой"},
	};
	
	Schema.RanksToSubfaction["Children of Satan"] = {
		["Адский Паладин"] = "Philimaxio",
		["Фараон"] = "Rekh-khet-sa",
		["Султан"] = "Varazdat",
		["Черный Палец"] = "Kinisger",
	};
FACTION_SATANIST = FACTION:Register();

----------------------
----------------------
--- Event Factions ---
----------------------
----------------------

-- For Begotten II Map Change Event.
local FACTION = Clockwork.faction:New("Pope Adyssa's Gatekeepers");
	FACTION.hidden = true;
	FACTION.disabled = true; -- For events.
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.material = "begotten/faction/faction_logo_gatekeepers_adyssa";
	FACTION.color = Color(20, 20, 20);
	FACTION.description = "The Gatekeepers are the front line of defence against the countless unholy horrors that threaten the Glaze. \nTheir ranks swell with conscripted power-hungry commoners and fanatical flagellants. \nThey must serve the Holy Hierarchy diligently and without question, no matter how outrageous their demands may be. \nIll-trained and poorly equipped, these soldiers are expected to lay their lives down to protect the Light. \nAnd so they shall.";
	FACTION.availablefaiths = {"Faith of the Light"};
	FACTION.enlist = true;
	FACTION.singleGender = GENDER_MALE;
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.ratio = 0.3; -- 0.3 slots per player (9 at 30 players).
	--FACTION.imposters = true;
	
	if !Schema.Ranks then
		Schema.Ranks = {};
	end
	
	if !Schema.RankTiers then
		Schema.RankTiers = {};
	end
	
	if !Schema.RanksToSubfaction then
		Schema.RanksToSubfaction = {};
	end
	
	if !Schema.RanksToCoin then
		Schema.RanksToCoin = {};
	end
	
	Schema.Ranks["Pope Adyssa's Gatekeepers"] = {
		[1] = "DISCIPLE",
		[2] = "ACOLYTE",
		[3] = "EMISSARY",
		[4] = "HIGH-EMISSARY",
		[5] = "MASTER-AT-ARMS",
	};
	
	Schema.RankTiers["Pope Adyssa's Gatekeepers"] = {
		[1] = {"DISCIPLE"},
		[2] = {"ACOLYTE"},
		[3] = {"EMISSARY"},
		[4] = {"HIGH-EMISSARY"},
		[5] = {"MASTER-AT-ARMS"},
	};

	Schema.RanksToCoin["Pope Adyssa's Gatekeepers"] = {
		[1] = 25,
		[2] = 35,
		[3] = 50,
		[4] = 100,
		[5] = 200, 
	};
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name != "Wanderer" and faction.name != "Holy Hierarchy") then
			if player:GetSubfaction() ~= "Kinisger" then
				return false;
			end
		end;
		
		-- It is the IC responsibility of Gatekeepers to bloodtest recruits.
		--[[if player:GetFaith() ~= "Faith of the Light" or player:GetSubfaith() == "Voltism" then
			return false;
		end]]--
		
		if (!Clockwork.player:IsWhitelisted(player, "Pope Adyssa's Gatekeepers")) then
			Clockwork.player:SetWhitelisted(player, "Pope Adyssa's Gatekeepers", true);
		end;
	end;
	
	-- Called when a player's name should be assigned for the faction.
	function FACTION:GetNameCharCreation(name, rank, rankOverride)
		if !rank then
			return "GATEKEEPER-DISCIPLE."..name;
		end

		if rankOverride then
			return "GATEKEEPER-"..rankOverride.."."..name;
		end

		return "GATEKEEPER-"..Schema.Ranks["Pope Adyssa's Gatekeepers"][rank or 1].."."..name;
	end;
	
	-- Called when a player's name should be assigned for the faction.
	function FACTION:GetName(player, bNew)
		if bNew or !player:GetCharacterData("rank") then
			return Clockwork.kernel:ZeroNumberToDigits(math.random(1, 99999), 5);
		end
	
		local name = player:Name();
		local rankOverride = player:GetCharacterData("rankOverride");
		
		if !tonumber(name) then
			Clockwork.player:SetName(player, Clockwork.kernel:ZeroNumberToDigits(math.random(1, 99999), 5));
			name = player:Name();
		end

		if rankOverride then
			return "GATEKEEPER-"..rankOverride.."."..name;
		end
		
		local rank = math.Clamp(player:GetCharacterData("rank", 1), 1, #Schema.Ranks["Pope Adyssa's Gatekeepers"]);

		if (rank and isnumber(rank) and Schema.Ranks["Pope Adyssa's Gatekeepers"][rank]) then
			return "GATEKEEPER-"..Schema.Ranks["Pope Adyssa's Gatekeepers"][rank].."."..name;
		end;
	end;
FACTION_GATEKEEPER_ADYSSA = FACTION:Register();

-- For Scraptown Map Change Change Event.
local FACTION = Clockwork.faction:New("The Third Inquisition");
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.disabled = true; -- For events.
	FACTION.hidden = true;
	FACTION.material = "begotten/faction/faction_logo_gatekeepers_adyssa";
	FACTION.color = Color(225, 175, 0);
	FACTION.description = "From the ashes of the Town of Light comes a third Inquisition, loyal in memoriam to Pope Adyssa. \nTheir goal is to unseat the false pope Aratakrast and put an end to his court's decadence. \nThey seek to civilize the County Districts through holy powder and steel, and thus fight on. \nYet, it is unlikely that this junior insurrection will succeed against the raging inferno of barbarism and apocalypse.";
	FACTION.availablefaiths = {"Faith of the Light"};
	FACTION.singleGender = GENDER_MALE;
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.names = "glazic";
	FACTION.imposters = true;
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name != "Wanderer" and faction.name != "Holy Hierarchy" and faction.name != "Gatekeeper") then
			return false;
		end;
		
		if player:GetFaith() ~= "Faith of the Light" or player:GetSubfaith() == "Voltism" then
			return false;
		end
		
		if (!Clockwork.player:IsWhitelisted(player, "The Third Inquisition")) then
			Clockwork.player:SetWhitelisted(player, "The Third Inquisition", true);
		end;
	end;
FACTION_THIRD_INQUISITION = FACTION:Register();

local FACTION = Clockwork.faction:New("Smog City Pirate");
	FACTION.whitelist = true;
	FACTION.useFullName = false;
	FACTION.disabled = true; -- For events.
	FACTION.hidden = true;
	FACTION.material = "begotten/faction/faction_logo_scrappers";
	FACTION.color = Color(92, 64, 51);
	FACTION.description = "The dreaded denizens of Smog City, a place of machines and misery. \nSworn to build a Mechanical God, the pirate slavers command a disposable workforce of Wanderers to construct this terrible titan. \nThe divided backgrounds and conflictions of faith bring forth infighting within the ranks of the Pirates. \nOnly under the iron fist of their King are the gangs put in line.";
	FACTION.availablefaiths = {"Faith of the Light", "Faith of the Family", "Faith of the Dark"};
	FACTION.subfactions = {
		{name = "Machinists", subtitle = "Brutal Scrappers and Slavers", description = "It it said that the foul stench of the scrapper machinists, that of rotting meat and gunpowder, can be smelled for miles around. The Scrappers align themselves with the most powerful and use faith as a means to become stronger than their peers. They are scavengers, slavers, and above all else, human cockroaches.", attributes = {{Color(0, 225, 0), "(+) Hardened Savages: +30 maximum health"}, {Color(0, 225, 0), "(+) Starts at Sacrament Level 8"}, {Color(225, 0, 0), "(-) The Voltist subfaith tree is locked and cannot be progressed!"}}},
		{name = "Voltists", subtitle = "Technological Fanatics & Transhumanists", description = "The Electrozombified of the Smog City Pirates think themselves above the struggle and desire that their brothers have fallen to. They see to the whims of the Program - a technological device above human understanding - and seek to combine its intelligence with the Mechanical God whence it is constructed.", attributes = {{Color(0, 225, 0), "(+) Starts at Sacrament Level 11, with 'Voltism' unlocked"}}},
	};
	FACTION.singleGender = GENDER_MALE;
	FACTION.characterLimit = 1; -- # of characters of this faction a player can have.
	FACTION.names = "glazic";
	FACTION.imposters = true;
	
	-- Called when a player is transferred to the faction.
	function FACTION:OnTransferred(player, faction, name)
		if (faction.name ~= "Wanderer") then
			return false;
		end;
		
		if (!Clockwork.player:IsWhitelisted(player, "Smog City Pirate")) then
			Clockwork.player:SetWhitelisted(player, "Smog City Pirate", true);
		end;
	end;
FACTION_SMOG_CITY_PIRATES = FACTION:Register();
