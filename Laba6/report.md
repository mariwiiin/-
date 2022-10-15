---
title: "Лабораторная работа №6"
author: "Щепелева М. Е. группа НФИ-01-19"
subtitle: "Мандатное разграничение прав в Linux"
output:
  word_document: default
  pdf_document: default
toc-title: Содержание
toc: yes
toc_depth: 2
lof: yes
fontsize: 12pt
linestretch: 1.5
papersize: a4paper
documentclass: scrreprt
polyglossia-lang: russian
polyglossia-otherlangs: english
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase
indent: yes
pdf-engine: lualatex
header-includes:
- \linepenalty=10
- \interlinepenalty=0
- \hyphenpenalty=50
- \exhyphenpenalty=50
- \binoppenalty=700
- \relpenalty=500
- \clubpenalty=150
- \widowpenalty=150
- \displaywidowpenalty=50
- \brokenpenalty=100
- \predisplaypenalty=10000
- \postdisplaypenalty=0
- \floatingpenalty = 20000
- \raggedbottom
- \usepackage{float}
- \floatplacement{figure}{H}
---


# Цель работы

Целью данной лабораторной работы является развить навыки администрирования ОС Linux. Получить первое практическое знакомство с технологией SELinux1. Проверить работу SELinx на практике совместно с веб-сервером
Apache.

# Подготовка лабораторного стенда и методические рекомендации

1. Установили веб-сервер Apache.
   

2. В конфигурационном файле /etc/httpd/httpd.conf задали параметр ServerName. 
   

3. Отключаем пакетный фильтр.

# Выполнение лабораторной работы

1. Входим в систему с полученными учётными данными. Проверили, что SELinux работает в режиме enforcing политики targeted с помощью команд **getenforce** и **sestatus**. (@fig:004)
   
