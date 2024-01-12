--[=[
humanHP = 100;
rocketHP = 100;
resourceHP = 100;
oxygenHP = 100;
]=]

------ РЕШЕНИЯ ЗАДАНИЙ ------
obj {
    nam = 'task_1',
    dsc = 'Здесь есть {пробоина}, которую нужно починить.',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 10 then
            -- Успешное выполнение
            humanHP = humanHP + charValue()
            oxygenHP = oxygenHP + charValue()
            rocketHP = rocketHP + charValue()
			p("Пока ты латал пробоину, ты заметил еще пару мест, которые требовали починки. Плагодаря этому были предотвращены пара будующих проблем, которые всплыли бы потом.")
        else
            -- Провал
            humanHP = humanHP - charValue()
            oxygenHP = oxygenHP - charValue()
            rocketHP = rocketHP - charValue()
			p("Ну ты  хотяб попытался, но что-то пошло не так. Ты тупо прикрыл дырку пакетом.")
        end
        currentTask.completed = true
        goal = 'Вернуться в криокапсулу'
		-- Удаление кнопки
		s:disable()
    end;
}

obj {
    nam = 'task_2',
    dsc = 'Похоже, что от контрольной панели отошла пара {трубок}, возможно проблема именно в них.',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 10 then
            -- Успешное выполнение
            humanHP = humanHP + charValue()
            oxygenHP = oxygenHP + charValue()
			p("Ура, ты смог восстановить стабильную подачу кислорода в отсеки")
        else
            -- Провал
            humanHP = humanHP - charValue()
            oxygenHP = oxygenHP - charValue()
			p("Хоть задание было не сложном, но ты провалил и его. Подача кислорода восстановлена, но он не такой вкусный как раньше.")
        end
        currentTask.completed = true
        goal = 'Вернуться в криокапсулу'
		s:disable()
    end;
}

obj {
    nam = 'task_3',
    dsc = 'В блоке фильтрации воды на удивление и правда пахнет вином, нужно это {исправить}',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 10 then
            -- Успешное выполнение
            humanHP = humanHP + charValue()
            rocketHP = rocketHP + charValue()
            resourceHP = resourceHP + charValue()
			p("Ты успешно запустил систему усиленной фильтрации воды. Конечно это теперь не вино, но члены экипажа говорят, что вода стала вкуснее.")
        else
            -- Провал
            humanHP = humanHP - charValue()
            rocketHP = rocketHP - charValue()
            resourceHP = resourceHP - charValue()
			p("Ты попытался запустить усиленную систему фильрации воды, но вода теперь имеет мерзкий вкус уксуса и чего-то технического. Возможно ты повредил что-то, пока ковырялся в системе фильров.")
        end
        currentTask.completed = true
        goal = 'Вернуться в криокапсулу'
		-- Удаление кнопки
		s:disable()
    end;
}

obj {
    nam = 'task_4',
    dsc = 'Тут ОЧЕНЬ темно, но ты смог {нащупать} неисправную лампочку',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 10 then
            -- Успешное выполнение
			p("Вау, ты смог заменить лампочку! ")
        else
            -- Провал
            humanHP = humanHP - charValue() - 10
            rocketHP = rocketHP - charValue()
			p("Ты полез куда-то не туда, вместо того, чтобы просто заменить лампочку. Хоть ты не электрик, но у тебя теперь тоже есть корочка)))")
        end
        currentTask.completed = true
        goal = 'Вернуться в криокапсулу'
		-- Удаление кнопки
		s:disable()
    end;
}

