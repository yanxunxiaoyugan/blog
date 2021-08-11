1. 哈希索引和B-tree索引的区别
   1. hash只支持等值查询,b-tree支持范围查询
   2. hash无法利用索引进行排序，也不支持模糊查询
   3. hash不支持多列索引的最左匹配规则
   4. hash在数据量大的时候会有hash冲突的问题导致查询速度下降，B-tree的查询速度比较平均
   5. hash底层一般使用数组实现，需要把数据全部加载到内存
2. 

![img](https://p3-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/7254b27eb00a4689b67b1dced3fae74b~tplv-k3u1fbpfcp-zoom-1.image?imageslim)