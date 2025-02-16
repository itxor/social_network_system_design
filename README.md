### Social Network 

#### Вводные

- публикация постов из путешествий с фотографиями, небольшим описанием и привязкой к конкретному месту путешествия;
- оценка и комментарии постов других путешественников;
- подписка на других путешественников, чтобы следить за их активностью;
- поиск популярных мест для путешествий и просмотр постов с этих мест;
- просмотр ленты других путешественников и ленты пользователя, основанной на подписках в обратном хронологическом порядке;

Что касается будущей аудитории социальной сети - у бизнеса есть огромные средства для рекламы и продвижения социальной сети, поэтому пользовательская база будет постепенно линейно расти и предполагается, что через год достигнет примерно 10 000 000 уникальных пользователей в день, после чего также будет продолжать расти. Бизнес пока нацелен только на аудиторию стран СНГ (_на зарубежный рынок выходить планов нет_). Будущая система должна быть очень надежной, а также, чтобы с ней было удобно взаимодействовать, используя мобильные устройства и браузер.

#### Функциональные требования

- Посты:
    - Пользователь может прикреплять более 1 фотки к посту (5 - максимум)
    - У каждого может быть геолокация так же, как это сейчас выглядит в Instagram: сверху над постом указывается название гео-объекта (страна, город, любая известная гео-область, или конкретный объект)
- Язык приложения
    - Только русский, так как расчет только на страны СНГ
- Можно ли отключить комментарии к посту?
    - Нет
- Лента бесконечная? 
    - Да
- Видит ли пользователь какую-либо статистику, кроме количество подписчиков и подписок?
    - Нет, дополнительной статистики нет
- Нужно ли что-то показывать в ленте, когда все публикации со всех подписок закончились?
    - Нет
- Количество подписок неограничено?
    - Да
- Кто может оценивать (лайкать) посты?
    - Только подписчики
- Как происходит поиск популярных мест?
    - Будет представлен в виде отдельной страницы со строкой поиска. Строка выводит найденные объекты по соответствию введенного запроса в текстовом виде, без координат. При переходе на найденный объект - отображаются самые популярные посты по этому объекту в виде ленты.
#### Нефункциональные требования

##### Аудитория
- **Количество пользователей**
	- Какое количество пользователей (DAU) ожидается?
		- Ожидается 10.000.000 DAU через год
	- Как будет расти ожидаемое количество пользователей?
		- Ожидается двухкратный рост ежегодно
- **Поведение пользователей**
	- Сколько пользователь, в среднем, публикует постов?
		- В среднем 1 пост в неделю
	- Среднее количество фоток в посте?
		- 2 фотки
	- Сколько пользователь, в среднем, обновляет ленту приложения?
		- В среднем 5 раз в день
	- Сколько пользователь, в среднем, пишет комментариев?
		- В среднем 1 комментарий в день
	- Сколько пользователь, в среднем, добавляет реакций?
		- В среднем 5 в день
	- Сколько пользователь, в среднем, ищет популярные места?
		- В среднем 2 раза в месяц
	- Сколько в среднем постов пользователь просматривает в ленте (и подписки, и популярные места)?
		- В среднем 10 постов за раз
	- Сколько в среднем под постом комментариев?
		- В среднем 3 комментария
	- Сколько пользователь, в среднем, делает подписок?
		- В среднем 2 подписки в неделю
- **Регионы использования приложения**
	- Какая аудитория и на каких пользователей рассчитано приложение?
		- Аудитория стран СНГ
##### Особенности приложения
- **Сезонность**
	- Есть, для стран СНГ основной сезон путешествий - лето
- **Условия хранения данных**
	- Данные храним всегда?
		- Да, данные хранятся всегда
- **Лимиты**
	- Какое максимальное количество подписчиков может быть у пользователя?
		- 1.000.000
	- Сколько фотографий пользователь может добавить к публикации?
		- Максимум - 5
	- Сколько реакций может быть на посте?
		- Максимум - 3
	- Какой может быть размер описания?
		- Не более 1000 символов
	- Какая может быть длина комментария?
		- Не более 250 символов
	- Какой максимальный размер фотографии?
		- 3Mb (сжатие, при необходимости, происходит на клиенте)
	- Есть ли ограничения на количество комментариев к посту?
		- Нет
- **Временные ограничения**
	- Лента должна загружаться не более чем за 2 секунды
	- Загрузка поста на сервер - не более 5-ти секунд для LTE/Wifi-соединения (учитывая максимальное количество фотографий)
	- Добавление комментарий - не более 1 секунды
	- Загрузка популярных мест по геолокации - не более 3-х секунд