obj {
    nam = 'task_5',
    dsc = 'Кухня полна стасиков, нужно расставить {ловушки}',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 18 then
            -- Успешное выполнение
            humanHP = humanHP + charValue()
            resourceHP = resourceHP + charValue()
			p[["Ты смог поймать всех стасиков, но..."

            Душа бывшего студента, который когда-то жил в общаге подсказывает, что тараканов можно приготовить. Зачем пропадать такому ценному белку? Ты представил какие блюда можно приготовить... Хрустящие тараканьи крылышки с азиатскими специями, тараканьи мясные шарики в томатном соусе, зажаренные тараканы на гриле с медово-горчичным глазурью, тараканьи фрикадельки в карамелизованном луковом соусе, французский багет с обжаренными тараканьими крошками и чесночным маслом, тараканьи ножки в кокосовой панировке с манго-ананасовым соусом, тараканьи кексы с шоколадным ганашем и малиновым кули... Экипаж доволен новым блююдам. Возможно им не стоит знать из чего это готовится."]];
        elseif diceRoll > 10 then
			p("Ты включил музыку в отсеке для сброса мусора. Все тараканы сползлись туда и утроили там тусовку под звуки (татарстан супер гуд). После нажатия на рычаг створки шлюза открылись и вся колония стасиков отправилась в открытый космос. Надеюсь мы их больше не увидим.")
        else
            resourceHP = resourceHP + charValue() - 20
            p("Тараканы начали есть продукты, словно голодный Андрей после сна. Ты ничего не можешь с этим поделать")
        end
        currentTask.completed = true
        goal = 'Вернуться в криокапсулу'
		-- Удаление кнопки
		s:disable()
    end;
}

obj {
    nam = 'task_6',
    dsc = 'Ты видишь странные {коконы}',
    act = function(s)
        -- Логика выполнения задания
        local diceRoll = math.random(20)
        if diceRoll > 18 then
            -- Успешное выполнение
            humanHP = humanHP + charValue()
            resourceHP = resourceHP + charValue()
			p[["А что если их приготовить?..."

            Ты вспомнил, что когда-то ты был прекрасным поваром. Ты вспоминаешь студенческие годы, когда живя в общаге тебе приходилось готовить из всего, что попадется под руку.
       Ты осторожно разбиваешь яйцо, сохраняя целость фейсхаггера, и размешиваешь его вилкой, чтобы смешать желток и белок. Затем он разогреваешь сковороду, которыю невозможно прожечь кислотой (ты не помниь где ты её купил, но на ручке мелкими буквами написано made in USSR). Добавляешь небольшое количество сливочного масла, и аккуратно выкладываешь яйцо и мясо фейсхагера на сковороду.
Слегка шипя, мясо начинает образовывать золотистую корочку вокруг себя. Ты приправляешь яйцо и мясо свежими травами и специями, чтобы добавить аромат и вкус.
Когда блюдо достигает идеальной степени готовности, ты аккуратно переносишь его на стильную футуристичную тарелку с ~~LGBT~~ RGB подсветкой. Ты решил украсить блюдо свежими травами и добавляешь небольшое количество декоративных элементов, чтобы подчеркнуть его уникальность и оригинальность.
В результате, яйцо готово к подаче. Оно представляет собой удивительное блюдо, сочетающее в себе нежность яйца, золотистую корочку мяса фейсхаггера и аромат свежих трав. Готовое яйцо чужого с фейсхаггером становится привлекательным и аппетитным произведением кулинарного искусства, готовым принести наслаждение космонавту, который изголодался по домашней еде."]];
        elseif diceRoll > 10 then
			p("Ничего необычного, просто фейсхаггер в своем коконе. Мог бы быть интересным подарком для коллеги, если бы не кислота. Хотя... Если не заглядывать во внутрь, то не представляет опасности. На на всякий случай все коконы были выброшены в космос. ")
        else
            humanHP = humanHP - 100
            rocketHP = rocketHP - 100
            p("Створки кокона приотрылись как только ты подошел к нему. Внутри кокона видна пульсация, оно живое. Ты заглянул во внутрь кокона (Великолепный план, надежный как швейцарские часы!). Всё произошло слишком быстро, что-то прыгнуло тебе на лицо прямо из кокона.")
        end
        currentTask.completed = true
        goal = 'Вернуться в криокапсулу'
		-- Удаление кнопки
		s:disable()
    end;
}