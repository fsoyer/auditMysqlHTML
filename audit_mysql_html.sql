-- AUDIT BASES MYSQL
-- (c) 2013, Frank Soyer <frank.soyer@gmail.com>

-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- The GNU General Public License is available at:
-- http://www.gnu.org/copyleft/gpl.html

SET @script_version := 'v2.2';
-- Compatible with MySQL 5.0.6 to 5.7.5 an MariaDB (INFORMATION_SCHEMA.global_status) and MySQL >= 5.7.6 and 8 ( global_variables and global_status tables moved to PERFORMANCE_SCHEMA)


-- ================================================= SCRIPT D'AUDIT =========================================

SET @tips := 'iVBORw0KGgoAAAANSUhEUgAAABMAAAATCAYAAAByUDbMAAAABmJLR0QAAAAAAAD5Q7t/AAAACXBIWXMAAAsQAAALEAGtI711AAAACXZwQWcAAAATAAAAEwDxf4yuAAACDElEQVQ4y62ULXDbQBBGnzsFK2YxHzyoMJk50NBhCWugYcpCA0PDEmjosphF0DBmEqvgwSs7MS1TgSz5v9OZdmd2NKNZvfv20+4Nmqbhf8XXcy9L5xpfFpTlGlfmaPiFxCNsMiZJppgkJbF2cPzd4FjZZrNpPpZPRHySJoIxYIzgveIc5KWCXHNz/8xkMhlchGWrH81qMWd+L6SpgOxVKug281xZZcrtw4LZ7FsP7Ntcr7MmW855fhoyHIFE0WEPEVDXiMJ4LJgY3t7mxLFtOoVfOo9Wi+88zOUENDCuT4kiEBABM4LZVHhfPFI61/QwV6yxxmOtnIB8qPvsgCIgkXCdQFwXuGJDDyvyjOvxoUcdaD86IEJfm15BkX/sYL4ssFa4FCY+8k+3T4F4CN7tKQsakMusy6Gtf1qFHSyWGA26OxFovD1RZOKIxtsDdaogw3gHM0nKT7edo7o+C+xAWtfbOiUoeA/GTnawdDyjKLbKjoAHXdV1P7woEJTSQTq+2cFsOsV5Q+mUqgKtQEN9AtUKqqqFhKoFhSjFpnvKEmsHtw+vLJeKd4oGbYEVhHwEQPgctb5uQZWHrIC7+Uu/9Gd3czZtB7L7/Z3ZYa+1bAO3j4e7efbWeF88EtcF6VW7NhJBFVqzu9bu5i9/vjW6KJ1rXLGhyD/w5YaggVhiTDIhHd9g08nf3Wf/Er8BAI4wKLDf6EwAAAAfelRYdENyZWF0aW9uIFRpbWUAAHjaMzDTNzLUNzABAAb7AYwMyT+gAAAALnpUWHRTb2Z0d2FyZQAAeNrzTUwuys9NTclMVHDLLEotzy/KLlbwjVAwMjAwAQCWLgl6ZrFa0gAAAABJRU5ErkJggg==';
SET @info := 'R0lGODlhFAAUAOfAAD+JSDyVQEqTTFqTZkedQ0eeQ1CjRVKlRmScdWaccGibdVepRmSlUVqqSV2pUlytSG6jfXWjf2OxTGayS2SzSW+ueXGxVmqzWXGyb2y3TW22Vm64TnC6TXC7T3y2YX+2bXq2fna+UHu5c323gom2b3e/Unm+W3q+X328cHnBUYS8Y3rBUZ+uooe5fIO8gn3EUoHAb4W+f4DDYYPBbn/FU6OyqITBcX/GUYDGU4LEYZK+coHHVILIU4jCgI7DZYfEcZK/i6q2pYvDgae3qZXCdIPLUqi3rIrHaofJYo/EfYvHco7FgZDDkIrKXojMVYjNVYnNVZHIgpTGkZXGkYzPVqe/r7O9qZjIko/RV6DJd7O/rJrKk5vPYJzKlZTSYJPUV5PVVpPVV5/KpLLDsqPJppPWVp/MmpXWWLPEsrnDraHMpKLNo6LNpKTOpaXPpbfItp3ZYqrOs6fRornKtqnQsZ3dWq/Qr5/eWqrYeaLdZarbZLDSr6/Ss6/SubDSuMHMxcXLxbHTtaPhWsbMxbLVrLLUtsLOxbLVtrPVtqved7nXoLXWvrnVvbnXu7ranM3Rx8nUt8rSysvSyb3cn8/TyMvWuK/mbL3dna7rW8bfy9zX3sjgzd3Z4cnhzcnhzt3a4d7a4bvzYOLe47/3X+Tg5dbqw+fi5dDvq+Tk5Ojj5+Xl5cb8Y+bm5unl6Nnr3url6tvr4Orp6+7p7O7q7ezr7ezs7O7t7u7u7ubx6Ojy6vDw8PHx8fH38/f29/f5+Pr7+////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////yH+EUNyZWF0ZWQgd2l0aCBHSU1QACH5BAEKAP8ALAAAAAAUABQAAAj+AP8JHEiwoMGDCBMKlPWnShVDsxQK1FUDQR9XsBZBMLIroSkFcTZ54pUrUyc/EVodrDWATiA+uIABY4So0KEEtwyyqCBGzZpGwHyRcdOGzYghvQimAgCCiRQzcvbY6bLlyhQXAl4RBBQAQ4wehH7JBBJliRARBSIRHEPAAQoYM5LIbKHkh40LB94QRGOggYYTMo7I/IAkh4kJD+YQHLRAwoYSNJrI9PBkx4oOFCQRFMUgQwgcULzIVBGGCo8UFkgVDMLhhZMvcGT6uHOGyg0ttgqqIlEES55TMktZqlOGCKuDmnSASaTI0aVJeARlAZUQlRUumEKtGqUnDSqJtDgNPYJUidKnWBLTq1cYEAA7';

-- set table name for global_variables and global_status by version
-- < 5.6.7 : INFORMATION_SCHEMA
-- >= 5.6.7 : PERFORMANCE_SCHEMA
-- then in script, use "SET", "PREPARE" and "EXECUTE" to format sql string with this variable before executing it
SET @tblname = IF (SUBSTRING_INDEX(@@VERSION , '.' , 1) >= 8, 
  'PERFORMANCE_SCHEMA', 
  IF (SUBSTRING(@@VERSION , LOCATE( '.' , @@VERSION )+1 , LOCATE( '.' , @@VERSION )-1 ) < 7,
    'INFORMATION_SCHEMA',
    IF (SUBSTRING(@@VERSION , LOCATE( '.' , @@VERSION )+1 , LOCATE( '.' , @@VERSION )-1 ) = 7,
--      IF (SUBSTRING_INDEX(@@VERSION , '.' , -1) >= 6 ,'PERFORMANCE_SCHEMA', 'INFORMATION_SCHEMA'),
      IF (SUBSTRING(SUBSTRING_INDEX(@@VERSION , '.' , -1),1,LOCATE('-',SUBSTRING_INDEX(@@VERSION , '.' , -1))-1)>6,'PERFORMANCE_SCHEMA', 'INFORMATION_SCHEMA'),
    'PERFORMANCE_SCHEMA')));

SET @tblname = IF (INSTR(@@VERSION,'MariaDB') > 0, 'INFORMATION_SCHEMA',@tblname);

-- on most requests, we just have to change the schema name by using @tblname in a prepare statement
-- but in INNODB section, the requests are not the same between < v5.7 and > v5.6 and 8, so we repeat
-- all request for each case
-- and for users and grants infos, the column 'Create_tablespace_priv' doesn't exist before v5.1

-- *************************************** Table historique d'audit *********************
-- drop table if exists histaudit;
create table if not exists histaudit
     (date_audit date,
      object_type varchar(5),
      object_name varchar(100),
      valeur varchar(255));

-- *************************************** Entête ************************************
select '<!DOCTYPE public "-//w3c//dtd html 4.01 strict//en" "http://www.w3.org/TR/html4/strict.dtd">';
select '<html>';
select '<head>';
select '<meta http-equiv=Content-Type" content="text/html; charset=iso-8859-1">';
select '<meta name="description" content="Audit Oracle HTML">';
select concat('<title>Audit MYSQL (',@@hostname,')</title>');
select '</head>';
select '<BODY BGCOLOR="#003366">';
select '<table border=0 width=90% bgcolor="#003366" align=center><tr><td>';