- **Доступность приложения**
	- Сколько по времени приложение может быть недоступно за год?
		- Не более 2-х часов
#### Нагрузка
##### Посты
###### RPS
```
dau * avg_requests_per_day_by_user / 86400
```

- write - добавление постов в базу
	- 10.000.000 (DAU) * 0.15 (1 пост в неделю = 0.15 поста в день) = 1.500.000 / (24 * 60 * 60) = 1.500.000 / 86400 = ~17 RPS (write)
- read - просмотры ленты (подписки + популярные места)
	- 10.000.000 * (10 + 2) / 86400 = 120.000.000 / 86400 = 1400 RPS (read)
- вывод: read-intensive приложение
###### Traffic
```
rps * avg_request_size
```
- **Post for write**:
```
- id (uuid, 36 символов, 36 байт)
- description (text, в среднем 250 символов (1-4 байта), в среднем 250 * 1.5 = 375)
- latitude (text, в среднем 9 байт)
- longitude (text, в среднем 9 байт)
- created_at (text, в среднем 19 байт)
- user_id (uuid, 36 байт)
- []string (массив фотографий (base64 от массива байт), размер одной фотографии в среднем 1.5Mb; в среднем по 2 фотографии на пост; общий размер в среднем - 3mb = ~3.000.000 байт)
```
- **Traffic (write)** = 17 RPS * ~3.500.000 B = 59.500.000 B/s = 58.000 kb/s = 56 Mb/s

- **Post for read**:
```
- id (uuid, 36 символов, 36 байт)
- description (text, в среднем 250 символов (1-4 байта), в среднем 250 * 1.5 = 375)
- latitude (text, в среднем 9 байт)
- longitude (text, в среднем 9 байт)
- created_at (text, в среднем 19 байт)
- user_id (uuid, 36 байт)
- []photos (массив url фотографий, в среднем 100 символов для 1 url, в среднем 2 ссылки в одном пакете = ~200b)
- []reactions (emodji + count, в среднем 5 байт, в среднем 2 элемента в массиве = 10 байт)
```
- **Traffic (read)** = 1400 RPS * ~700 B = ~980.000 B/s = ~957 kb/s
##### Реакции
###### RPS
```
dau * avg_requests_per_day_by_user / 86400
```

- write
	- 10.000.000 (DAU) * 5 (в среднем реакций в день) = 50.000.000 / 86400 = ~587 RPS (write)
- read: нет, так как реакции отдаются вместе с постом и отдельных запросов на их чтение не предполагается
###### Traffic
```
rps * avg_request_size
```

- **Reaction**:
	- id (36 байт)
	- emoji (5 байт)
	- post_id (36 байт)
	- user_id (36 байт)
	- created_at (text, в среднем 19 байт)
- **Traffic (write)** = 587 RPS * ~132 B = 77.484 B/s = ~77 kb/s

##### Комментарии
###### RPS
```
dau * avg_requests_per_day_by_user / 86400
```

- write (добавление комментариев под поставми)
	- 10.000.000 (DAU) * 1 = 10.000.000 / 86400 = ~115 RPS (write)
- read
	- 10.000.000 * 12 (в среднем постов в день) * 3 (в среднем комментариев под постом) / 86400 = 360.000.000 / 86400 = 4166 RPS (read)
- вывод: read-intensive приложение
###### Traffic
```
rps * avg_request_size
```
- **Comment (read/write)**:
	- id (36)
	- post_id (36)
	- text (~125)
	- created_at (19)
	- user_id (36)
- **Traffic (write)** = 115 RPS * 252 B = 28.980 B/s = ~29 kb/s
- **Traffic (read)** = 4166 RPS * 252 B = ~1.000.000 B/s = 1.000 kb/s = ~1Mb/s

##### Подписки
###### RPS
`dau * avg_requests_per_day_by_user / 86400`
- write (добавление комментариев под поставми)
	- 10.000.000 (DAU) * 0.3 (в среднем подписок в день) = 3.000.000 / 86400 = ~34 RPS (write)
- read: нет, так как частота просмотра подписок слишком мала
- вывод: read-intensive приложение
###### Traffic
```
rps * avg_request_size
```
- **Subscription**:
	- id (36)
	- user_id (36)
	- related_user_id (36)
	- created_at (19)
- **Traffic (write)** = 34 RPS * ~140 B = 4760 B/s = ~4.7 kb/s
