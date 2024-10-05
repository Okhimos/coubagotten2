--[[
	Begotten 3: Jesus Wept
	written by: cash wednesday, DETrooper, gabs and alyousha35.
--]]

local FAMILY = cwBeliefs.beliefTrees:New("family")
	FAMILY.name = "Faith of the Family";
	FAMILY.color = Color(150, 50, 20);
	FAMILY.order = 7;
	FAMILY.size = {w = 771, h = 407};
	FAMILY.textures = {"family", "faithfamilyarrows"};
	FAMILY.headerFontOverride = "nov_IntroTextSmallaaafaa";
	FAMILY.tooltip = {
		{"Вера Семьи", FAMILY.color, "Civ5ToolTip4"},
		{"Каждая вера имеет уникальный набор навыков, открывающих способности персонажа, ритуалы и в целом улучшающих характеристики. Веры в том числе делятся на подверы, хотя открытое исповедание этих подвер может привести к тому, что ваш персонаж будет признан еретиком соответствующими религиозными властями.", Color(225, 200, 200)},
		{"\n\"Святой город Сияния во владениях Ада. Это мои два меча, которые нужно скрестить на ее груди в решимости к великой цели. В бьющемся сердце щитов.\"", Color(128, 90, 90, 240)},
		{"", Color(50, 255, 50)}
	};
	FAMILY.columnPositions = {
		[1] = (FAMILY.size.w - 4) * 0.1,
		[2] = (FAMILY.size.w - 4) * 0.3,
		[3] = (FAMILY.size.w - 4) * 0.5,
		[4] = (FAMILY.size.w - 4) * 0.7,
		[5] = (FAMILY.size.w - 4) * 0.9,
	};
	FAMILY.rowPositions = {
		[1] = (FAMILY.size.h - 4) * 0.3,
		[2] = (FAMILY.size.h - 4) * 0.5,
		[3] = (FAMILY.size.h - 4) * 0.7,
		[4] = (FAMILY.size.h - 4) * 0.9,
	};
	
	FAMILY.lockedSubfactions = {"Clan Grock"};
	FAMILY.requiredFaiths = {"Faith of the Family"};
	
	-- First index is column.
	FAMILY.beliefs = {
		[1] = {
			["father"] = {
				name = "Сила Отца",
				subfaith = "Faith of the Father",
				description = "Выбирает «Веру Отца» в качестве вашей подверы. Разблокирует способность молиться. Разблокирует способность к боевому кличу. Увеличивает прирост веры от урона и убийства медведей, рабов и персонажей, имеющих более высокий уровень таинства чем у вас в два раза.",
				quote = "Отец — Патриарх, проявление конфликта и борьбы. Он следит за тем, чтобы его дети были готовы выжить любой ценой. Последователи Отца могут быть кровожадными и иногда жестокими, но они обладают чувством силы и чести, не имеющим себе равных.",
				lockedSubfactions = {"Clan Harald", "Clan Reaver", "Clan Shagalax", "Clan Crast"},
				row = 1,
			},
			["honor_the_gods"] = {
				name = "Почитай богов",
				subfaith = "Faith of the Father",
				description = "Разблокирует I уровень ритуалов семьи.",
				lockedSubfactions = {"Clan Harald", "Clan Reaver", "Clan Shagalax", "Clan Crast"},
				requirements = {"father"},
				row = 2,
			},
			["man_become_beast"] = {
				name = "Человек становится зверем",
				subfaith = "Faith of the Father",
				description = "Открывает возможность использовать одноручное оружие в двух руках одновременно. Открывает возможность экипировать когти. Увеличивает максимальную выносливость на 10 очков. Увеличивает максимальное здоровье на 40 очков. Открывает семейные ритуалы II уровня.",
				lockedSubfactions = {"Clan Harald", "Clan Reaver", "Clan Shagalax", "Clan Crast"},
				requirements = {"father", "honor_the_gods"},
				row = 3,
			},
			["fearsome_wolf"] = {
				name = "Грозность Волка",
				subfaith = "Faith of the Father",
				description = "Улучшает способность «Боевой клич»: все ближайшие враги будут подсвечены красным на 20 секунд. Вы будете наносить на 20% больше урона и на 15% больше урона по выносливости подсвеченным врагам, а также бегать на 10% быстрее в течение 20 секунд. Увеличивает урон от метательного топора на 15%.",
				quote = "\"СМЕРТЬ СИЯНИЮ И СЛАВА ГЕЙ ГОРУ!!!\"",
				lockedSubfactions = {"Clan Harald", "Clan Reaver", "Clan Shagalax", "Clan Crast"},
				requirements = {"father", "honor_the_gods", "man_become_beast"},
				row = 4,
			},
		},
		[2] = {
			["mother"] = {
				name = "Милосердие Матери",
				subfaith = "Faith of the Mother",
				description = "Выбирает «Веру Матери» в качестве вашей подверы. Открывает возможность молиться. Открывает возможность издавать боевые кличи. Увеличивает прирост веры от проведения ритуалов, исцеления других персонажей и занятий алхимией.",
				quote = "Мать — Матриарх, архитектор природы и цикла жизни и смерти. Из ее чрева вышла вся жизнь, и под ее надзором все они однажды умрут. Последователи Матери — изгои общества Гора, изуродованные и чахлые мужчины и больные рабыни. Их цель — исцелить мир трупов, в котором они обитают, и дать смерть тем, кто грызет его корни.",
				lockedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Shagalax"},
				row = 1,
			},
			["one_with_the_druids"] = {
				name = "Един с друидами",
				subfaith = "Faith of the Mother",
				description = "Разблокирует семейные ритуалы I и II уровня.",
				lockedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Shagalax"},
				requirements = {"mother"},
				row = 2,
			},
			["gift_great_tree"] = {
				name = "Подарок Великого Древа",
				subfaith = "Faith of the Mother",
				description = "Теперь вы будете пассивно восстанавливать здоровье с течением времени, независимо от ваших ран. Это происходит отдельно от обычной регенерации здоровья и намного быстрее. Увеличивает ваш максимальный HP на 25 очков.",
				quote = "\"Хранители Великого Древа в свою очередь благословлены неестественными способностями. Раны заживают от их прикосновения, мертвая почва прорастает жизнью с каждым шагом. Все будет возмещено сполна, когда их жизнь закончится, а их тела снова будут поглощены Землей.\"",
				lockedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Shagalax"},
				requirements = {"mother", "one_with_the_druids"},
				row = 3,
			},
			["watchful_raven"] = {
				name = "Бдительность Ворона",
				subfaith = "Faith of the Mother",
				description = "Открывает доступ к семейным ритуалам III уровня и уникальным ритуалам Матери. Открывает доступ к способности Ravenspeak, если вы Горейский воин Клана Краст. Снижает вероятность получения травм на 50%. Открывает доступ к уникальным рецептам алхимии.",
				lockedSubfactions = {"Clan Gore", "Clan Harald", "Clan Reaver", "Clan Shagalax"},
				requirements = {"mother", "one_with_the_druids", "gift_great_tree"},
				row = 4,
			},
		},
		[3] = {
			["old_son"] = {
				name = "Мудрость Старшего Сына",
				subfaith = "Faith of the Old Son",
				description = "Выбирает «Веру Старшего Сына» в качестве вашей подверы. Открывает возможность молиться. Открывает возможность издавать боевой клич. Увеличивает пассивный прирост веры.",
				quote = "Старший Сын — вестник войны, божество завоевания и проявление бесконечного моря. Рожденные под его началом — беспокойные души, всегда стремящиеся к самосовершенствованию и смеющиеся в лицо непреодолимым трудностям. Старый и испытанный клан Харальдов плавал по миру, покоряя адские ландшафты и возвращаясь с могучей добычей. Они — претенденты, убийцы демонов, искатели приключений и наследники удачи. Но, возможно, они могли бы быть чем-то большим, поскольку Старший Сын шевелится в бесконечных глубинах, и его пробуждение может вызвать наводнение, которое затопит цивилизацию и бремя человечества вместе с ней.",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Shagalax"},
				row = 1,
			},
			["the_black_sea"] = {
				name = "Черное Море",
				subfaith = "Faith of the Old Son",
				description = "Значительно увеличивает эффективность чувств и позволяет использовать их, когда они не экипированы, также это означает, что их нужно переключать вручную. При использовании чувств близлежащие ловушки будут подсвечены. Значительно снижает потерю кислорода, позволяя вам оставаться под водой в три раза дольше. Открывает ритуалы семьи I уровня.",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Shagalax"},
				requirements = {"old_son"},
				row = 2,
			},
			["taste_of_blood"] = {
				name = "Вкус Крови",
				subfaith = "Faith of the Old Son",
				description = "Увеличивает ваше максимальное здоровье на 35 очков. При нанесении урона персонажу, он будет подсвечен красным на 3 минуты. В это время вы нанесете ему на 15% больше урона. Вы можете отслеживать только одного человека одновременно.",
				quote = "\"Я попробовал твою кровь. У нее очень хороший вкус! Беги, спасайся, а я поохочусь. Твои кости будут погребены в этих лесах.\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Shagalax"},
				requirements = {"old_son", "the_black_sea"},
				row = 3,
			},
			["daring_trout"] = {
				name = "Смелость Форели.",
				subfaith = "Faith of the Old Son",
				description = "Улучшает способность «Боевой клич»: все ближайшие враги будут подсвечены белым на 10 секунд и замедлены на 15%. Увеличивает урон от метательного топора на 15%. Открывает доступ к ритуалам семьи II уровня и уникальным ритуалам Старшего Сына.",
				quote = "\"Мы приплыли в эту далекую землю, чтобы убивать и грабить! Вы не будете сражаться с нами, трусы? Вы не присоединитесь к груде трупов?\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Shagalax"},
				requirements = {"old_son", "the_black_sea", "taste_of_blood"},
				row = 4,
			},
		},
		[4] = {
			["young_son"] = {
				name = "Изобретательность младшего сына",
				subfaith = "Faith of the Young Son",
				description = "Выбирает «Веру молодого сына» в качестве вашей подконфессии. Открывает возможность молиться. Открывает возможность издавать боевой клич. Увеличивает прирост веры от крафта.",
				quote = "Младший Сын — божество инноваций, источник всех металлов и огня, осквернитель естественного закона. Те, кто следует за Младшим Сыном, считаются стоическими, упрямыми людьми, которые держатся особняком. Известно также, что в их крови есть расплавленное железо, которое закаляет их сталь, когда они куют могучее оружие. Отец, в своем постоянном неодобрении своего младшего потомка, ставит Младшего Сына на путь семейных неурядиц в попытке доказать силу его изобретательности. Он призывает своих человеческих последователей — которым он проявил большую признательность, в отличии от других божеств — помочь ему на его пути убийства Отца и завершить пророчество о разрушении и возрождении.",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Harald"},
				row = 1,
			},
			["taste_of_iron"] = {
				name = "Вкус железа",
				subfaith = "Faith of the Young Son",
				description = "Все созданные предметы будут в идеальном состоянии, независимо от состояния комплектующих. Увеличивает сопротивление ожогам на 50%. Также нейтрализует все повреждения от огня окружения.",
				quote = "\"Нельзя сжечь то, что кипит.\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Harald"},
				requirements = {"young_son"},
				row = 2,
			},
			["shieldwall"] = {
				name = "Стена щитов",
				subfaith = "Faith of the Young Son",
				description = "Увеличивает максимальное здоровье на 25 очков. Полностью устраняет штраф к урону от оружия при использовании щитов. Увеличивает сопротивление выносливости всех щитов на 15%.",
				quote = "\"Шагалаксианцы верят, что единственное, что отделяет человека от зверя, — это металл в их руках. Когда человек отбрасывает свое железо, они становятся не более чем добычей для охоты.\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Harald"},
				requirements = {"young_son", "taste_of_iron"},
				row = 3,
			},
			["enduring_bear"] = {
				name = "Выносливость медведя",
				subfaith = "Faith of the Young Son",
				description = "Открывает возможность плавить Шагалакскую сталь (если открыт Мастер-кузнец). Увеличивает максимальную стабильность на 25 очков. Уменьшает вероятность получения травмы на 20%. Уменьшает накопление усталости на 50%.",
				quote = "\"Я не успокоюсь, пока небо не потемнеет в сером тумане: когда наши двигатели будут построены, когда наши стальные титаны застонут, когда все будет сокрушено под нашими катящимися колесами. Новый бог! Закаленный в адском огне и крови! Шаг-а-лакс! Шаг-а-лакс!\"",
				iconOverride = "begotten/ui/belieficons/bestial.png",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Reaver", "Clan Harald"},
				requirements = {"young_son", "taste_of_iron", "shieldwall"},
				row = 4,
			},
		},
		[5] = {
			["sister"] = {
				name = "Хитрость Сестры",
				subfaith = "Faith of the Sister",
				description = "Выбирает «Веру сестры» в качестве вашей подверы. Разблокирует возможность молиться. Разблокирует возможность издавать боевой клич. Получайте больше веры от нанесения урона, убийства и продажи в рабство персонажей с более низким уровнем веры, чем у вас.",
				quote = "Сестра — дочь амбиций, обманщица-богиня хитрости и интриг. Ее последователи полны ненависти и недовольства, они всегда стремятся узурпировать власть, где это возможно. Говорят, что клан Ривер, избранный клан Сестры, имеет неприступную крепость в глубине Горейских Королевств, где мужчин пытают и сдирают кожу, чтобы усилить их богиню. Другие кланы видят в ее последователях дурное предзнаменование, их приход — окончательное крушение мира и уничтожение Семьи в целом. Многие подозревают, что Сестра на самом деле не является членом Семьи, а извращенным идолом-прокси Темного Принца. Маловероятно, что их предположения неверны.",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Shagalax", "Clan Harald"},
				row = 1,
			},
			["witch_druid"] = {
				name = "Ведьма-друид",
				subfaith = "Faith of the Sister",
				description = "Открывает возможность использовать одноручное оружие в двух руках одновременно. Открывает возможность экипировать когти. Открывает ритуалы Веры Семьи и Веры Тьмы I уровня.",
				quote = "\"Остерегайтесь плетеного человека.\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Shagalax", "Clan Harald"},
				requirements = {"sister"},
				row = 2,
			},
			["shedskin"] = {
				name = "Сброшенная шкура",
				subfaith = "Faith of the Sister",
				description = "Увеличивает максимальное здоровье на 20 единиц. Увеличивает значение защиты всех доспехов на 15%. Открывает ритуалы Веры Семьи и Веры Тьмы II уровня, а также уникальные ритуалы Веры Сестер.",
				quote = "\"Их черные железные пластины подложены содранной кожей людей. Если мы хотим убить этих тварей, ты должен колоть глубже!\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Shagalax", "Clan Harald"},
				requirements = {"sister", "witch_druid"},
				row = 3,
			},
			["deceitful_snake"] = {
				name = "Коварность Змеи",
				subfaith = "Faith of the Sister",
				description = "Если кто-то нанесет вам 10 или более единиц урона за один удар, он будет выделен красным и будет получать от вас на 25% больше урона в течение 40 секунд. Также разблокирует способность выплавлять Адскую Сталь (только если также разблокирован «Мастер-кузнец»).",
				quote = "\"Ты будешь кричать, а потом у тебя не будет языка. Ты будешь журчать, а потом захлебнешься. Тебя повесят на дереве, и из твоей плоти сделают плащ.\"",
				lockedSubfactions = {"Clan Gore", "Clan Crast", "Clan Shagalax", "Clan Harald"},
				requirements = {"sister", "witch_druid", "shedskin"},
				row = 4,
			},
		},
	};
cwBeliefs.beliefTrees:Register(FAMILY)