select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center>';
-- select concat('<font color=WHITE size=+2><b>Audit MYSQL (',@@hostname,':',variable_value,') le ',date_format(sysdate(),'%d/%m/%Y'),'</b>') from INFORMATION_SCHEMA.global_variables where variable_name = 'port';
SET @sql = CONCAT("select concat('<font color=WHITE size=+2><b>Audit MYSQL (', @@hostname , ':', variable_value, ') le ', date_format(sysdate() ,'%d/%m/%Y'),'</b></font><font color=WHITE size=+1> (', @script_version, ')</font>') from ", @tblname, ".global_variables where variable_name = 'port'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

select IF((select count(*) from histaudit where date_audit < DATE_FORMAT(NOW(),'%Y-%m-%d') > 0), concat('</font></td></tr><tr><td bgcolor="LIGHTBLUE" align=center><b>Pr&eacute;c&eacute;dent audit : ',date_format(max(distinct date_audit),'%d/%m/%Y')), '</font></td></tr><tr><td bgcolor="ORANGE" align=center><b>Premier audit') from histaudit where date_audit < DATE_FORMAT(NOW(),'%Y-%m-%d');
select '</b></td></tr></table>';
select '<br>';

-- *************************************** Initializations - first audit ************************************
-- valeurs initiales (PREMIER AUDIT) à 0 pour éviter les futurs select vides
-- si et seulement si histaudit ne contient pas déjà des valeurs pour les types
insert into histaudit SELECT DATE_FORMAT(NOW() - INTERVAL 1 DAY,'%Y-%m-%d'), 'VERS', 'version', 'Premier audit' from dual
where (select count(*) from histaudit where object_type='VERS' and object_name='version')=0;
insert into histaudit SELECT DATE_FORMAT(NOW() - INTERVAL 1 DAY,'%Y-%m-%d'), 'VERS', 'OSversion', 'Premier audit' from dual
where (select count(*) from histaudit where object_type='VERS' and object_name='OSversion')=0;
insert into histaudit SELECT DATE_FORMAT(NOW() - INTERVAL 1 DAY,'%Y-%m-%d'), 'DSIZE', table_schema, 0
FROM information_schema.tables, INFORMATION_SCHEMA.SCHEMATA
where information_schema.tables.table_schema=INFORMATION_SCHEMA.SCHEMATA.SCHEMA_NAME
and (select count(*) from histaudit where object_type='DSIZE')=0 -- seulement si aucune valeur retournée
GROUP BY table_schema;
insert into histaudit SELECT DATE_FORMAT(NOW() - INTERVAL 1 DAY,'%Y-%m-%d'), 'ISIZE', table_schema, 0
FROM information_schema.tables, INFORMATION_SCHEMA.SCHEMATA
where information_schema.tables.table_schema=INFORMATION_SCHEMA.SCHEMATA.SCHEMA_NAME
and (select count(*) from histaudit where object_type='ISIZE')=0 -- seulement si aucune valeur retournée
GROUP BY table_schema;
insert into histaudit select DATE_FORMAT(NOW() - INTERVAL 1 DAY,'%Y-%m-%d'), 'MSIZE','total server memory', 0 from dual
where (select count(*) from histaudit where object_type='MSIZE' and object_name='total server memory')=0;

SET @sql = CONCAT("
insert into histaudit SELECT DATE_FORMAT(NOW() - INTERVAL 1 DAY,'%Y-%m-%d'), 'PARAM', variable_name, variable_value
   FROM ", @tblname, ".global_variables 
   where variable_name in (
'query_cache_type',
'query_cache_size',
'query_cache_limit',
'have_query_cache',
'key_buffer_size',
'innodb_buffer_pool_size',
'innodb_buffer_pool_instances',
'innodb_additional_mem_pool_size',
'innodb_log_buffer_size',
'innodb_log_file_size',
'innodb_thread_concurrency',
'innodb_flush_method',
'innodb_file_per_table',
'read_buffer_size',
'read_rnd_buffer_size',
'sort_buffer_size', 
'thread_stack',
'join_buffer_size',
'binlog_cache_size',
'max_heap_table_size',
'tmp_table_size',
'max_connections',
'table_cache',
'table_open_cache')
and (select count(*) from histaudit where object_type='PARAM')=0");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- SECTION TEMPLATE
-- *************************************** Section xxxxxx template *******************
-- select '<hr>';
-- select '<div align=center><b><font color="WHITE">SECTION XXXXX</font></b></div>';
--
-- select '<hr>';
-- *************************************** Sous-section xxxxxx
-- select '<table border=1 width=100% bgcolor="WHITE">';
-- select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>TITRE</b></font></td></tr>';
-- select '<tr><td bgcolor="WHITE" align=center width=40%><b>Colonne1</b></td><td bgcolor="WHITE" align=center><b>Colonne2</b></td><td bgcolor="WHITE" align=center><b>Colonne3</b></td></tr>';
-- ... TRAITEMENTS...
-- SELECT concat('<tr><td bgcolor="LIGHTBLUE" align=left><b>',COLONNE1,'</b></td><td bgcolor="LIGHTBLUE" align=left>',COLONNE2,'</td><td bgcolor="LIGHTBLUE" align=left>',COLONNE3,'</td><tr>') FROM INFORMATION_SCHEMA.XXXX;
-- ...
-- select '</table>';
-- select '<br>';
--

-- *************************************** Début script audit *****************************

-- *************************************** Section informations *********************
select '<hr>';
select '<div align=center><b><font color="WHITE">SECTION INFORMATIONS</font></b></div>';

select '<hr>';
-- *************************************** Informations générales
select '<table border=1 width=100% bgcolor="WHITE">';
-- hide variable assignation
select '<!--';
select @last_audit := histaudit.date_audit from histaudit where date_audit < DATE_FORMAT(NOW(),'%Y-%m-%d') group by histaudit.date_audit order by 1 desc limit 1;
select '-->';
select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Informations g&eacute;n&eacute;rales</b></font></td></tr>';
select '<tr><td width=20%>Version</td>';
select '<td bgcolor="',IF(histaudit.valeur <> @@version, 'ORANGE', 'LIGHTBLUE'),'" colspan=2>'
    from (select * from (select valeur from histaudit where histaudit.date_audit < DATE_FORMAT(NOW(),'%Y-%m-%d')
      and histaudit.object_type='VERS' and histaudit.object_name='version'
    order by histaudit.date_audit DESC LIMIT 1) histaudit) histaudit;
select 'MySQL ', @@version, ' (OS : ', @@version_compile_os,')';
-- for uniq assignation, use set instead select. It doesn't display a query result
set @vers := (substring(@@version,5)); 
select '</td></tr>';
select '<tr><td width=20%>Uptime</td>';
-- uptime to date : J = sec DIV 86400, RESTEH := sec MOD 86400, H := RESTEH DIV 3600, RESTEM := RESTEH MOD 3600 M := RESTEM DIV 60 S := RESTEM MOD 60
select '<td bgcolor="LIGHTBLUE" align=left colspan=2>';
-- select 'Depuis le ',concat(date_format(NOW() - INTERVAL VARIABLE_VALUE SECOND, '%d/%m/%Y %H:%i:%s'), ' (', floor(variable_value/86400),' jours ',floor(mod(variable_value,86400)/3600),' heures)')
-- ,floor(mod(mod(variable_value,86400),3600)/60),' minutes ',floor(mod(mod(mod(variable_value,86400),3600),60)),' secondes)'
--  from information_schema.global_status where variable_name='Uptime';
SET @sql = CONCAT("
select 'Depuis le ',concat(date_format(NOW() - INTERVAL VARIABLE_VALUE SECOND, '%d/%m/%Y %H:%i:%s'), ' (', floor(variable_value/86400),' jours ',floor(mod(variable_value,86400)/3600),' heures)')
-- ,floor(mod(mod(variable_value,86400),3600)/60),' minutes ',floor(mod(mod(mod(variable_value,86400),3600),60)),' secondes)'
 from ", @tblname, ".global_status where variable_name='Uptime'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
select '</td></tr>';
select '<tr><td width=20%>Binary logs</td>';
-- select concat('<td bgcolor="',IF (variable_value = 'ON', 'LIGHTBLUE" align=left colspan=2>', 'LIGHTGREY" align=left colspan=2>'),variable_value)
--	from information_schema.global_variables where variable_name = 'log_bin';
SET @sql = CONCAT("
select concat('<td bgcolor=\"',IF (variable_value = 'ON', 'LIGHTBLUE\" align=left colspan=2>', 'LIGHTGREY\" align=left colspan=2>'),variable_value)
	from ", @tblname, ".global_variables where variable_name = 'log_bin'");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
select '</td></tr></table>';
-- ***************** Historique *****************
delete from histaudit where date_audit = DATE_FORMAT(NOW(),'%Y-%m-%d') and object_type='VERS';
insert into histaudit SELECT DATE_FORMAT(NOW(),'%Y-%m-%d'), 'VERS', 'version', @@version;
insert into histaudit SELECT DATE_FORMAT(NOW(),'%Y-%m-%d'), 'VERS', 'OSversion', @@version_compile_os;

-- ************************************** Ratio read/write
select '<br/><table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=2><font color="WHITE"><b>Ratio reads / writes</b></font></td></tr>';

-- Variables Com_% are no more in global_status in v8, but in events_statements_summary_global_by_event_name.
SET @sql = IF (substring(@@version,1,1) >= 8,
CONCAT("
SELECT IF(gsq.variable_value > 0, IF(gss.COUNT_STAR > 0,
		concat('<tr><td bgcolor=\"WHITE\" align=center width=',ROUND((gss.COUNT_STAR / (gss.COUNT_STAR+gsd.COUNT_STAR+gsi.COUNT_STAR+gsu.COUNT_STAR+gsp.COUNT_STAR))*100, 2),'%><b>READS</b></td><td bgcolor=\"WHITE\" align=center width=',ROUND( 100 - ((gss.COUNT_STAR / (gss.COUNT_STAR+gsd.COUNT_STAR+gsi.COUNT_STAR+gsu.COUNT_STAR+gsp.COUNT_STAR))*100),2),'%><b>WRITES</b></td></tr>',
		'<tr><td bgcolor=\"#FFFFOO\" align=center><b>', ROUND((gss.COUNT_STAR / (gss.COUNT_STAR+gsd.COUNT_STAR+gsi.COUNT_STAR+gsu.COUNT_STAR+gsp.COUNT_STAR))*100, 2), '%</b></td><td bgcolor=\"#FFBF00\" align=center><b>', ROUND( 100 - ((gss.COUNT_STAR / (gss.COUNT_STAR+gsd.COUNT_STAR+gsi.COUNT_STAR+gsu.COUNT_STAR+gsp.COUNT_STAR))*100),2),'%</b></td></tr>'),
		'<tr><td bgcolor=\"WHITE\" align=center width=20%><b>READS</b></td><td bgcolor=\"WHITE\" align=center width=80%><b>WRITES</b></td></tr><tr><td td bgcolor=\"LIGHTBLUE\" align=center>0%</td><td bgcolor=\"LIGHTBLUE\" align=center>100%</td></tr>'),
		'<tr><td bgcolor=\"LIGHTGREY\" align=left>&nbsp; </td></tr>')
	FROM ", @tblname, ".global_status gsq, ", @tblname, ".events_statements_summary_global_by_event_name gss, ", @tblname, ".events_statements_summary_global_by_event_name gsd,
	     ", @tblname, ".events_statements_summary_global_by_event_name gsi, ", @tblname, ".events_statements_summary_global_by_event_name gsu, ", @tblname, ".events_statements_summary_global_by_event_name gsp
	WHERE gsq.variable_name = 'Questions'
	and gss.EVENT_NAME = 'statement/sql/select'
	and gsd.EVENT_NAME = 'statement/sql/delete'
	and gsi.EVENT_NAME = 'statement/sql/insert'
	and gsu.EVENT_NAME = 'statement/sql/update'
	and gsp.EVENT_NAME = 'statement/sql/insert_select'
"),
CONCAT("
SELECT IF(gsq.variable_value > 0, IF(gss.variable_value > 0,
		concat('<tr><td bgcolor=\"WHITE\" align=center width=',ROUND((gss.variable_value / (gss.variable_value+gsd.variable_value+gsi.variable_value+gsu.variable_value+gsp.variable_value))*100, 2),'%><b>READS</b></td><td bgcolor=\"WHITE\" align=center width=',ROUND( 100 - ((gss.variable_value / (gss.variable_value+gsd.variable_value+gsi.variable_value+gsu.variable_value+gsp.variable_value))*100),2),'%><b>WRITES</b></td></tr>',
		'<tr><td bgcolor=\"#FFFFOO\" align=center><b>', ROUND((gss.variable_value / (gss.variable_value+gsd.variable_value+gsi.variable_value+gsu.variable_value+gsp.variable_value))*100, 2), '%</b></td><td bgcolor=\"#FFBF00\" align=center><b>', ROUND( 100 - ((gss.variable_value / (gss.variable_value+gsd.variable_value+gsi.variable_value+gsu.variable_value+gsp.variable_value))*100),2),'%</b></td></tr>'),
		'<tr><td bgcolor=\"WHITE\" align=center width=20%><b>READS</b></td><td bgcolor=\"WHITE\" align=center width=80%><b>WRITES</b></td></tr><tr><td td bgcolor=\"LIGHTBLUE\" align=center>0%</td><td bgcolor=\"LIGHTBLUE\" align=center>100%</td></tr>'),
		'<tr><td bgcolor=\"LIGHTGREY\" align=left>&nbsp; </td></tr>')
	FROM ", @tblname, ".global_status gsq, ", @tblname, ".global_status gss, ", @tblname, ".global_status gsd,
	     ", @tblname, ".global_status gsi, ", @tblname, ".global_status gsu, ", @tblname, ".global_status gsp
	WHERE gsq.variable_name = 'Questions'
	and gss.variable_name = 'Com_select'
	and gsd.variable_name = 'Com_delete'
	and gsi.variable_name = 'Com_insert'
	and gsu.variable_name = 'Com_update'
	and gsp.variable_name = 'Com_replace'
"));

PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
select '</table>';
select '<br>';

-- *************************************** Section stockage ***************************
select '<hr>';
select '<div align=center><b><font color="WHITE">SECTION STOCKAGE</font></b></div>';

select '<hr>';
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=7><font color="WHITE"><b>Chemin des fichiers</b></font></td></tr>';
SELECT '<tr><td bgcolor="WHITE" align=center colspan=7><b>&nbsp;', @@datadir, '</b></td></tr>';
select '</table>';
select '<br>';
-- *************** Liste et taille des bases ********************
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=7><font color="WHITE"><b>Taille des bases</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=20%><b>Database</b></td><td bgcolor="WHITE" align=center width=15%><b>Default character set</b></td><td bgcolor="WHITE" align=center><b>Default collation</b></td><td bgcolor="WHITE" align=center><b>Taille tables</b><td bgcolor="WHITE" align=center><b>Taille indexes</b></td></td><td bgcolor="WHITE" align=center><b>Taille totale</b></td><td bgcolor="WHITE" align=center width=15%><b>Différences de taille depuis dernier audit</b></td></tr>';

-- NOTE : si cette requête devient trop longues (plusieures dizaines de minutes parfois !) modifier le paramètre :
-- innodb_stats_on_metadata=OFF (my.cnf)
-- et/ou set innodb_stats_on_metadata=0 (en root dans le client mysql)

SELECT concat('<tr><td bgcolor="',IF(table_schema not in (select table_schema from histaudit where date_audit < DATE_FORMAT(NOW(),'%Y-%m-%d')), 'ORANGE','LIGHTBLUE'),'" align=left><b>', table_schema, '</b></td><td bgcolor="LIGHTBLUE" align=left>',DEFAULT_CHARACTER_SET_NAME,'</td><td bgcolor="LIGHTBLUE" align=left>',DEFAULT_COLLATION_NAME, '</td>',
'<td bgcolor="LIGHTBLUE" align=right>',
-- datas
  IF (sum(data_length) > 1048576,
      IF (sum(data_length) > 1073741824, 
          concat(ROUND(sum(data_length)/1024/1024/1024,2),' Go</td>'),
          concat(ROUND(sum(data_length)/1024/1024,2),' Mo</td>')),
      concat(ROUND(sum(data_length)/1024,2),' Ko</td>')),
'<td bgcolor="LIGHTBLUE" align=right>',
-- indexes
  IF (sum(index_length) > 1048576,
      IF (sum(index_length) > 1073741824,
          concat(ROUND(sum(index_length)/1024/1024/1024,2),' Go</td>'),
          concat(ROUND(sum(index_length)/1024/1024,2),' Mo</td>')),
      concat(ROUND(sum(index_length)/1024,2),' Ko</td>')),
'<td bgcolor="LIGHTBLUE" align=right>',
-- total
  IF (sum(data_length+index_length) > 1048576,
      IF (sum(data_length+index_length) > 1073741824,
          concat(ROUND(sum(data_length+index_length)/1024/1024/1024,2),' Go</td>'),
          concat(ROUND(sum(data_length+index_length)/1024/1024,2),' Mo</td>')),
      concat(ROUND(sum(data_length+index_length)/1024,2),' Ko</td>')),
'<td bgcolor="LIGHTBLUE" align=right>',
-- diff
  IF (sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur) = 0,
      '0.00',
      IF (sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur) > 0,
          IF (sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur) > 1048576,
              IF (sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur) > 1073741824,
                  concat('+',ROUND((sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur))/1024/1024/1024,2),' Go</td>'),
                  concat('+',ROUND((sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur))/1024/1024,2),' Mo</td>')),
              concat('+',ROUND((sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur))/1024,2),' Ko</td>')),
          IF (sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur) < -1048576,
              IF (sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur) < -1073741824,
                  concat(ROUND((sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur))/1024/1024/1024,2),' Go</td>'),
                  concat(ROUND((sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur))/1024/1024,2),' Mo</td>')),
              concat(ROUND((sum(data_length+index_length)-(histaudit_d.valeur + histaudit_i.valeur))/1024,2),' Ko</td>'))))
),
'</td></tr>'
FROM information_schema.tables, INFORMATION_SCHEMA.SCHEMATA,

