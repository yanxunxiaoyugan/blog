//��ѯ�Ƿ�������ѯ��־
show variables like 'slow_query%';
//��������ѯ
set global slow_query_log='ON';
//��������ѯ��ʱ��
set global long_query_time=2;
//��������ѯ
set global slow_query_log=1;
//�鿴����ѯsql������
show global status like '%Slow_queries%';