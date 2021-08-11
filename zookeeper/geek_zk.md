1. zk概述

   > zookeeper采用树形结构在存储，树的每一个节点叫做znode
   >
   > 1. zk使用unix风格的路径名来定位znode
   >
   > 2. znode的数据只支持全量写入和全量读取，不支持普通文件系统的部分写入和部分读取。
   > 3. data tree的api都是 wait-free的，即正在执行的api调用不会影响其他api的完成

2. znode概述

   >  一个znode可以是持久性的，也可以是临时性的
   >
   > 1. 持久性的znode（persistent）：在创建完成之后即使zk集群宕机或者client宕机也不会丢失
   > 2. 临时性的znode（ephemeral）：client宕机或者client在指定的timeout没有给指定的zk集群发消息，znode会消失。
   >
   > znode可以使顺序的。每一个顺序的znode关联一个唯一的单调递增的整数，作为znode名字的后缀。
   >
   > 所以zk主要有以上4中znode

3. zk的基本命令

   > create  znodeName //创建一个znode（永久节点 使用-e 创建临时节点）
   >
   > stat -w znodeNaem //监控znode 的状态

4. zk的数据一致性

   > 1. 全局可线性化（lineariable）写入： 先到达leader的写请求会被先处理，leader决定写请求的执行顺序
   > 2. 客户端FIFO顺序： 来自给定客户端的请求按照发送顺序执行