(select object_name,valeur from histaudit
 where date_audit = (select date_audit from histaudit
 where date_audit < DATE_FORMAT(NOW(),'%Y-%m-%d')
 order by histaudit.date_audit DESC LIMIT 1)
 and object_type = 'DSIZE') histaudit_d,

(select object_name,valeur from histaudit
 where date_audit = (select date_audit from histaudit
 where date_audit < DATE_FORMAT(NOW(),'%Y-%m-%d')
 order by histaudit.date_audit DESC LIMIT 1)
 and object_type = 'ISIZE') histaudit_i

WHERE information_schema.tables.table_schema = INFORMATION_SCHEMA.SCHEMATA.SCHEMA_NAME
AND information_schema.tables.table_schema = histaudit_d.object_name
AND information_schema.tables.table_schema = histaudit_i.object_name
AND histaudit_d.object_name = histaudit_i.object_name
-- AND table_schema not in ('information_schema','performance_schema')
GROUP BY table_schema;

/*
SELECT concat('<tr><td bgcolor="WHITE" align=left><b>Total sur disque</b></td>', '<td bgcolor="LIGHTBLUE" align=right colspan=6><b>',
  IF (sum(data_length+index_length) > 1048576,
      IF (sum(data_length+index_length) > 1073741824, concat(ROUND(sum(data_length+index_length)/1024/1024/1024,2),' Go</b></td>'),
                                                      concat(ROUND(sum(data_length+index_length)/1024/1024,2),' Mo</b></td>')),
      concat(ROUND(sum(data_length+index_length)/1024,2),' Ko</b></td>'))
)
FROM information_schema.tables;
*/
-- Total global
SELECT concat('<tr><td bgcolor="WHITE" align=left><b>TOTAL sur disque</b></td>', '<td bgcolor="BLUE" align=right colspan=5><font color="WHITE"><b>',
  IF (total > 1048576,
      IF (total > 1073741824,
          concat(ROUND(total/1024/1024/1024,2),' Go'),
          concat(ROUND(total/1024/1024,2),' Mo')),
      concat(ROUND(total/1024,2),' Ko')),
'</b></font></td><td bgcolor="BLUE" align=right><font color="WHITE"><b>',
  IF (total-valeur = 0,
      '0.00',
      IF (total-valeur > 0,
          IF (total-valeur > 1048576,
              IF (total-valeur > 1073741824,
                  concat('+',ROUND((total-valeur)/1024/1024/1024,2),' Go'),
                  concat('+',ROUND((total-valeur)/1024/1024,2),' Mo')),
              concat('+',ROUND((total-valeur)/1024,2),' Ko')),
          IF (total-valeur < -1048576,
              IF (total-valeur < -1073741824,
                  concat(ROUND((total-valeur)/1024/1024/1024,2),' Go'),
                  concat(ROUND((total-valeur)/1024/1024,2),' Mo')),
              concat(ROUND((total-valeur)/1024,2),' Ko')))),
'</b></font></td></tr>'
)
FROM
(select sum(data_length)+sum(index_length) total from information_schema.tables) information_schema_t,
(select sum(valeur) valeur from histaudit
 where date_audit = (select date_audit from histaudit
 where date_audit < DATE_FORMAT(NOW(),'%Y-%m-%d')
 order by histaudit.date_audit DESC LIMIT 1)
 and object_type in ('DSIZE','ISIZE')) histaudit_t;
select '</table>';
select '<br>';

-- N'ACTIVER LE QUERY CACHE QUE SI LA BASE EST TRES SOLLICITEE EN LECTURE, ET/OU SI LES BASES UTILISATEURS UTILISENT PRINCIPALEMENT MYISAM
-- => SI PRINCIPALEMENT INNODB, LE LAISSER OFF
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=2><font color="WHITE"><b>R&eacute;partition par type de stockage (bases utilisateurs uniquement)</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Base</b></td><td bgcolor="WHITE" align=center><b>Type</b></td></tr>';
select concat('<td bgcolor="LIGHTBLUE" align=left><b>',TABLE_SCHEMA, '</b></td><td bgcolor="LIGHTBLUE" align=right>',ENGINE, ' (',
IF((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH)) > 1048576, IF((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH)) > 1073741824, round((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH))/1024/1024/1024,2), round((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH))/1024/1024,2)), round((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH))/1024,2)),
 IF((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH)) > 1048576, IF((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH)) > 1073741824,' Go)', ' Mo)'), ' Ko)'),
'</td></tr>')
 from information_schema.TABLES
   where TABLE_SCHEMA not in ('mysql','information_schema','performance_schema')
   AND ENGINE IS NOT NULL
   group by TABLE_SCHEMA,ENGINE order by TABLE_SCHEMA;
select '</table>';
select '<br>';

select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=2><font color="WHITE"><b>Taille totale des donn&eacute;es (tables + indexes) par type de stockage (bases utilisateurs uniquement)</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Type</b></td><td bgcolor="WHITE" align=center><b>Taille totale</b></td></tr>';
SELECT concat('<td bgcolor="LIGHTBLUE" align=left><b>', ENGINE, '</b></td><td bgcolor="LIGHTBLUE" align=right>',
 IF((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH)) > 1048576, IF((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH)) > 1073741824, round((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH))/1024/1024/1024,2), round((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH))/1024/1024,2)), round((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH))/1024,2)),
 IF((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH)) > 1048576, IF((SUM(DATA_LENGTH)+SUM(INDEX_LENGTH)) > 1073741824,' Go dans ', ' Mo dans '), ' Ko dans '),
 COUNT(ENGINE), ' tables</td></tr>')
  FROM information_schema.TABLES
  WHERE TABLE_SCHEMA not in ('mysql','information_schema','performance_schema')
  AND ENGINE IS NOT NULL
  GROUP BY ENGINE ORDER BY ENGINE ASC;
select '</table>';
select '<br>';
-- ***************** Historique *****************
delete from histaudit where date_audit = DATE_FORMAT(NOW(),'%Y-%m-%d') and (object_type='DSIZE' or object_type='ISIZE');
insert into histaudit SELECT DATE_FORMAT(NOW(),'%Y-%m-%d'), 'DSIZE', table_schema, SUM(data_length)
FROM information_schema.tables
GROUP BY table_schema;
insert into histaudit SELECT DATE_FORMAT(NOW(),'%Y-%m-%d'), 'ISIZE', table_schema, SUM(index_length)
FROM information_schema.tables
GROUP BY table_schema;

-- *************************************** Section mémoire **************************
select '<hr>';
select '<div align=center><b><font color="WHITE">SECTION MEMOIRE ET CACHES</font></b></div>';

select '<hr>';

-- *************************************** Valeurs actuelle des buffers systeme
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=2><table border=0 width=100%><tr><td width=2% Title="Les nouveaux param&egrave;tres ou les param&egrave;tres modifi&eacute;s apparaissent en orange."><img src="data:image/gif;base64,',@info,'"></td><td align=center><font color="WHITE"><b>Valeurs des principaux buffers et param&egrave;tres syst&egrave;me</b></font></td></tr></table></td></tr>';

select '<tr><td bgcolor="WHITE" align=center width=40%><b>Buffers et param&egrave;tres</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td></tr>';

