一、redis全局介绍

1.  使用源码方式安装好了redis以后，在/usr/local/bin下面会多了几个命令

- - redis-benchmark     #redis的基准测试工具
  - redis-check-aof       #redis AOF持久化文件检测和修复工具
  - redis-check-rdb      #redis RDB持久化文件检测和修复工具
  - redis-cli                   #redis客户端
  - redis-sentinel          #启动redis sentinal
  - redis-server      #启动redis

2. 全局命令

- - keys                #把所有的key输出 不推荐使用
  - dbsize              #输出键总数
  - exists {key}         #查询key是否存在 1 ：存在，0：不存在
  - del {key}            #删除key  返回结果为删除成功的个数  如果返回结果为0：不存在
  - expire {key}          #为key设置有效时间，单位：秒。
  - ttl {key}                 #返回值：大于0：键的剩余过期时间，-1：键没有设置有效时间，-2：键不存在
  - type {key}             #返回值为key 的类型（对外的数据结构），如果返回none，说明key不存在
  - object encoding {key}  #返回key的内部结构，外部结果和内部结构的关系如图所示:
  - ![image.png](D:\note\images\redis\redis-data-struct.png)

3. redis是单线程速度却比较快的原因：

1. 1. 纯内存访问，redis把所有的数据全部放在内存中
   2. 非阻塞IO，使用reactor模型的（有三种模式，单reactor模型，多reactor模型，主从reactor模型）（与之对应的是proactor模型），内部用的是epoll函数将读写等操作转换成事件。
   3. 单线程可以避免了线程切换以及线程竞态带来的消耗(值得注意的是，如果某个命令执行事件很长，将会阻塞其他操作)

二、redis的基本数据类型

1. redis数据结构之String

   1. string的基本命令![image.png](D:\note\images\redis\redis-string-time-complexity.png)
   2. string类型的内部编码：

   ​	string类型的内部编码有3种：

   	int： 8个字节的长整形
   	
   	embstr：小于39个字节的字符串
   	
   	raw： 大于39个字节的字符串

   3.  string类型的使用场景：

   	>1、缓存

	>
   	>2、计数
   	>
   	>3、共享session
   	>
   	>4、限速（手机验证码）

2. redis数据结构之hash
   
   1. hash的基本命令
   
      ![image-20201101101919471](D:\note\images\redis\redis-hash-command-and-time-complexity.png)
   
      2. hash的内部编码
   
         > 1、ziplist（压缩列表）：当哈希类型元素个数小于hash-max-ziplist-entries配置（默认512个）、同时所有值都小于hash-max-ziplist-value配置（默认64字节）时，Redis会使用ziplist作为哈希的内部实现，ziplist使用更加紧凑的结构实现多个元素的连续存储，所以在节省内存方面比hashtable更加优秀。
         > 2、hashtable（哈希表）：当哈希类型无法满足ziplist的条件时，Redis会使用hashtable作为哈希的内部实现，因为此时ziplist的读写效率会下降，而hashtable的读写时间复杂度为O（1）。 
   
         总结：
   
         1. 当field个数比较少且没有大的value时，内部编码为ziplist。
         2. 当有value大于64字节，内部编码会由ziplist变为hashtable
         3. 当field个数超过512，内部编码也会由ziplist变为hashtable
   
      3. hash的使用场景
   
         >1、缓存对象
         >
         >-  直接缓存对象：简单直观，但是要控制ziplist和hashTable的转换
         >
         >-  序列化后缓存： 可以提高内存使用效率，但是增加了序列化和反序列化的开销
   
3. redis数据结构之list
   
   1. list的基本命令
   
      ![image-20201101103844249](D:\note\images\redis\redis-list-command-and-time-complexity.png)
   
      ![image-20201101105937968](D:\note\images\redis\redis-list-command-and-time-complexity-2.png)
   
   2. 内部结构
   
      >1、ziplist（压缩列表）：当列表的元素个数小于list-max-ziplist-entries配置（默认512个），同时列表中每个元素的值都小于list-max-ziplist-value配置时（默认64字节），Redis会选用ziplist来作为列表的内部实现来减少内存的使用。
      >2、linkedlist（链表）：当列表类型无法满足ziplist的条件时，Redis会使用linkedlist作为列表的内部实现。
   
      总结：
   
      > 1. 当元素个数较少且没有大元素时，内部编码为ziplist
      > 2. 当元素个数超过512个，内部编码变为linkedlist
      > 3. 或者当某个元素超过64字节，内部编码也会变为linkedlist
   
   3. 使用场景
   
      > 1. 消息队列
      > 2. 文章列表
   
4. redis数据结构之set
   
   1. zset的基本命令
   
5. redis数据结构之zset
   
   1. 