![Выполнение команд getenforce и sestatus](img/1.png){#fig:004 width=100%}

2. Запустили веб-сервер и обратились к нему с помощью команды (@fig:005):
service httpd status 
   
![Выполнение команды service httpd  status](img/2.png){#fig:005 width=100%}

3. Нашли веб-сервер Apache в списке процессов. Контекст безопасности - unconfined_u:unconfined_r:unconfined_t. (@fig:006)
   
![Выполнение команды ps auxZ | grep httpd](img/3.png){#fig:006 width=100%}

4. Посмотрели текущее состояние переключателей SELinux для Apache с помощью команды **sestatus -b | grep httpd**. (@fig:007)
   
![Выполнение команды sestatus -b | grep httpd](img/4.png){#fig:007 width=100%}

5. Посмотрели статистику по политике с помощью команды **seinfo**. Определили, что множество пользователей = 8; ролей = 14; типов = 5002. (@fig:008)
   
![Статистика по политике](img/5.png){#fig:008 width=100%}

6. Определили тип файлов и поддиректорий, находящихся в директории /var/www, с помощью команды **ls -lZ /var/www**. (@fig:009)
   
![Выполнение команды ls -lZ /var/www](img/6.png){#fig:009 width=100%}

7. Необходимо было определить тип файлов, находящихся в директории /var/www/html, с помощью команды **ls -lZ /var/www/html**. Но в данной директории файлов не обнаружилось. (@fig:010)
   
![Выполнение команды ls -lZ /var/www/html](img/7.png){#fig:010 width=100%}

8. Определим круг пользователей, которым разрешено создание файлов в директории /var/www/html - только uesr. (@fig:011)
   
![Выполнение команды ls -lZ /var/www](img/6.png){#fig:011 width=100%}

9. Создали от имени суперпользователя html-файл /var/www/html/test.html следующего содержания: (@fig:012)
   
![Содержимое файла test.html](img/9.png){#fig:012 width=100%}

10. Проверили контекст созданного файла - httpd_sys_content_t. (@fig:013)
   
![Контекст файла test.html](img/10.png){#fig:013 width=100%}

11.  Обратитились к файлу через веб-сервер, введя в браузере адрес http://127.0.0.1/test.html и убедились, что файл был успешно отображён. (@fig:014)
   
![Обращение к файлу test.html через веб-сервер](img/11.png){#fig:014 width=100%}

12.   Изучили справку man httpd_selinux. Тип файла test.html - контекст созданного файла - httpd_sys_content_t. (@fig:015)
   
![Контекст файла test.html](img/10.png){#fig:015 width=100%}

13.  Изменили контекст файла /var/www/html/test.html с httpd_sys_content_t на samba_share_t:
chcon -t samba_share_t /var/www/html/test.html
ls -Z /var/www/html/test.html
И проверили, что контекст поменялся. (@fig:016)
   
![Изменение контекста файла /var/www/html/test.html](img/13.png){#fig:016 width=100%}

14. Пробуем ещё раз получить доступ к файлу через веб-сервер, введя в браузере адрес http://127.0.0.1/test.html. В результате получили ошибку. (@fig:017)
   
![Обращение к файлу test.html через веб-сервер после изменения контекста](img/14.png){#fig:017 width=100%}

15.  Проанализируем ситуацию. Почему файл не был отображён, если права доступа позволяют читать этот файл любому пользователю?
ls -l /var/www/html/test.html
Просмотрим log-файлы веб-сервера Apache и системный лог-файл:
tail /var/log/messages
В системе оказались запущенны процессы **setroubleshootd** и **audtd**. (@fig:018)
   
![Вывод команд ls -l /var/www/html/test.html и tail /var/log/messages](img/15.png){#fig:018 width=100%}

16. Попробуем запустить веб-сервер Apache на прослушивание ТСР-порта 81. Для этого в файле /etc/httpd/httpd.conf находим строчку Listen 80 и заменяем её на Listen 81. (@fig:019)
   
![Запуск веб-сервера Apache на прослушивание ТСР-порта 81](img/16.png){#fig:019 width=100%}
 
17. Выполним перезапуск веб-сервера Apache. Произошёл сбой? Нет. 
18. Проанализируем лог-файлы:
tail -nl /var/log/messages
Просмотрим файлы /var/log/http/error_log,
/var/log/http/access_log и /var/log/audit/audit.log. (@fig:020)
   
![Перезапуск веб-сервера Apache](img/17.png){#fig:020 width=100%}

19. Выполним команду **semanage port -a -t http_port_t -р tcp 81**. Вылетает ValueError в связи с тем, что порт уже определен. После этого проверим список портов командой **semanage port -l | grep http_port_t** и убедились, что порт 81 появился в списке. (@fig:021)
   
![Проверка установления 81 порта tcp](img/19.png){#fig:021 width=100%}

20. Попробуем запустить веб-сервер Apache ещё раз. (@fig:022)
   
![Перезапуск веб-сервера Apache](img/20.png){#fig:022 width=100%}
  
21. Вернули контекст httpd_sys_cоntent__t к файлу /var/www/html/test.html: **chcon -t httpd_sys_content_t /var/www/html/test.html** (@fig:023)
   
![Возвращение контекста httpd_sys_cоntent__t к файлу test.html](img/21.png){#fig:023 width=100%}

После этого пробуем получить доступ к файлу через веб-сервер, введя в браузере адрес http://127.0.0.1:81/test.html. В результате увидели содержимое файла — слово «test». (@fig:024)
   
![Обращение к файлу test.html через веб-сервер](img/21.2.png){#fig:024 width=100%}

22. Исправим обратно конфигурационный файл apache, вернув Listen 80. (@fig:025)
   
![Исправление конфигурационного файла apache](img/22.png){#fig:025 width=100%}

23. Удалим привязку http_port_t к 81 порту: **semanage port -d -t http_port_t -p tcp 81** и проверим, что порт 81 удалён. Данная команда не была выполнена. (@fig:026)
   
![Удаление привязки http_port_t к 81 порту](img/23.png){#fig:026 width=100%}

24.  Удалим файл /var/www/html/test.html: **rm /var/www/html/test.html**. (@fig:027)
   
![Удаление файла test.html](img/24.png){#fig:027 width=100%}

# Вывод

В ходе выполнения лабораторной работы мы развили навыки администрирования ОС Linux. Получили первое практическое знакомство с технологией SELinux1. Проверили работу SELinx на практике совместно с веб-сервером
Apache.

# Библиография

1. Кулябов Д. С., Королькова А. В., Геворкян М. Н. Мандатное разграничение прав в Linux [Текст] / Кулябов Д. С., Королькова А. В., Геворкян М. Н. - Москва: - 5 с. [^1]: Мандатное разграничение прав в Linux. 
2. Справочник 70 основных команд Linux: полное описание с примерами (https://eternalhost.net/blog/sozdanie-saytov/osnovnye-komandy-linux)
  