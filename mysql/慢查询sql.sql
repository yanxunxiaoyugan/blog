//查询是否开启慢查询日志
show variables like 'slow_query%';
//开启慢查询
set global slow_query_log='ON';
//设置慢查询的时间
set global long_query_time=2;
//开启慢查询
set global slow_query_log=1;
//查看慢查询sql的数量
show global status like '%Slow_queries%';