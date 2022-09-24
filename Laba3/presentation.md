---
# Front matter
title: "Лабораторная работа 3"
author: "Щепелева Марина Евгеньевна, НФИбд-01-19"

# Generic otions
lang: ru-RU
toc-title: "Содержание"

# Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

### Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Misc options
indent: true
header-includes:
  - \linepenalty=10 # the penalty added to the badness of each line within a paragraph (no associated penalty node) Increasing the value makes tex try to have fewer lines in the paragraph.
  - \interlinepenalty=0 # value of the penalty (node) added after each line of a paragraph.
  - \hyphenpenalty=50 # the penalty for line breaking at an automatically inserted hyphen
  - \exhyphenpenalty=50 # the penalty for line breaking at an explicit hyphen
  - \binoppenalty=700 # the penalty for breaking a line at a binary operator
  - \relpenalty=500 # the penalty for breaking a line at a relation
  - \clubpenalty=150 # extra penalty for breaking after first line of a paragraph
  - \widowpenalty=150 # extra penalty for breaking before last line of a paragraph
  - \displaywidowpenalty=50 # extra penalty for breaking before last line before a display math
  - \brokenpenalty=100 # extra penalty for page breaking after a hyphenated line
  - \predisplaypenalty=10000 # penalty for breaking before a display
  - \postdisplaypenalty=0 # penalty for breaking after a display
  - \floatingpenalty = 20000 # penalty for splitting an insertion (can only be split footnote in standard LaTeX)
  - \raggedbottom # or \flushbottom
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

##### РОССИЙСКИЙ УНИВЕРСИТЕТ ДРУЖБЫ НАРОДОВ
##### Факультет физико-математических и естественных наук  
##### Кафедра прикладной информатики и теории вероятностей 
##### ПРЕЗЕНТАЦИЯ ПО ЛАБОРАТОРНОЙ РАБОТЕ №3

дисциплина: Информационная безопасность

Преподователь: Кулябов Дмитрий Сергеевич

Cтудент: Щепелева Марина Евгеньевна

Группа: НФИбд-01-19

МОСКВА

2022 г.

# **Прагматика выполнения лабораторной работы**

- создание новых пользователей и получение информации о них
- ознакомление с правами на файлы и каталоги для групп пользователей

# **Цель работы**

Получение практических навыков работы в консоли с атрибутами файлов для групп пользователей.

# **Выполнение лабораторной работы**

# 1. Создание пользователя и добавление в группу

![create user](screenshots/1.png "create user")

![add in group](screenshots/2.png "add in group")

# 2. Вход в систему от двух пользователей

![login1](screenshots/3.png "login1")

# 3. Информация о пользователях

![info1](screenshots/7.png "info1")

![info2](screenshots/8.png "info2")

# 4. Содержимое файла /etc/group

![/etc/group](screenshots/9.png "/etc/group")

# 5. Регистрация пользователя guest2 в группе guest

![newgrp](screenshots/10.png "newgrp")

# 6. Изменение прав директорий

![chmod g+rwx](screenshots/11.png "chmod g+rwx")

![chmod 000](screenshots/12.png "chmod 000")

# 7. Права на файлы и каталоги (1)

![excel1](screenshots/13.png "excel1")

# 8. Права на файлы и каталоги (2)

![excel2](screenshots/14.png "excel2")

# 9. Минимальные требования

![min requirments](screenshots/15.png "min requirments")

# Выводы

Выполнив данную лабораторную работу, я создала второго нового пользователя, получила практические навыки работы в консоли с атрибутами файлов для групп пользователей.