SET @sql = CONCAT("
-- variables in size
SELECT concat('<tr><td bgcolor=\"',IF (variable_value <> valeur, 'ORANGE', 'LIGHTBLUE'),'\" align=left>',variable_name,'</td><td bgcolor=\"',
 IF (variable_value <> valeur, 'ORANGE', 'LIGHTBLUE'),'\" align=right>', IF(variable_value > 1048576, ROUND(variable_value/1024/1024,2), ROUND(variable_value/1024,2)),IF(variable_value > 1048576,' Mo',' Ko'),'</td></tr>') 
   FROM ", @tblname, ".global_variables
,(select histaudit.object_name, histaudit.valeur from histaudit where histaudit.object_type='PARAM' and histaudit.date_audit = @last_audit) hist
   where variable_name in (
'query_cache_size',
'query_cache_limit',
'key_buffer_size',
'innodb_buffer_pool_size',
'innodb_additional_mem_pool_size',
'innodb_log_buffer_size',
'innodb_log_file_size',
'thread_stack',
'thread_cache_size',
'binlog_cache_size')
and variable_name = hist.object_name
   UNION
SELECT concat('<tr><td bgcolor=\"',IF (variable_value <> valeur, 'ORANGE', 'LIGHTBLUE'),'\" align=left>',variable_name,'</td><td bgcolor=\"',
 IF (substring(@@version,1,3) > 5.7 AND locate('mariadb',lower(@@version)) = 0 AND variable_value <> 'NO', 'RED\" align=right> (deprecated since 5.7.20) ',IF (variable_value <> valeur, 'ORANGE\" align=right>', 'LIGHTBLUE\" align=right>')),
 variable_value,'</td></tr>') 
   FROM ", @tblname, ".global_variables
,(select histaudit.object_name, histaudit.valeur from histaudit where histaudit.object_type='PARAM' and histaudit.date_audit = @last_audit) hist
   where variable_name = 'have_query_cache'
and variable_name = hist.object_name
   UNION
-- variables in number 
SELECT concat('<tr><td bgcolor=\"',IF (variable_value <> valeur, 'ORANGE', 'LIGHTBLUE'),'\" align=left>',variable_name,'</td><td bgcolor=\"',
IF (variable_value <> valeur, 'ORANGE', 'LIGHTBLUE'),
'\" align=right>',variable_value,'</td></tr>') 
   FROM ", @tblname, ".global_variables
   ,(select histaudit.object_name, histaudit.valeur from histaudit where histaudit.object_type='PARAM' and histaudit.date_audit = @last_audit) hist
   where variable_name in (
'query_cache_type',
'innodb_flush_method',
'innodb_file_per_table',
'innodb_thread_concurrency',
'table_cache',
'table_open_cache')
and variable_name = hist.object_name
   UNION
-- variables to validate by other(s) variable(s) values(s)
-- innodb_buffer_pool_instances (description : https://www.saotn.org/mysql-innodb-performance-improvement/ to add in 'Title' tips
 SELECT concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',gvi.variable_name,
                  '</td><td bgcolor=\"',
                  IF(cast(gvs.variable_value/(1024*1024*1024) as unsigned) > gvi.variable_value,
                     IF(cast(gvs.variable_value/(1024*1024*1024) as unsigned) > 64,
                        concat('ORANGE\" align=right>',gvi.variable_value,' (devrait &ecirc;tre 64)'),
                        concat('ORANGE\" align=right>',gvi.variable_value,' (devrait &ecirc;tre ',cast(gvs.variable_value/(1024*1024*1024) as unsigned),')')
                     ),
                     concat(IF (gvi.variable_value <> valeur, 'ORANGE', 'LIGHTBLUE'),'\" align=right>',gvi.variable_value)
                  ),
               '</td></tr>')
   FROM (select variable_name,variable_value from ", @tblname, ".global_variables
      where variable_name = 'innodb_buffer_pool_size') gvs,
        (select variable_name,variable_value from ", @tblname, ".global_variables
      where variable_name ='innodb_buffer_pool_instances') gvi,
   (select histaudit.object_name, histaudit.valeur from histaudit where histaudit.object_type='PARAM' and histaudit.date_audit = @last_audit) hist
      where gvi.variable_name = hist.object_name
order by 1
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- *************************************** Mémoire totale utilisée par les buffers systeme

-- TODO : Calcul mémoire système (l.481) +/- semble erroné en v8

SET @sql = CONCAT("
SELECT concat('<tr><td bgcolor=\"WHITE\" align=left><b>M&eacute;moire allou&eacute;e pour les buffers syst&egrave;me</b></td><td bgcolor=\"',
 IF (round((kbs.variable_value + IF(ibps.variable_value IS NOT NULL, ibps.variable_value, 0) + IF(iamps.variable_value IS NOT NULL, iamps.variable_value, 0) + IF(ilbs.variable_value IS NOT NULL, ilbs.variable_value, 0) + IF(qcs.variable_value IS NOT NULL, qcs.variable_value, 0))/1024/1024,2) > round(hist.valeur/1024/1024,2), 'ORANGE', 'BLUE'),
'\" align=right><font color=\"',IF (round((kbs.variable_value + IF(ibps.variable_value IS NOT NULL, ibps.variable_value, 0) + IF(iamps.variable_value IS NOT NULL, iamps.variable_value, 0) + IF(ilbs.variable_value IS NOT NULL, ilbs.variable_value, 0) + IF(qcs.variable_value IS NOT NULL, qcs.variable_value, 0))/1024/1024,2) > round(hist.valeur/1024/1024,2), 'BLACK', 'WHITE'), '\"><b>',round((kbs.variable_value  + IF(ibps.variable_value IS NOT NULL, ibps.variable_value, 0) + IF(iamps.variable_value IS NOT NULL, iamps.variable_value, 0) + IF(ilbs.variable_value IS NOT NULL, ilbs.variable_value, 0) + IF(qcs.variable_value IS NOT NULL, qcs.variable_value, 0))/1024/1024,2),' Mo ',
 IF (round((kbs.variable_value + IF(ibps.variable_value IS NOT NULL, ibps.variable_value, 0) + IF(iamps.variable_value IS NOT NULL, iamps.variable_value, 0) + IF(ilbs.variable_value IS NOT NULL, ilbs.variable_value, 0) + IF(qcs.variable_value IS NOT NULL, qcs.variable_value, 0))/1024/1024, 2) > round(hist.valeur/1024/1024,2),
     concat('(+',
           round((kbs.variable_value + IF(ibps.variable_value IS NOT NULL, ibps.variable_value, 0) + IF(iamps.variable_value IS NOT NULL, iamps.variable_value, 0) + IF(ilbs.variable_value IS NOT NULL, ilbs.variable_value, 0) + IF(qcs.variable_value IS NOT NULL, qcs.variable_value, 0))/1024/1024,2) - round(hist.valeur/1024/1024,2),
           ')'),
     ''),
'</b></font></td></tr>')
  FROM (select variable_value from ", @tblname, ".global_variables where variable_name = 'key_buffer_size') kbs,
        (select IF(EXISTS(select variable_value from ", @tblname, ".global_variables where variable_name = 'query_cache_size')=1, (select variable_value from ", @tblname, ".global_variables where variable_name = 'query_cache_size'), 0) variable_value) qcs,
        (select IF(EXISTS(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_buffer_pool_size')=1,(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_buffer_pool_size'), 0) variable_value) ibps, -- les variables innodb n'existent pas si innodb desactivé
        (select IF(EXISTS(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_additional_mem_pool_size')=1,(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_additional_mem_pool_size'), 0) variable_value) iamps,
        (select IF(EXISTS(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_log_buffer_size')=1,(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_log_buffer_size'), 0) variable_value) ilbs,
(select histaudit.valeur from histaudit where histaudit.object_type='MSIZE' and histaudit.date_audit < DATE_FORMAT(NOW(),'%Y-%m-%d') order by histaudit.date_audit DESC LIMIT 1) hist
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- *************************************** Valeurs actuelle des buffers par session
select '<tr><td bgcolor="#3399CC" align=center colspan=2><font color="WHITE"><b>Valeurs des buffers par session</b></font></td></tr>';

select '<tr><td bgcolor="WHITE" align=center width=40%><b>Buffer</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td></tr>';
SET @sql = CONCAT("
SELECT concat('<tr><td bgcolor=\"',IF (variable_value <> valeur, 'ORANGE', 'LIGHTBLUE'),'\" align=left>',variable_name,'</td><td bgcolor=\"',
 IF (variable_value <> valeur, 'ORANGE', 'LIGHTBLUE'),'\" align=right>', IF(variable_value > 1048576, ROUND(variable_value/1024/1024,2), ROUND(variable_value/1024,2)),IF(variable_value > 1048576,' Mo',' Ko'),'</td></tr>') 
   FROM ", @tblname, ".global_variables
,(select histaudit.object_name, histaudit.valeur from histaudit where histaudit.object_type='PARAM' and histaudit.date_audit = @last_audit) hist
   where variable_name in (
'sort_buffer_size',
'myisam_sort_buffer_size',
'join_buffer_size',
'read_buffer_size',
'read_rnd_buffer_size',
'max_heap_table_size',
'tmp_table_size')
and variable_name = hist.object_name
UNION
SELECT concat('<tr><td bgcolor=\"',IF (variable_value <> valeur, 'ORANGE', 'LIGHTBLUE'),'\" align=left>',variable_name,'</td><td bgcolor=\"',
 IF (variable_value <> valeur, 'ORANGE', 'LIGHTBLUE'),'\" align=right>', variable_value,'</td></tr>')
   FROM ", @tblname, ".global_variables
,(select histaudit.object_name, histaudit.valeur from histaudit where histaudit.object_type='PARAM' and histaudit.date_audit = @last_audit) hist
   where variable_name in (
'max_connections')
and variable_name = hist.object_name
order by 1
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- *************************************** Mémoire totale utilisée par les buffers par session
SET @sql = CONCAT("
SELECT concat('<tr><td bgcolor=\"WHITE\" align=left><b>M&eacute;moire allou&eacute;e par session</b></td><td bgcolor=\"','BLUE','\" align=right><font color=\"WHITE\"><b>', round((sbs.variable_value + msbs.variable_value + rbs.variable_value + jbs.variable_value + rrbs.variable_value + tts.variable_value)/1024/1024,2),' Mo ',
'</b></font></td></tr>')
  FROM (select variable_value from ", @tblname, ".global_variables where variable_name = 'SORT_BUFFER_SIZE') sbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'MYISAM_SORT_BUFFER_SIZE') msbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'READ_BUFFER_SIZE') rbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'JOIN_BUFFER_SIZE') jbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'READ_RND_BUFFER_SIZE') rrbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'TMP_TABLE_SIZE') tts
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- *************************************** Mémoire totale utilisée par les buffers par MAX session
SET @sql = CONCAT("
SELECT concat('<tr><td bgcolor=\"WHITE\" align=left><b>M&eacute;moire allou&eacute;e pour le max sessions (* MAX_CONNECTIONS)</b></td><td bgcolor=\"','BLUE','\" align=right><font color=\"WHITE\"><b>', round(((sbs.variable_value + msbs.variable_value + rbs.variable_value + jbs.variable_value + rrbs.variable_value + tts.variable_value) * mc.variable_value)/1024/1024,2),' Mo ',
'</b></font></td></tr>')
  FROM (select variable_value from ", @tblname, ".global_variables where variable_name = 'SORT_BUFFER_SIZE') sbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'MYISAM_SORT_BUFFER_SIZE') msbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'READ_BUFFER_SIZE') rbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'JOIN_BUFFER_SIZE') jbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'READ_RND_BUFFER_SIZE') rrbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'TMP_TABLE_SIZE') tts,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'MAX_CONNECTIONS') mc
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

select '</table>';
select '<br>';

-- ***************** Historique caches *****************
delete from histaudit where date_audit = DATE_FORMAT(NOW(),'%Y-%m-%d') and object_type='PARAM';

