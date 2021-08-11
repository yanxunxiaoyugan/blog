1. synchronized的理解：

   > 1. synchronized关键字提供了一种锁的机制，能够保证共享变量的互斥访问
   > 2. synchronized包含了monitor enter 和monitor exit两个jvm指令，在monitor enter执行成功之前必须从主存中获取数据，在monitor exit执行成功之前把共享变量更新的值刷新回主存
   > 3. synchronized遵守happens-before原则，一个monitor exit之前一定有一个monitor enter

2. wait和sleep

   > 相同点
   >
   > 1. wait和sleep都可以使线程进入阻塞状态
   > 2. wait和sleep方法都是可中断方法，被中断后都会收到中断异常
   > 3. wait是Object方法，sleep是Thread的方法

