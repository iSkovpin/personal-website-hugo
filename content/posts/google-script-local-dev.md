+++ 
date = "2020-11-18"
title = "Локальная разработка Google Apps Script в IntelliJ IDEA (PHPStorm)"
slug = "lokalnaya-razrabotka-google-apps-script" 
tags = ["Google Apps Script", "IDEA"]
categories = ["development", "JavaScript"]
+++

### Что за Google Apps Script?

[Google Apps Script](https://developers.google.com/apps-script) - это платформа для написания веб-приложений, основной 
фичей которых является возможность тесной интеграции с сервисами Google. Такими как Gmail, Sheets, Docs, Calendar и другими.

Я расскажу о том, как разрабатывать Google Apps Script комфортно на локальной машине, используя IntelliJ IDEA (PHPStorm) и 
его подсказки, а так же как пушить свои изменения обратно на сервера Google.

### Предварительно нам понадобятся:

* node
* npm
* Существующий проект Google Apps Script
* IDE от JetBrains (я использую PHPStorm)

### Синтаксис языка

Сам язык на котором пишется Google Apps Script по сути является расширенной версией JavaScript. На текущий момент 
поддерживается [ECMAScript® 2021 Language Specification](https://tc39.es/ecma262/), а для исполнения кода используется 
движок [V8](https://v8.dev/). Так что можно использовать классы, стрелочные функции и прочие модные штуки без компиляции
с Babel.

#### Веб-редактор

Google предоставляет веб-редактор для разработки кода Google Apps Script. Он умеет подсказывать названия методов 
у встроенных классов и подсвечивать имена переменных. Но на этом всё. Пока у вас всего один, файл веб-редактор вполне
юзабелен, но как только проект разрастается на 5-10 файлов, разработка в браузере заставляет вас страдать.

![alt text](https://i.imgur.com/bjPSYTR.png)

### Перенос разработки на локальную машину

К счастью, Google предоставляет так же консольную утилиту для локальной разработки, синхронизации и деплоя Google Apps 
Script приложений: [Clasp (Command Line Apps Script Projects)](https://github.com/google/clasp).

Устанавливаем clasp глобально с помощью npm

```sh
npm install -g @google/clasp
```

Затем включаем Google Apps Script API тут: https://script.google.com/home/usersettings

![alt text](https://i.imgur.com/6LbJbdy.png)

Логинимся через clasp и даём ему все необходимые права

```sh
clasp login
```

Теперь нужно скопировать id вашего скрипта из веб-редактора (Файл > Свойства проекта > Идентификатор скрипта) 

![alt text](https://i.imgur.com/Lsp77Ix.png)

![alt text](https://i.imgur.com/VrXT5vb.png)


Затем выполнить из папки, в которую хотите скопировать проект, команду для клонирования. Забегая вперёд, рекомендую создать 
внутри вашего проекта папку ```src``` , непосредственно в которую уже клонировать проект.

```sh
cd /your/project/directory
mkdir src
cd src
clasp clone <scriptId>
```

Теперь у нас есть папка со всем файлами проекта. Отлично. Но пока IDE не сможет подсказать нам имена встроенных классов
и их методы.

### Добавляем подсказки в IDE 

Чтобы обучить IDE подсказывать нам внутренности встроенных классов, необходимо подтянуть npm пакет с интерфейсами Google Apps Script.

Создадим в основной директории проекта файл ```package.json``` с примерно следующим содержанием:

```json
{
  "name": "google-apps-script-type-hinting",
  "description": "Type-hinting for Google Apps Script development in IntelliJ IDEA",
  "author": {
    "name": "Your name",
    "email": "your@mail.com"
  },
  "devDependencies": {
    "@types/google-apps-script": "^1.0.17"
  }
}
```

И подтянем пакет с интерфейсами
```sh
npm install --save-dev
```

### Настройки для git

Если собираетесь хранить свой проект дополнительно во внешнем git репозитории, то не забудьте добавить в файл ```.gitignore```
папку ```node_modules``` и файл ```src/.clasp.json``` (если не хотите сохранять ключ своего проекта в репозитории).

Содержимое файла ```.gitignore```:

```gitignore
.idea/
src/.clasp.json
node_modules/
```

### Profit

Теперь можно подтягивать файлы проекта и отправлять их обратно с помощью команд
```sh
cd src
clasp pull
clasp push
```

А IDE будет подсказывать вам имена классов и методов Google Apps Script. Только не забывайте указывать полные 
неймспейсы классов в JSDoc.

![alt text](https://i.imgur.com/l3UlYLP.png)


