## mysql

1. mysql是一个开源的关系型数据库

2. Innodb和Myisam存储引擎

   1. Innodb

      ***

      1. Innodb的关键特性

         1. 插入缓冲（Insert Buffer）

            > 

         2. 两次写 （Double Write）

         3. 自适应哈希索引 （Adaptive Hash Index）

         4. 异步IO (Async IO)

         5. 刷新邻接页（Flush Neighbor Page）

         ***

      2. Innodb的文件

         

      ***

      3. Innodb的表

         1. 索引组织表

             ​		在Innodb存储引擎中，表都是根据主键顺序组织存放的，这种存储方式的表称为==索引组织表==。在Innodb存储引擎中，每张表都有个主键，如果在创建表的时候没有显示的指定主键，那么Innodb会按照下面的方式选择或创建主键：

             > 1. 首先判断表中是否有==非空（not null）的唯一索引==，如果有，则该列为主键，如果有多个，则选择第一个非空的唯一字段为主键（注意：主键的选择不是建表时列的顺序，而是定义索引的顺序）
             > 2. 如果不符合上述条件，Innodb会自动创建一个==6字节==大小的指针作为主键
             
         2. Innodb的逻辑存储结构

             ​		Innodb的所有数据都被逻辑的存放在一个空间里面，称为==表空间==。表空间由==段(segment)==、==区(extent)==、==页(page)==组成，Innodb的逻辑存储结构如图所示：

             ![image-20201107105517029](D:\note\images\mysql\Innodb-logical-struct.png)

             ​	2.1.  Innodb的表空间

             ​		表空间可以看做是InnoDB存储引擎逻辑结构的最高层，所有的数据都存放在表空间中。在默认情况下InnoDB存储引擎有一个==共享表空间ibdata1==，即所有数据都存放在这个表空间内。

             ​	如果用户启用了参数==innodb_file_per_table==(在mysql5.7中，默认开启)，则每张表内的数据可以单独放到一个表空间内。如果启用了innodb_file_per_table的参数，需要注意的是每张表的表空间内存放的只是数据、索引和插入缓冲Bitmap页，其他类的数据，如回滚（undo）信息，插入缓冲索引页、系统事务信息，二次写缓冲（Double write buffer）等还是存放在原来的共享表空间内。这同时也说明了另一个问题：即使在启用了参数innodb_file_per_table之后，共享表空间还是会不断地增加其大小。

             ​		需要注意的是，即使回滚了事务，ibdata1的大小并不会变小（即不会删除undo.log）。虽然Innodb不会回收这些空间，但是会自动判断这些undo信息是否还需要，如果不需要，会把这些空间标记为可用空间，供下次undo使用。

             ​	2.2 Innodb的段空间

             ​		表空间是由各个段组成的，常见的段有数据段、索引段、回滚段等。因为前面已经介绍过了InnoDB存储引擎表是索引组织的（index organized），因此数据即索引，索引即数据。那么数据段即为B+树的叶子节点（图4-1的Leaf node segment），索引段即为B+树的非索引节点（图4-1的Non-leaf node segment）。回滚段较为特殊，将会在后面的章节进行单独的介绍。在InnoDB存储引擎中，对段的管理都是由引擎自身所完成，DBA不能也没有必要对其进行控制。这和Oracle数据库中的自动段空间管理（ASSM）类似，从一定程度上简化了DBA对于段的管理。

         ***

      4. Innodb的锁