SET @sql = CONCAT("
insert into histaudit SELECT DATE_FORMAT(NOW(),'%Y-%m-%d'), 'PARAM', variable_name, variable_value
   FROM ", @tblname, ".global_variables 
   where variable_name in (
'query_cache_type',
'query_cache_size',
'query_cache_limit',
'have_query_cache',
'key_buffer_size',
'innodb_buffer_pool_size',
'innodb_buffer_pool_instances',
'innodb_additional_mem_pool_size',
'innodb_log_buffer_size',
'innodb_log_file_size',
'innodb_thread_concurrency',
'innodb_flush_method',
'innodb_file_per_table',
'read_buffer_size',
'read_rnd_buffer_size',
'sort_buffer_size', 
'thread_stack',
'join_buffer_size',
'myisam_sort_buffer_size',
'binlog_cache_size',
'max_heap_table_size',
'tmp_table_size',
'max_connections',
'table_cache',
'table_open_cache')
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ***************** Historique memoire total *****************
delete from histaudit where date_audit = DATE_FORMAT(NOW(),'%Y-%m-%d') and object_type='MSIZE';

SET @sql = CONCAT("
insert into histaudit SELECT DATE_FORMAT(NOW(),'%Y-%m-%d'), 'MSIZE', 'total server memory', (kbs.variable_value + IF(ibps.variable_value IS NOT NULL, ibps.variable_value, 0) + IF(iamps.variable_value IS NOT NULL, iamps.variable_value, 0) + IF(iampi.variable_value IS NOT NULL, iampi.variable_value, 0) + IF(ilbs.variable_value IS NOT NULL, ilbs.variable_value, 0) + IF(qcs.variable_value IS NOT NULL, qcs.variable_value, 0))
  FROM (select variable_value from ", @tblname, ".global_variables where variable_name = 'key_buffer_size') kbs,
        (select variable_value from ", @tblname, ".global_variables where variable_name = 'query_cache_size') qcs,
        (select IF(EXISTS(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_buffer_pool_size')=1,(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_buffer_pool_size'), 0) variable_value) ibps, -- les variables innodb n'existent pas si innodb desactivé
        (select IF(EXISTS(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_additional_mem_pool_size')=1,(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_additional_mem_pool_size'), 0) variable_value) iamps,
        (select IF(EXISTS(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_buffer_pool_instances')=1,(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_buffer_pool_instances'), 0) variable_value) iampi,
        (select IF(EXISTS(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_log_buffer_size')=1,(select variable_value from ", @tblname, ".global_variables where variable_name = 'innodb_log_buffer_size'), 0) variable_value) ilbs
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @sql = CONCAT("
insert into histaudit SELECT DATE_FORMAT(NOW(),'%Y-%m-%d'), 'MSIZE', 'total max sessions memory', (sbs.variable_value + msbs.variable_value + rbs.variable_value + jbs.variable_value + rrbs.variable_value + tts.variable_value)
  FROM (select variable_value from ", @tblname, ".global_variables where variable_name = 'SORT_BUFFER_SIZE') sbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'MYISAM_SORT_BUFFER_SIZE') msbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'READ_BUFFER_SIZE') rbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'JOIN_BUFFER_SIZE') jbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'READ_RND_BUFFER_SIZE') rrbs,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'TMP_TABLE_SIZE') tts,
       (select variable_value from ", @tblname, ".global_variables where variable_name = 'MAX_CONNECTIONS') mc
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- *************************************** Section performances  **************************
select '<hr>';
select '<div align=center><b><font color="WHITE">SECTION PERFORMANCES</font></b></div>';

select '<hr>';
-- *************************************** Tables caches et ratios
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Cache tables (table[_open]_cache)</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Variable</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td><td bgcolor="WHITE" align=center><b>Ratio d\'utilisation</b></td></tr>';
-- show variables like 'table_cache'; (< 5.1.3)
-- show variables like 'table_open_cache'; (> 5.1.3)

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',gs.variable_name,'</td><td bgcolor=\"LIGHTBLUE\" align=right>',gs.variable_value,'</td><td bgcolor=\"',CASE WHEN round((gs.variable_value/gv.variable_value)*100,0) > 90 AND round((gs.variable_value/gv.variable_value)*100,0) < 99 THEN 'ORANGE\" align=right><font color=BLACK>' WHEN round((gs.variable_value/gv.variable_value)*100,0) > 99 THEN 'RED\" align=right>' ELSE 'LIGHTBLUE\" align=right>' END,' ',IF (gv.variable_value > 0, round((gs.variable_value/gv.variable_value)*100,2), 0), '% de ',gv.variable_value,'</td></tr>') 
  FROM ", @tblname, ".global_status gs, ", @tblname, ".global_variables gv
  where gs.variable_name ='Open_tables' and (gv.variable_name = 'TABLE_CACHE' or gv.variable_name = 'TABLE_OPEN_CACHE')
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',gs.variable_name, '</td><td bgcolor=\"LIGHTBLUE\" align=right>',gs.variable_value,'</td><td bgcolor=\"LIGHTGREY\" align=right><img src=\"data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7\"></td></tr>' )
  FROM ", @tblname, ".global_status gs
  where gs.variable_name ='Opened_tables'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
select '</table>';
select '<br>';

-- *************************************** Indexes caches et ratios
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Cache indexes (key_buffer_size)</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Statistique</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td><td bgcolor="WHITE" align=center><b>Ratio d\'utilisation</b></td></tr>';

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',s.variable_name,'</td><td bgcolor=\"LIGHTBLUE\" align=right>',round(s.variable_value/1024,2),' Mo</td><td bgcolor=\"',CASE WHEN round((s.variable_value*100/(v.variable_value/1024)),0) > 90 AND  round((s.variable_value*100/(v.variable_value/1024)),0) < 99 THEN 'ORANGE' WHEN round((s.variable_value*100/(v.variable_value/1024)),0) > 99 THEN '#FF0000' ELSE 'LIGHTBLUE' END,'\" align=right>',round((s.variable_value*100/(v.variable_value/1024)),2),'% de ',round(v.variable_value/1024/1024,2),' Mo','</td></tr>') FROM ", @tblname, ".global_status s, ", @tblname, ".global_variables v where s.variable_name in ('Key_blocks_used') and v.variable_name = 'key_buffer_size'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"WHITE\" align=left colspan=2>Ratio read hits</td></td><td bgcolor=\"LIGHTBLUE\" align=right>',IF (rs.variable_value > 0, round(100 - (s.variable_value/rs.variable_value)*100,2), 0),'%</td></tr>') FROM ", @tblname, ".global_status s, ", @tblname, ".global_status rs where s.variable_name = 'Key_reads' and rs.variable_name = 'Key_read_requests'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select concat('<td bgcolor=\"WHITE\" align=left colspan=2>Ratio write hits</td><td bgcolor=\"LIGHTBLUE\" align=right>',IF (rs.variable_value > 0, round(100 - (s.variable_value/rs.variable_value)*100,2), 0),'%</td><tr>') FROM ", @tblname, ".global_status s, ", @tblname, ".global_status rs where s.variable_name = 'Key_writes' and rs.variable_name = 'Key_write_requests'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
select '</td></tr></table>';
select '<br>';

-- *************************************** Query cache
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Cache requ&ecirc;tes (query_cache_size)</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Statistique</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td><td bgcolor="WHITE" align=center><b>Ratio d\'utilisation</b></td></tr>'; -- \'

SET @sql = CONCAT("
SELECT IF(q.variable_value = 'YES',
		IF(v.variable_value > 0,
		concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>','M&eacute;moire utilis&eacute;e (<b>valeur instantan&eacute;e</b>)','</td><td bgcolor=\"LIGHTBLUE\" align=right>',round((v.variable_value-s.variable_value)/1024/1024,2),' Mo</td><td bgcolor=\"', CASE WHEN round(((v.variable_value-s.variable_value)/v.variable_value)*100,0) > 90 AND round(((v.variable_value-s.variable_value)/v.variable_value)*100,0) < 99 THEN 'ORANGE' WHEN round(((v.variable_value-s.variable_value)/v.variable_value)*100,0) > 99 THEN '#FF0000' ELSE 'LIGHTBLUE' END,'\" align=right>', round(((v.variable_value-s.variable_value)/v.variable_value)*100,2),'% de ',  round(v.variable_value/1024/1024,2),' Mo</td></tr>'),
		'<tr><td bgcolor=\"ORANGE\">Cache activ&eacute; (have_query_cache=YES) mais query_cache_size=0</td><td bgcolor=\"ORANGE\" align=right>0</td><td bgcolor=\"LIGHTGREY\"> </td></tr>'),
		'<tr><td bgcolor=\"ORANGE\">Cache non activ&eacute;</td><td bgcolor=\"ORANGE\">N/A</td><td bgcolor=\"ORANGE\">N/A</td></tr>')
	FROM ", @tblname, ".global_status s, ", @tblname, ".global_variables v, ", @tblname, ".global_variables q
	where s.variable_name = 'Qcache_free_memory'
	and v.variable_name = 'query_cache_size'
	and q.variable_name = 'have_query_cache'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
SELECT IF(q.variable_value = 'YES' AND v.variable_value > 0,
        IF (sqch.variable_value > 0 AND sq.variable_value > 0,
		  concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>','Ratio QC hits','</td><td bgcolor=\"LIGHTBLUE\" align=right>', sqch.variable_value,' hits</td><td bgcolor=\"',IF (round((sqch.variable_value/(sqch.variable_value+sq.variable_value))*100,0) <= 50,'ORANGE','LIGHTBLUE'),'\" align=right>', round((sqch.variable_value/(sqch.variable_value+sq.variable_value))*100,2),'% de ', sq.variable_value, ' requ&ecirc;tes cachables','</td></tr>'),
          '<tr><td bgcolor=\"ORANGE\">Ratio QC hits</td><td bgcolor=\"ORANGE\" align=right>0</td><td bgcolor=\"ORANGE\" align=center>Aucune requ&ecirc;te sur la p&eacute;riode</td></tr>'),
		'')
	FROM ", @tblname, ".global_status sqch, ", @tblname, ".global_status sq, ", @tblname, ".global_variables v, ", @tblname, ".global_variables q
	WHERE sqch.variable_name = 'Qcache_hits'
--	and sq.variable_name = 'Com_select' -- for \"all queries\" (even not cacheable) hit ratio
	and sq.variable_name = 'Qcache_inserts' -- hit ratio only for cacheable queries
	and v.variable_name = 'query_cache_size'
	and q.variable_name = 'have_query_cache'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
SELECT IF(q.variable_value = 'YES' AND v.variable_value > 0,
		concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>','QC prune / jour','</td><td bgcolor=\"',IF(sq.variable_value/(squ.variable_value/86400)>98, 'ORANGE\"','LIGHTBLUE\"'),' align=right colspan=2>', round(sq.variable_value/(squ.variable_value/86400),0) ,'</td></tr>'),
		'')
	FROM ", @tblname, ".global_status squ, ", @tblname, ".global_status sq, ", @tblname, ".global_variables v, ", @tblname, ".global_variables q
	WHERE squ.variable_name = 'Uptime'
	and sq.variable_name = 'Qcache_lowmem_prunes'
	and v.variable_name = 'query_cache_size'
	and q.variable_name = 'have_query_cache'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ratio = Qcache_hits / (Qcache_hits + Com_select)

-- A integrer : SELECT GRANTEE, PRIVILEGE_TYPE FROM USER_PRIVILEGES;
-- TODO : voir section Questions -> mysqlreport + section Query cache
-- TODO : Performance Metrics (voir mysqltuner)

select '</table>';
select '<br>';

-- *************************************** Table locks
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=2><font color="WHITE"><b>Verrous de tables</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Statistique</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td></tr>';

SET @sql = CONCAT("
SELECT concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>', 'acquis imm&eacute;diatement','</td><td bgcolor=\"LIGHTBLUE\" align=right>', i.variable_value, '</td></tr>')
FROM ", @tblname, ".global_status i
WHERE i.variable_name = 'Table_locks_immediate'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
SELECT concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>', 'n&eacute;cessitant une attente','</td><td bgcolor=\"LIGHTBLUE\" align=right>', w.variable_value, '</td></tr>')
FROM ", @tblname, ".global_status w
WHERE w.variable_name = 'Table_locks_waited'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
SELECT concat('<tr><td bgcolor=\"WHITE\" align=left>', 'Ratio','</td><td bgcolor=\"LIGHTBLUE\" align=right>', round(w.variable_value/(i.variable_value + w.variable_value)*100,2), '%</td></tr>')
FROM ", @tblname, ".global_status i,", @tblname, ".global_status w WHERE i.variable_name = 'Table_locks_immediate' and w.variable_name = 'Table_locks_waited'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
select '</table>';
select '<br>';

-- *************************************** Section processus et sessions **************************
select '<hr>';
select '<div align=center><b><font color="WHITE">SECTION PROCESSUS ET SESSIONS</font></b></div>';

select '<hr>';
-- *************************************** Connexions
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Connexions</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Statistique</b></td><td bgcolor="WHITE" align=center><b>Nombre</b></td><td bgcolor="WHITE" align=center><b>Ratio d\'utilisation</b></td></tr>'; -- \'

-- max_connection = HWM of concurrent connections since boot

SET @sql = CONCAT("
SELECT concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>', 'Nombre de connexions simultan&eacute;es (max. atteint)','</td><td bgcolor=\"LIGHTBLUE\" align=right>', s.variable_value,'</td><td bgcolor=\"',CASE WHEN round((s.variable_value/v.variable_value)*100,0) > 90 AND round((s.variable_value/v.variable_value)*100,0) < 99 THEN 'ORANGE' WHEN round((s.variable_value/v.variable_value)*100,0) > 99 THEN '#FF0000' ELSE 'LIGHTBLUE' END,'\" align=right>', IF (v.variable_value > 0, round((s.variable_value/v.variable_value)*100,2), 0),'% de ', v.variable_value, ' (max_connections)') FROM ", @tblname, ".global_status s,", @tblname, ".global_variables v WHERE s.variable_name = 'Max_used_connections' and v.variable_name = 'max_connections'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
select '</td></tr>';

-- Aborted_clients = connectes puis deconnectes (coupure); Aborted_connects = meme pas connectes (droits)

SET @sql = CONCAT("
SELECT concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>', 'Connexions interrompues','</td><td bgcolor=\"LIGHTBLUE\" align=right colspan=2>', scl.variable_value, 
CASE WHEN scl.variable_value > (upt.variable_value/86400) AND upt.variable_value/86400 > 1 THEN concat(' (', round(scl.variable_value / (floor(upt.variable_value/86400)),0), ' / jour)')
     WHEN scl.variable_value = 0 THEN ''
     WHEN upt.variable_value/86400 < 1 THEN ' ( uptime < 1 jour )'
 ELSE ' ( < 1/jour )' END,
 '</td></tr><td bgcolor=\"LIGHTBLUE\" align=left>', 'Connexions invalides', '</td><td bgcolor=\"LIGHTBLUE\" align=right colspan=2>', sco.variable_value, 
CASE WHEN sco.variable_value > (upt.variable_value/86400) AND upt.variable_value/86400 > 1 THEN concat(' (', round(sco.variable_value / (floor(upt.variable_value/86400)),0), ' / jour)')
     WHEN sco.variable_value = 0 THEN ''
     WHEN upt.variable_value/86400 < 1 THEN ' ( uptime < 1 jour )'
 ELSE ' ( < 1/jour )' END,
 '</td>') FROM ", @tblname, ".global_status scl, ", @tblname, ".global_status sco, ", @tblname, ".global_status upt
 WHERE scl.variable_name = 'Aborted_clients'
 AND sco.variable_name = 'Aborted_connects'
 AND upt.variable_name='Uptime'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- *************************************** Threads
select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Threads</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Statistique</b></td><td bgcolor="WHITE" align=center colspan=2><b>Valeur</b></td></tr>';

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',IF(gs.variable_name='THREADS_CONNECTED', concat(gs.variable_name,' (Connexions en cours)'),gs.variable_name),'</td><td bgcolor=\"LIGHTBLUE\" align=right colspan=2>', gs.variable_value, '</td><tr>')
  FROM ", @tblname, ".global_status gs
  where gs.variable_name = 'Threads_created' or gs.variable_name = 'Threads_connected' or gs.variable_name = 'Connections'
order by gs.variable_name ASC
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 100 - ((Threads_created / Connections) * 100)
-- Thread hits ratio < 100% indicates a thread_cache_size to increase

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"WHITE\" align=left>Ratio Thread hits (Threads_created / Connections)</td><td bgcolor=\"LIGHTBLUE\" align=right colspan=2>', round(100 - ((gs.variable_value/gsq.variable_value) * 100), 2), '%</td><tr>')
  FROM ", @tblname, ".global_status gs, ", @tblname, ".global_status gsq
  where gs.variable_name = 'Threads_created' and gsq.variable_name = 'Connections'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

select '</td></tr></table>';
select '<br>';

-- *************************************** Statistiques réseau
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=2><font color="WHITE"><b>Statistiques r&eacute;seau</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>In/Out</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td></tr>';

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>Octets envoy&eacute;s</td><td bgcolor=\"LIGHTBLUE\" align=right>', IF(variable_value > 1048576, IF(variable_value > 1073741824, round(variable_value/1024/1024/1024,2), round(variable_value/1024/1024,2)), round(variable_value/1024,2)), IF(variable_value > 1048576, IF(variable_value > 1073741824,' Go', ' Mo'), ' Ko'), '</td></tr>')
  FROM ", @tblname, ".global_status
  where variable_name = 'Bytes_sent'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>Octets re&ccedil;us</td><td bgcolor=\"LIGHTBLUE\" align=right>', IF(variable_value > 1048576, IF(variable_value > 1073741824, round(variable_value/1024/1024/1024,2), round(variable_value/1024/1024,2)), round(variable_value/1024,2)), IF(variable_value > 1048576, IF(variable_value > 1073741824,' Go', ' Mo'), ' Ko'))
  FROM ", @tblname, ".global_status
  where variable_name = 'Bytes_received'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

select '</td></tr></table>';
select '<br>';

-- *************************************** Section Requêtes **************************
select '<hr>';
select '<div align=center><b><font color="WHITE">SECTION REQUETES</font></b></div>';

select '<hr>';

-- *************************************** Tris
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Tris</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Statistique</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td></tr>';

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left> Total des tris </td>', '<td bgcolor=\"LIGHTBLUE\" align=right>', gss.variable_value + gsr.variable_value, '</td></tr>')
  FROM ", @tblname, ".global_status gss, ", @tblname, ".global_status gsr
  where gss.variable_name = 'Sort_scan'
  and gsr.variable_name = 'Sort_range'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- ratio must be < 10%, else increase sort_buffer_size and read_rnd_buffer_size

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"WHITE\" align=left>Tris n&eacute;cessitant une table temporaire</td>', '<td bgcolor=\"LIGHTBLUE\" align=right>', IF (gss.variable_value + gsr.variable_value > 0, round((gsmp.variable_value / (gss.variable_value + gsr.variable_value) *100),2), 0), '%</td></tr>')
  FROM ", @tblname, ".global_status gss, ", @tblname, ".global_status gsr, ", @tblname, ".global_status gsmp
  where gss.variable_name = 'Sort_scan'
  and gsr.variable_name = 'Sort_range'
  and gsmp.variable_name = 'Sort_merge_passes'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

select '</table>';
select '<br>';

-- *************************************** Jointures sans indexes
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=2>  <table border=0 width=100%><tr><td width=2% Title="Si ce nombre est tr&egrave;s &eacute;lev&eacute;, activer le log des requ&ecirc;tes sans indexes : log_queries_not_using_indexes=1. Attention : les requ&ecirc;tes full scan (m&ecirc;me avec indexes) sont logu&eacute;es aussi."><img src="data:image/gif;base64,',@tips,'"></td><td align=center> <font color="WHITE"><b>Jointures sans indexes</b></font>  </td></tr></table> </td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Statistique</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td></tr>';

SET @sql = CONCAT("
select '<tr><td bgcolor=\"LIGHTBLUE\" align=left>','Nombre de jointures sans indexes', '</td>', concat('<td bgcolor=', IF((sum(gs.variable_value)/(squ.variable_value/86400)) > 100, '\"ORANGE\"','\"LIGHTBLUE\"'), ' align=right>'), sum(gs.variable_value), ' (', IF (squ.variable_value >= 86400, round(sum(gs.variable_value)/(squ.variable_value/86400)), sum(gs.variable_value)), ' / jour)</td><tr>'
  FROM ", @tblname, ".global_status gs, ", @tblname, ".global_status squ
  where gs.variable_name in ( 'Select_range_check', 'Select_full_join')
  and squ.variable_name = 'Uptime'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

select '</table>';
select '<br>';

-- *************************************** état des tables et indexes NOT OK
-- TODO : vérifier si des indexes sont à reconstruire ? CHECK TABLE sur toutes les tables (=mysqlcheck) de toutes les bases et récupérer Msg_test ?
-- SELECT table_name, engine, table_type, table_schema FROM information_schema.tables;
-- check table <schema_name>.<table_name>;

-- *************************************** Tables temporaires

SET @sql = CONCAT('
select sum(variable_value) into @tmp_total
  FROM ', @tblname, '.global_status
  where variable_name in ( \'Created_tmp_tables\', \'Created_tmp_disk_tables\', \'Created_tmp_files\')
');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Tables temporaires</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Statistique</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td><td bgcolor="WHITE" align=center><b>% du total tables temporaires</b></td></tr>';

SET @sql = CONCAT("
select concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>', CASE WHEN gs.variable_name='Created_tmp_disk_tables' THEN 'Tables sur disque' WHEN gs.variable_name='Created_tmp_tables' THEN 'Tables en m&eacute;moire' ELSE 'Tables en fichiers' END,'</td><td bgcolor=\"LIGHTBLUE\" align=right>', gs.variable_value,'</td><td bgcolor=\"',IF (round((gs.variable_value/@tmp_total)*100, 0) >= 30 AND gs.variable_name  = 'Created_tmp_disk_tables','ORANGE','LIGHTBLUE'),'\" align=right>', round((gs.variable_value/@tmp_total)*100, 2), '%</td><tr>')
  FROM ", @tblname, ".global_status gs
  where gs.variable_name in ( 'Created_tmp_tables', 'Created_tmp_disk_tables', 'Created_tmp_files')
  order by gs.variable_name DESC
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
  
select '</table>';
select '<br>';

-- *************************************** Slow queries
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=2><font color="WHITE"><b>Slow queries</b></font></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Journalisation slow queries</b></td><td bgcolor="WHITE" align=center><b>Fichier journal</b></td></tr>';

SET @sql = CONCAT("
select concat('<tr><td align=left bgcolor=\"', IF(sq.variable_value = 'ON','#33FF33','ORANGE'),'\">', sq.variable_value, '</td><td bgcolor=\"',IF(sq.variable_value = 'ON', 'LIGHTBLUE', 'LIGHTGREY'),'\" align=right>', IF(sq.variable_value = 'ON', sf.variable_value, ''), '</td></tr>')
	from ", @tblname, ".global_variables sq, ", @tblname, ".global_variables sf
	where sq.variable_name = 'SLOW_QUERY_LOG'
	and sf.variable_name = 'SLOW_QUERY_LOG_FILE'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select IF(sq.variable_value = 'ON',
	'<tr><td bgcolor=\"WHITE\" align=center width=40%><b>Statistique</b></td><td bgcolor=\"WHITE\" align=center><b>Valeur</b></td></tr>',
	'')
	from ", @tblname, ".global_variables sq
	where sq.variable_name = 'SLOW_QUERY_LOG'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select IF(sq.variable_value = 'ON',
	concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>Nombre slow queries (>', round(gv.variable_value,2), ' s)</td><td bgcolor=\"', IF (gs.variable_value > 0, 'ORANGE', 'LIGHTBLUE'), '\" align=right>', gs.variable_value, '</td><tr>'),
	'')
  FROM ", @tblname, ".global_status gs, ", @tblname, ".global_variables gv, ", @tblname, ".global_variables sq
  where gs.variable_name = 'Slow_queries' 
  and gv.variable_name = 'long_query_time'
  and sq.variable_name = 'SLOW_QUERY_LOG'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select IF(sq.variable_value = 'ON',
	concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>Nombre total requ&ecirc;tes</td><td bgcolor=\"LIGHTBLUE\" align=right>', gsq.variable_value, '</td><tr>'),
	'')
  FROM ", @tblname, ".global_status gsq, ", @tblname, ".global_variables sq
  where gsq.variable_name = 'Questions'
  and sq.variable_name = 'SLOW_QUERY_LOG'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select IF(sq.variable_value = 'ON',
	concat('<tr><td bgcolor=\"WHITE\" align=left>Ratio (slow queries/requ&ecirc;tes)</td><td bgcolor=\"', IF (round((gs.variable_value * 100) / gsq.variable_value, 2) > 1, 'ORANGE', 'LIGHTBLUE'), '\" align=right>', round((gs.variable_value * 100) / gsq.variable_value, 2), '%</td><tr>'),
	'')
  FROM ", @tblname, ".global_status gs, ", @tblname, ".global_status gsq, ", @tblname, ".global_variables sq
  where gs.variable_name = 'Slow_queries' 
  and gsq.variable_name = 'Questions'
  and sq.variable_name = 'SLOW_QUERY_LOG'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
select '</table>';
select '<br>';

--  *************************************** Section INNODB **************************
select '<hr>';
select '<div align=center><b><font color="WHITE">SECTION INNODB</font></b></div>';
select '<hr>';

select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=2><table border=0 width=100%><tr><td width=2% Title="La statistique Innodb_log_waits indique le nombre de fois o&ugrave; le buffer a &eacute;t&eacute; trop petit pour le nombre d\'op&eacute;rations &agrave; traiter. Si cette valeur est sup&eacute;rieure &agrave; 0, augmenter la valeur de INNODB_LOG_BUFFER_SIZE."><img src="data:image/gif;base64,',@tips,'"></td><td align=center><font color="WHITE"><b>InnoDB log waits</b></font></td></tr></table></td></tr>';
select '<tr><td bgcolor="WHITE" align=center width=40%><b>Statistique</b></td><td bgcolor="WHITE" align=center><b>Valeur</b></td></tr>';

SET @sql = CONCAT("
select '<tr><td bgcolor=\"LIGHTBLUE\" align=left>',gs.variable_name, '</td>', concat('<td bgcolor=', CASE WHEN ilb.variable_value < gs.variable_value > 0 THEN '\"ORANGE\"' WHEN gs.variable_value > ilb.variable_value THEN '\"RED\"' ELSE '\"#33FF33\"' END, ' align=right>'), gs.variable_value, ' </td><tr>'
  FROM ", @tblname, ".global_status gs, ", @tblname, ".global_variables ilb
  where gs.variable_name = 'Innodb_log_waits'
  and ilb.variable_name = 'INNODB_LOG_BUFFER_SIZE'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
select '</table>';
select '<br>';

-- !!! InnoDB by default in v8. Some of the queries below are no longer valid.
-- "sq.variable_value <> 'ON'" and "where sq.variable_name = 'ignore_builtin_innodb'" no more necessary

select IF(@tblname = 'INFORMATION_SCHEMA', '<table border=1 width=100% bgcolor="WHITE">', '');
select IF(@tblname = 'INFORMATION_SCHEMA', '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>InnoDB</b></font></td></tr>', '');
select IF(@tblname = 'INFORMATION_SCHEMA', '<tr><td bgcolor="WHITE" align=center width=40%><b>Activ&eacute; ?</b></td><td bgcolor="WHITE" align=center><b>Utilis&eacute; ?</b></td><td bgcolor="WHITE" align=center><b>Volumes</b></td></tr>', '');

SET @sql = CONCAT("
select IF(@tblname = 'INFORMATION_SCHEMA',
	concat('<tr><td align=left bgcolor=\"', IF(sq.variable_value = 'ON','ORANGE','#33FF33'),'\">', IF(sq.variable_value = 'ON','NO','YES'), '</td><td bgcolor=\"',IF(sq.variable_value = 'ON','LIGHTGREY','#33FF33'),'\">', IF(SUM(it.DATA_LENGTH+it.INDEX_LENGTH) > 0,'YES','NO'), '</td><td bgcolor=\"',IF(sq.variable_value = 'ON','LIGHTGREY','LIGHTBLUE'),'\" align=right>', IF(SUM(it.DATA_LENGTH+it.INDEX_LENGTH) > 0,concat('Datas: ',round(SUM(it.DATA_LENGTH)/1024/1024,2),' Mo, Indexes: ',round(SUM(it.INDEX_LENGTH)/1024/1024,2),' Mo'),'Ajouter skip-innodb &agrave; la configuration'), '</td></tr>'), '')
  from ", @tblname, ".global_variables sq, information_schema.TABLES it
  where sq.variable_name = 'ignore_builtin_innodb'
  and TABLE_SCHEMA NOT IN ('information_schema', 'performance_schema', 'mysql')
  AND ENGINE = 'InnoDB'
  GROUP BY ENGINE
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select IF(@tblname = 'INFORMATION_SCHEMA',
IF(count(*) = 0, '<td align=center bgcolor=\"ORANGE\"><b>NON</b></td><td bgcolor=\"LIGHTGREY\">&nbsp;</td><td bgcolor=\"LIGHTGREY\" align=right>&nbsp;</td></tr>',''), '')
  from ", @tblname, ".global_variables sq, information_schema.TABLES it
  where sq.variable_name = 'ignore_builtin_innodb'
  and TABLE_SCHEMA NOT IN ('information_schema', 'performance_schema', 'mysql')
  AND ENGINE = 'InnoDB'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select IF(@tblname = 'INFORMATION_SCHEMA',
	IF(sq.variable_value <> 'ON',
			'<tr><td bgcolor=\"#3399CC\" align=center colspan=3><font color=\"WHITE\"><b>Buffer pool InnoDB</b></font></td></tr>',''), '')
 	from ", @tblname, ".global_variables sq
 	where sq.variable_name = 'ignore_builtin_innodb'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT("
select IF(@tblname = 'INFORMATION_SCHEMA',
IF(sq.variable_value <> 'ON',
			'<tr><td bgcolor=\"WHITE\" align=center width=40%><b>Statistique</b></td><td bgcolor=\"WHITE\" align=center><b>Valeur</b></td><td bgcolor=\"WHITE\" align=center><b>Ratio d\"utilisation</b></td></tr>',''), '')
	from ", @tblname, ".global_variables sq
	where sq.variable_name = 'ignore_builtin_innodb'
");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

select IF(@tblname = 'PERFORMANCE_SCHEMA','<table border=1 width=100% bgcolor="WHITE">', '');
select IF(@tblname = 'PERFORMANCE_SCHEMA','<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Buffer pool InnoDB</b></font></td></tr>', '');

-- select '<!--';
SET @sql = IF(@tblname = 'INFORMATION_SCHEMA',
		"select IF(sq.variable_value <> 'ON',
		 concat('<tr><td align=left bgcolor=\"LIGHTBLUE\">Buffer pool</td>', '<td align=right bgcolor=\"LIGHTBLUE\">',round(((gspt.variable_value - gspf.variable_value) * gsps.variable_value)/1024/1024,2), ' Mo</td>', '<td align=right bgcolor=\"',IF(round((((gspt.variable_value - gspf.variable_value) / gspt.variable_value) * 100),2) > 98, 'ORANGE','LIGHTBLUE'),'\">', 		
		 IF (gspt.variable_value > 0, round((((gspt.variable_value - gspf.variable_value) / gspt.variable_value) * 100),2), 0), ' % de ', round((gspt.variable_value * gsps.variable_value)/1024/1024,2), ' Mo</td></tr>'), '')
	FROM INFORMATION_SCHEMA.global_variables sq, INFORMATION_SCHEMA.global_status gspt, INFORMATION_SCHEMA.global_status gspf, INFORMATION_SCHEMA.global_status gsps
	WHERE sq.variable_name = 'ignore_builtin_innodb'
	AND gspt.variable_name = 'Innodb_buffer_pool_pages_total'
	AND gspf.variable_name = 'Innodb_buffer_pool_pages_free'
	AND gsps.variable_name = 'Innodb_page_size'",
		"select concat('<tr><td align=left bgcolor=\"LIGHTBLUE\">Buffer pool</td>', '<td align=right bgcolor=\"LIGHTBLUE\">',round(((gspt.variable_value - gspf.variable_value) * gsps.variable_value)/1024/1024,2), ' Mo</td>', '<td align=right bgcolor=\"LIGHTBLUE\">', 		
		 IF (gspt.variable_value > 0, round((((gspt.variable_value - gspf.variable_value) / gspt.variable_value) * 100),2), 0), ' % de ', round((gspt.variable_value * gsps.variable_value)/1024/1024,2), ' Mo</td></tr>')
	FROM PERFORMANCE_SCHEMA.global_status gspt, PERFORMANCE_SCHEMA.global_status gspf, PERFORMANCE_SCHEMA.global_status gsps
	WHERE gspt.variable_name = 'Innodb_buffer_pool_pages_total'
	AND gspf.variable_name = 'Innodb_buffer_pool_pages_free'
	AND gsps.variable_name = 'Innodb_page_size'");
-- select '-->';
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- select '<!--';
SET @sql = IF(@tblname = 'INFORMATION_SCHEMA',
	"select IF(sq.variable_value <> 'ON',
		concat('<tr><td align=left bgcolor=\"LIGHTBLUE\">Read hits</td>', '<td align=right bgcolor=\"LIGHTBLUE\" colspan=2>', 
			IF(gsprr.variable_value > 0,concat(round((gsprr.variable_value / (gspr.variable_value + gsprr.variable_value) * 100),2), ' %'), 0),'</td></tr>'), '')
	FROM INFORMATION_SCHEMA.global_variables sq, INFORMATION_SCHEMA.global_status gsprr, INFORMATION_SCHEMA.global_status gspr
	WHERE sq.variable_name = 'ignore_builtin_innodb'
	AND gsprr.variable_name = 'Innodb_buffer_pool_read_requests'
	AND gspr.variable_name = 'Innodb_buffer_pool_reads'",
	"select concat('<tr><td align=left bgcolor=\"LIGHTBLUE\">Read hits</td>', '<td align=right bgcolor=\"LIGHTBLUE\" colspan=2>', 
			IF(gsprr.variable_value > 0,concat(round((gsprr.variable_value / (gspr.variable_value + gsprr.variable_value) * 100),2), ' %'), 0),'</td></tr>')
	FROM PERFORMANCE_SCHEMA.global_status gsprr, PERFORMANCE_SCHEMA.global_status gspr
	WHERE gsprr.variable_name = 'Innodb_buffer_pool_read_requests'
	AND gspr.variable_name = 'Innodb_buffer_pool_reads'");
-- select '-->';
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- select '<!--';
SET @sql = IF(@tblname = 'INFORMATION_SCHEMA',
	"select IF(sq.variable_value <> 'ON',
		concat('<tr><td align=left bgcolor=\"LIGHTBLUE\">Current locks waits</td>', '<td align=right bgcolor=\"',IF(gsl.variable_value > 100, 'ORANGE','LIGHTBLUE'),'\" colspan=2>', 
				gsl.variable_value, '</td></tr>'), '')
	FROM INFORMATION_SCHEMA.global_variables sq, INFORMATION_SCHEMA.global_status gsl
	WHERE sq.variable_name = 'ignore_builtin_innodb'
	AND gsl.variable_name = 'Innodb_row_lock_current_waits'",
		"select concat('<tr><td align=left bgcolor=\"LIGHTBLUE\">Current locks waits</td>', '<td align=right bgcolor=\"',IF(gsl.variable_value > 100, 'ORANGE','LIGHTBLUE'),'\" colspan=2>', 
				gsl.variable_value, '</td></tr>')
	FROM PERFORMANCE_SCHEMA.global_status gsl
	WHERE gsl.variable_name = 'Innodb_row_lock_current_waits'");
-- select '-->';
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- select '<!--';
SET @sql := IF(@tblname = 'INFORMATION_SCHEMA',
	"select IF(sq.variable_value <> 'ON',
		concat('<tr><td align=left bgcolor=\"LIGHTBLUE\">Sum locks waits</td>', '<td align=right bgcolor=\"',IF(gsl.variable_value > 100, 'ORANGE','LIGHTBLUE'),'\" colspan=2>', 
				gsl.variable_value, '</td></tr>'), '')
	FROM INFORMATION_SCHEMA.global_variables sq, INFORMATION_SCHEMA.global_status gsl
	WHERE sq.variable_name = 'ignore_builtin_innodb'
	AND gsl.variable_name = 'Innodb_row_lock_waits'",
	"select concat('<tr><td align=left bgcolor=\"LIGHTBLUE\">Sum locks waits</td>', '<td align=right bgcolor=\"',IF(gsl.variable_value > 100, 'ORANGE','LIGHTBLUE'),'\" colspan=2>', 
				gsl.variable_value, '</td></tr>')
	FROM PERFORMANCE_SCHEMA.global_status gsl
	WHERE gsl.variable_name = 'Innodb_row_lock_waits'");
-- select '-->';
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- To check : display buffers values even if ignore_builtin_innodb not present ?
-- select IF(count(*) = 0,'<tr><td bgcolor="LIGHTGREY" align=center width=40%>&nbsp;</td><td bgcolor="LIGHTGREY" align=center>&nbsp;</td><td bgcolor="LIGHTGREY" align=center></td>&nbsp;</tr>','')
--  from INFORMATION_SCHEMA.global_variables sq, information_schema.TABLES it
--  where sq.variable_name = 'ignore_builtin_innodb'
--  and TABLE_SCHEMA NOT IN ('information_schema', 'performance_schema', 'mysql')
--  AND ENGINE = 'InnoDB';
-- v8 :
-- select IF(count(*) = 0,'<tr><td bgcolor="LIGHTGREY" align=center width=40%>&nbsp;</td><td bgcolor="LIGHTGREY" align=center>&nbsp;</td><td bgcolor="LIGHTGREY" align=center></td>&nbsp;</tr>','')
--   from information_schema.TABLES it
--   where TABLE_SCHEMA NOT IN ('information_schema', 'performance_schema', 'mysql')
--  AND ENGINE = 'InnoDB';

select '</table>';
select '<br>';

--  *************************************** Section Utilisateurs **************************
 select '<hr>';
 select '<div align=center><b><font color="WHITE">SECTION UTILISATEURS ET DROITS</font></b></div>';

 select '<hr>';
-- TODO : for mysql < 5.7 : col "password". For mysql => 5.7 : col "authentication_string"
-- *************************************** Liste des utilisateurs
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Liste des utilisateurs</b></font></td></tr>';

SET @sql = IF(substring(@@version,1,3) < 5.7 AND locate(lower(@@version),'mariadb') = 0,
   "select concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>','\\'', user, '\\'','@','\\'', host, '\\'', '<!-- ', Password, ' -->','</td></tr>') from mysql.user WHERE User != ''",
   "select concat('<tr><td bgcolor=\"LIGHTBLUE\" align=left>','\\'', user, '\\'','@','\\'', host, '\\'', '<!-- ', authentication_string, ' -->','</td></tr>') from mysql.user WHERE User != ''");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

select '</table>';
select '<br>';

-- *************************************** Liste des droits
select '<table border=1 width=100% bgcolor="WHITE">';
select '<tr><td bgcolor="#3399CC" align=center colspan=3><font color="WHITE"><b>Droits</b></font></td></tr>';

/* https://dba.stackexchange.com/questions/23265/mysql-show-grants-for-all-users */

-- Database.Table.Column - Specific Grants
select '<tr><td bgcolor="WHITE" align=center colspan=3><b>Liste des GRANT (reconstruits)</b></td></tr>';

-- substring(@@version,1,3) <= 5.1 AND locate(lower(@@version),'mariadb') = 0

SET @sql = IF (substring(@@version,1,3) <= 5.1 AND locate(lower(@@version),'mariadb') = 0,
"SELECT
    CONCAT('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',
           'GRANT ',UPPER(gcl.Column_priv),' (',GROUP_CONCAT(gcl.Column_name),') ',
                 'ON `',gcl.Db,'`.`',gcl.Table_name,'` ',
                 'TO \\'',gcl.User,'\\'@\\'',gcl.Host,'\\';',
                 '</td></tr>')
FROM mysql.columns_priv gcl
GROUP BY CONCAT(gcl.Db,gcl.Table_name,gcl.User,gcl.Host)
-- SELECT * FROM mysql.columns_priv

UNION

-- Database.Table - Specific Grants
SELECT
    CONCAT('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',
        'GRANT ',UPPER(gtb.Table_priv),' ',
        'ON `',gtb.Db,'`.`',gtb.Table_name,'` ',
        'TO \\'',gtb.User,'\\'@\\'',gtb.Host,'\\';',
        '</td></tr>')
FROM mysql.tables_priv gtb
WHERE gtb.Table_priv!=''
-- SELECT * FROM mysql.tables_priv

UNION

-- Database - Specific Grants
SELECT
    CONCAT('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',
        'GRANT ',
        CONCAT_WS(',',
            IF(gdb.Select_priv='Y','SELECT',NULL),
            IF(gdb.Insert_priv='Y','INSERT',NULL),
            IF(gdb.Update_priv='Y','UPDATE',NULL),
            IF(gdb.Delete_priv='Y','DELETE',NULL),
            IF(gdb.Create_priv='Y','CREATE',NULL),
            IF(gdb.Drop_priv='Y','DROP',NULL),
            IF(gdb.Grant_priv='Y','GRANT',NULL),
            IF(gdb.References_priv='Y','REFERENCES',NULL),
            IF(gdb.Index_priv='Y','INDEX',NULL),
            IF(gdb.Alter_priv='Y','ALTER',NULL),
            IF(gdb.Create_tmp_table_priv='Y','CREATE TEMPORARY TABLES',NULL),
            IF(gdb.Lock_tables_priv='Y','LOCK TABLES',NULL),
            IF(gdb.Create_view_priv='Y','CREATE VIEW',NULL),
            IF(gdb.Show_view_priv='Y','SHOW VIEW',NULL),
            IF(gdb.Create_routine_priv='Y','CREATE ROUTINE',NULL),
            IF(gdb.Alter_routine_priv='Y','ALTER ROUTINE',NULL),
            IF(gdb.Execute_priv='Y','EXECUTE',NULL),
            IF(gdb.Event_priv='Y','EVENT',NULL),
            IF(gdb.Trigger_priv='Y','TRIGGER',NULL)
        ),
        ' ON `',gdb.Db,'`.* TO \\'',gdb.User,'\\'@\\'',gdb.Host,'\\';'
        '</td></tr>')
FROM mysql.db gdb
WHERE gdb.Db != '' AND gdb.User != ''

UNION

-- User - Specific Grants

SELECT
    CONCAT('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',
        'GRANT ',
        IF((gus.Select_priv='N')&(gus.Insert_priv='N')&(gus.Update_priv='N')&(gus.Delete_priv='N')&(gus.Create_priv='N')&(gus.Drop_priv='N')&(gus.Reload_priv='N')&(gus.Shutdown_priv='N')&(gus.Process_priv='N')&(gus.File_priv='N')&(gus.References_priv='N')&(gus.Index_priv='N')&(gus.Alter_priv='N')&(gus.Show_db_priv='N')&(gus.Super_priv='N')&(gus.Create_tmp_table_priv='N')&(gus.Lock_tables_priv='N')&(gus.Execute_priv='N')&(gus.Repl_slave_priv='N')&(gus.Repl_client_priv='N')&(gus.Create_view_priv='N')&(gus.Show_view_priv='N')&(gus.Create_routine_priv='N')&(gus.Alter_routine_priv='N')&(gus.Create_user_priv='N')&(gus.Event_priv='N')&(gus.Trigger_priv='N')&(gus.Grant_priv='N'),
            'USAGE',
            IF((gus.Select_priv='Y')&(gus.Insert_priv='Y')&(gus.Update_priv='Y')&(gus.Delete_priv='Y')&(gus.Create_priv='Y')&(gus.Drop_priv='Y')&(gus.Reload_priv='Y')&(gus.Shutdown_priv='Y')&(gus.Process_priv='Y')&(gus.File_priv='Y')&(gus.References_priv='Y')&(gus.Index_priv='Y')&(gus.Alter_priv='Y')&(gus.Show_db_priv='Y')&(gus.Super_priv='Y')&(gus.Create_tmp_table_priv='Y')&(gus.Lock_tables_priv='Y')&(gus.Execute_priv='Y')&(gus.Repl_slave_priv='Y')&(gus.Repl_client_priv='Y')&(gus.Create_view_priv='Y')&(gus.Show_view_priv='Y')&(gus.Create_routine_priv='Y')&(gus.Alter_routine_priv='Y')&(gus.Create_user_priv='Y')&(gus.Event_priv='Y')&(gus.Trigger_priv='Y')&(gus.Grant_priv='Y'),
                'ALL PRIVILEGES',
                CONCAT_WS(',',
                    IF(gus.Select_priv='Y','SELECT',NULL),
                    IF(gus.Insert_priv='Y','INSERT',NULL),
                    IF(gus.Update_priv='Y','UPDATE',NULL),
                    IF(gus.Delete_priv='Y','DELETE',NULL),
                    IF(gus.Create_priv='Y','CREATE',NULL),
                    IF(gus.Drop_priv='Y','DROP',NULL),
                    IF(gus.Reload_priv='Y','RELOAD',NULL),
                    IF(gus.Shutdown_priv='Y','SHUTDOWN',NULL),
                    IF(gus.Process_priv='Y','PROCESS',NULL),
                    IF(gus.File_priv='Y','FILE',NULL),
                    IF(gus.References_priv='Y','REFERENCES',NULL),
                    IF(gus.Index_priv='Y','INDEX',NULL),
                    IF(gus.Alter_priv='Y','ALTER',NULL),
                    IF(gus.Show_db_priv='Y','SHOW DATABASES',NULL),
                    IF(gus.Super_priv='Y','SUPER',NULL),
                    IF(gus.Create_tmp_table_priv='Y','CREATE TEMPORARY TABLES',NULL),
                    IF(gus.Lock_tables_priv='Y','LOCK TABLES',NULL),
                    IF(gus.Execute_priv='Y','EXECUTE',NULL),
                    IF(gus.Repl_slave_priv='Y','REPLICATION SLAVE',NULL),
                    IF(gus.Repl_client_priv='Y','REPLICATION CLIENT',NULL),
                    IF(gus.Create_view_priv='Y','CREATE VIEW',NULL),
                    IF(gus.Show_view_priv='Y','SHOW VIEW',NULL),
                    IF(gus.Create_routine_priv='Y','CREATE ROUTINE',NULL),
                    IF(gus.Alter_routine_priv='Y','ALTER ROUTINE',NULL),
                    IF(gus.Create_user_priv='Y','CREATE USER',NULL),
                    IF(gus.Event_priv='Y','EVENT',NULL),
                    IF(gus.Trigger_priv='Y','TRIGGER',NULL)
                )
            )
        ),
        ' ON *.* TO \\'',gus.User,'\\'@\\'',gus.Host,'\\' REQUIRE ',
        CASE gus.ssl_type
            WHEN 'ANY' THEN
                'SSL '
            WHEN 'X509' THEN
                'X509 '
            WHEN 'SPECIFIED' THEN
                CONCAT_WS('AND ',
                    IF((LENGTH(gus.ssl_cipher)>0),CONCAT('CIPHER \'',CONVERT(gus.ssl_cipher USING utf8),'\' '),NULL),
                    IF((LENGTH(gus.x509_issuer)>0),CONCAT('ISSUER \'',CONVERT(gus.ssl_cipher USING utf8),'\' '),NULL),
                    IF((LENGTH(gus.x509_subject)>0),CONCAT('SUBJECT \'',CONVERT(gus.ssl_cipher USING utf8),'\' '),NULL)
                )
            ELSE 'NONE '
        END,
        'WITH ',
        IF(gus.Grant_priv='Y','GRANT OPTION ',''),
        'MAX_QUERIES_PER_HOUR ',gus.max_questions,' ',
        'MAX_CONNECTIONS_PER_HOUR ',gus.max_connections,' ',
        'MAX_UPDATES_PER_HOUR ',gus.max_updates,' ',
        'MAX_USER_CONNECTIONS ',gus.max_user_connections,
        ';',
        '</td></tr>')
FROM mysql.user gus
WHERE gus.User != ''",

"SELECT
    CONCAT('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',
           'GRANT ',UPPER(gcl.Column_priv),' (',GROUP_CONCAT(gcl.Column_name),') ',
                 'ON `',gcl.Db,'`.`',gcl.Table_name,'` ',
                 'TO \\'',gcl.User,'\\'@\\'',gcl.Host,'\\';',
                 '</td></tr>')
FROM mysql.columns_priv gcl
GROUP BY CONCAT(gcl.Db,gcl.Table_name,gcl.User,gcl.Host)
-- SELECT * FROM mysql.columns_priv

UNION

-- Database.Table - Specific Grants
SELECT
    CONCAT('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',
        'GRANT ',UPPER(gtb.Table_priv),' ',
        'ON `',gtb.Db,'`.`',gtb.Table_name,'` ',
        'TO \\'',gtb.User,'\\'@\\'',gtb.Host,'\\';',
        '</td></tr>')
FROM mysql.tables_priv gtb
WHERE gtb.Table_priv!=''
-- SELECT * FROM mysql.tables_priv

UNION

-- Database - Specific Grants
SELECT
    CONCAT('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',
        'GRANT ',
        CONCAT_WS(',',
            IF(gdb.Select_priv='Y','SELECT',NULL),
            IF(gdb.Insert_priv='Y','INSERT',NULL),
            IF(gdb.Update_priv='Y','UPDATE',NULL),
            IF(gdb.Delete_priv='Y','DELETE',NULL),
            IF(gdb.Create_priv='Y','CREATE',NULL),
            IF(gdb.Drop_priv='Y','DROP',NULL),
            IF(gdb.Grant_priv='Y','GRANT',NULL),
            IF(gdb.References_priv='Y','REFERENCES',NULL),
            IF(gdb.Index_priv='Y','INDEX',NULL),
            IF(gdb.Alter_priv='Y','ALTER',NULL),
            IF(gdb.Create_tmp_table_priv='Y','CREATE TEMPORARY TABLES',NULL),
            IF(gdb.Lock_tables_priv='Y','LOCK TABLES',NULL),
            IF(gdb.Create_view_priv='Y','CREATE VIEW',NULL),
            IF(gdb.Show_view_priv='Y','SHOW VIEW',NULL),
            IF(gdb.Create_routine_priv='Y','CREATE ROUTINE',NULL),
            IF(gdb.Alter_routine_priv='Y','ALTER ROUTINE',NULL),
            IF(gdb.Execute_priv='Y','EXECUTE',NULL),
            IF(gdb.Event_priv='Y','EVENT',NULL),
            IF(gdb.Trigger_priv='Y','TRIGGER',NULL)
        ),
        ' ON `',gdb.Db,'`.* TO \\'',gdb.User,'\\'@\\'',gdb.Host,'\\';'
        '</td></tr>')
FROM mysql.db gdb
WHERE gdb.Db != '' AND gdb.User != ''

UNION

-- User - Specific Grants

SELECT
    CONCAT('<tr><td bgcolor=\"LIGHTBLUE\" align=left>',
        'GRANT ',
        IF((gus.Select_priv='N')&(gus.Insert_priv='N')&(gus.Update_priv='N')&(gus.Delete_priv='N')&(gus.Create_priv='N')&(gus.Drop_priv='N')&(gus.Reload_priv='N')&(gus.Shutdown_priv='N')&(gus.Process_priv='N')&(gus.File_priv='N')&(gus.References_priv='N')&(gus.Index_priv='N')&(gus.Alter_priv='N')&(gus.Show_db_priv='N')&(gus.Super_priv='N')&(gus.Create_tmp_table_priv='N')&(gus.Lock_tables_priv='N')&(gus.Execute_priv='N')&(gus.Repl_slave_priv='N')&(gus.Repl_client_priv='N')&(gus.Create_view_priv='N')&(gus.Show_view_priv='N')&(gus.Create_routine_priv='N')&(gus.Alter_routine_priv='N')&(gus.Create_user_priv='N')&(gus.Event_priv='N')&(gus.Trigger_priv='N')&(gus.Create_tablespace_priv='N')&(gus.Grant_priv='N'),
            'USAGE',
            IF((gus.Select_priv='Y')&(gus.Insert_priv='Y')&(gus.Update_priv='Y')&(gus.Delete_priv='Y')&(gus.Create_priv='Y')&(gus.Drop_priv='Y')&(gus.Reload_priv='Y')&(gus.Shutdown_priv='Y')&(gus.Process_priv='Y')&(gus.File_priv='Y')&(gus.References_priv='Y')&(gus.Index_priv='Y')&(gus.Alter_priv='Y')&(gus.Show_db_priv='Y')&(gus.Super_priv='Y')&(gus.Create_tmp_table_priv='Y')&(gus.Lock_tables_priv='Y')&(gus.Execute_priv='Y')&(gus.Repl_slave_priv='Y')&(gus.Repl_client_priv='Y')&(gus.Create_view_priv='Y')&(gus.Show_view_priv='Y')&(gus.Create_routine_priv='Y')&(gus.Alter_routine_priv='Y')&(gus.Create_user_priv='Y')&(gus.Event_priv='Y')&(gus.Trigger_priv='Y')&(gus.Create_tablespace_priv='Y')&(gus.Grant_priv='Y'),
                'ALL PRIVILEGES',
                CONCAT_WS(',',
                    IF(gus.Select_priv='Y','SELECT',NULL),
                    IF(gus.Insert_priv='Y','INSERT',NULL),
                    IF(gus.Update_priv='Y','UPDATE',NULL),
                    IF(gus.Delete_priv='Y','DELETE',NULL),
                    IF(gus.Create_priv='Y','CREATE',NULL),
                    IF(gus.Drop_priv='Y','DROP',NULL),
                    IF(gus.Reload_priv='Y','RELOAD',NULL),
                    IF(gus.Shutdown_priv='Y','SHUTDOWN',NULL),
                    IF(gus.Process_priv='Y','PROCESS',NULL),
                    IF(gus.File_priv='Y','FILE',NULL),
                    IF(gus.References_priv='Y','REFERENCES',NULL),
                    IF(gus.Index_priv='Y','INDEX',NULL),
                    IF(gus.Alter_priv='Y','ALTER',NULL),
                    IF(gus.Show_db_priv='Y','SHOW DATABASES',NULL),
                    IF(gus.Super_priv='Y','SUPER',NULL),
                    IF(gus.Create_tmp_table_priv='Y','CREATE TEMPORARY TABLES',NULL),
                    IF(gus.Lock_tables_priv='Y','LOCK TABLES',NULL),
                    IF(gus.Execute_priv='Y','EXECUTE',NULL),
                    IF(gus.Repl_slave_priv='Y','REPLICATION SLAVE',NULL),
                    IF(gus.Repl_client_priv='Y','REPLICATION CLIENT',NULL),
                    IF(gus.Create_view_priv='Y','CREATE VIEW',NULL),
                    IF(gus.Show_view_priv='Y','SHOW VIEW',NULL),
                    IF(gus.Create_routine_priv='Y','CREATE ROUTINE',NULL),
                    IF(gus.Alter_routine_priv='Y','ALTER ROUTINE',NULL),
                    IF(gus.Create_user_priv='Y','CREATE USER',NULL),
                    IF(gus.Event_priv='Y','EVENT',NULL),
                    IF(gus.Trigger_priv='Y','TRIGGER',NULL),
                    IF(gus.Create_tablespace_priv='Y','CREATE TABLESPACE',NULL)
                )
            )
        ),
        ' ON *.* TO \\'',gus.User,'\\'@\\'',gus.Host,'\\' REQUIRE ',
        CASE gus.ssl_type
            WHEN 'ANY' THEN
                'SSL '
            WHEN 'X509' THEN
                'X509 '
            WHEN 'SPECIFIED' THEN
                CONCAT_WS('AND ',
                    IF((LENGTH(gus.ssl_cipher)>0),CONCAT('CIPHER \'',CONVERT(gus.ssl_cipher USING utf8),'\' '),NULL),
                    IF((LENGTH(gus.x509_issuer)>0),CONCAT('ISSUER \'',CONVERT(gus.ssl_cipher USING utf8),'\' '),NULL),
                    IF((LENGTH(gus.x509_subject)>0),CONCAT('SUBJECT \'',CONVERT(gus.ssl_cipher USING utf8),'\' '),NULL)
                )
            ELSE 'NONE '
        END,
        'WITH ',
        IF(gus.Grant_priv='Y','GRANT OPTION ',''),
        'MAX_QUERIES_PER_HOUR ',gus.max_questions,' ',
        'MAX_CONNECTIONS_PER_HOUR ',gus.max_connections,' ',
        'MAX_UPDATES_PER_HOUR ',gus.max_updates,' ',
        'MAX_USER_CONNECTIONS ',gus.max_user_connections,
        ';',
        '</td></tr>')
FROM mysql.user gus
WHERE gus.User != ''");
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

select '</table>';
select '<br>';

select '<hr>';

-- ********************** Percona ******************************
-- show status like wsrep
-- si 'wsrep_ready' = ON alors lister les autres paramètres
-- 
-- étudier https://www.percona.com/sites/default/files/innodb_performance_optimization_final.pdf

-- *************************************** Fin de rapport **************************
select '</body>'; -- </td></tr>
select '</html>';
