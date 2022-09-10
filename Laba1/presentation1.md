---
# Front matter
title: "Лабораторная работа 1"
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
##### ПРЕЗЕНТАЦИЯ ПО ЛАБОРАТОРНОЙ РАБОТЕ №1

дисциплина: Информационная безопасность

Преподователь: Кулябов Дмитрий Сергеевич

Cтудент: Щепелева Марина Евгеньевна

Группа: НФИбд-01-19

МОСКВА

2022 г.

# **Прагматика выполнения лабораторной работы**

- установка Rocky
- анализ загрузки системы

# **Цель работы**

Проанализировать последовательность загрузки системы.

# **Выполнение лабораторной работы**

# 1. Версия ядра Linux (Linux version)

Версия оказалась Linux 5.14.0

![Версия Linux](images/2.png "Версия Linux")

# 2. Частота процессора (Detected Mhz processor)

Получила частоту процессора 1800 мега герц.

![Частота процессора](images/3.png "Частота процессора")

# 3. Модель процессора (CPU0)

Процессор - Intel Core i5-5350U

![Модель процессора](images/4.png "Модель процессора")

# 4. Объем доступной оперативной памяти (Memory available)

Как можно заметить, памяти 260860/2096696 Кб. То есть выделено 2 Гб оперативной памяти.

![Объем доступной оперативной памяти](images/5.png "Объем доступной оперативной памяти")

# 5. Тип обнаруженного гипервизора (Hypervisor detected)

Hypervisor detected: KVM

![Гипервизор](images/6.png "Гипервизор")

# 6. Тип файловой системы корневого раздела

Для нашего диска, а именно sda1, тип файловой системы XFS.

![Тип файловой системы](images/7.png "Тип файловой системы")

# 7. Последовательность монтирования файловых систем

Сначала монтируется Huge Pages FS, POSIX Message Queue FS, Kernel Debug FS, Kernel Trace FS и наконец Root and Kernel FS

![Последовательность монтирования файловых систем](images/8.png "Последовательность монтирования файловых систем")

# Выводы

Выполнив данную лабораторную работу, я установила Rocky на виртуальную машину, а также изучила последовательность загрузки операционной системы, выполнив команду dmesg.