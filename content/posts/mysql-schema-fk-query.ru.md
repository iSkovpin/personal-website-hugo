+++ 
date = "2021-06-28"
title = "Как получить список всех внешних ключей в MySQL"
slug = "mysql-schema-fk-list-query" 
tags = ["SQL", "MySQL"]
categories = ["development"]
+++

Данный SQL-запрос выводит в наглядной форме внешние ключи для БД MySQL.

```mysql
SELECT CONCAT(fks.CONSTRAINT_SCHEMA, '.', fks.TABLE_NAME) AS foreign_table,
       '->'                                               AS rel,
       CONCAT(fks.UNIQUE_CONSTRAINT_SCHEMA, '.', fks.REFERENCED_TABLE_NAME)
                                                          AS primary_table,
       fks.CONSTRAINT_NAME,
       GROUP_CONCAT(kcu.COLUMN_NAME
                    ORDER BY POSITION_IN_UNIQUE_CONSTRAINT SEPARATOR ', ')
                                                          AS fk_columns
FROM information_schema.REFERENTIAL_CONSTRAINTS fks
         JOIN information_schema.KEY_COLUMN_USAGE kcu
              ON fks.CONSTRAINT_SCHEMA = kcu.TABLE_SCHEMA
                  AND fks.TABLE_NAME = kcu.TABLE_NAME
                  AND fks.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
WHERE fks.CONSTRAINT_SCHEMA = 'schema1'         # Схема с внешними ключами
#   AND kcu.TABLE_NAME = 'table1'               # Таблица с внешними ключами
#   AND kcu.REFERENCED_TABLE_SCHEMA = 'schema2' # Схема на таблицы которой ссылаются внешние ключи
#   AND kcu.REFERENCED_TABLE_NAME = 'table2'    # Таблица на которую ссылаются внешние ключи
GROUP BY fks.CONSTRAINT_SCHEMA,
         fks.TABLE_NAME,
         fks.UNIQUE_CONSTRAINT_SCHEMA,
         fks.REFERENCED_TABLE_NAME,
         fks.CONSTRAINT_NAME
ORDER BY fks.CONSTRAINT_SCHEMA,
         fks.TABLE_NAME;
```
