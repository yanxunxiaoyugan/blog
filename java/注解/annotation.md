## java的注解



1. 元注解

   java的元注解有5个分别是：@Targert, @Retention,@Inherited,@Repeatable,@Document

   1. @Target

      > @Target注解用来声明注解可以用在什么地方,它的值需要从枚举类ElementType中选取，
      >
      > > ElmentType的可选值为：
      > >
      > > 1. Type 类、接口、注解、枚举
      > > 2. FIELD 字段
      > > 3. METHOD  方法
      > > 4. Parameter 参数
      > > 5. CONSTRUCTOR 构造方法
      > > 6. LOCAL_VARIABLE 本地变量
      > > 7. ANNOTATION_TYPE 注解
      > > 8. PACKAGE 包
      > > 9. TYPE_PARAMETER 类型参数 1.8
      > > 10. TYPE_USE 类型使用 1.8

   2. @Retention

      > 用来声明注解的生命周期，它的值需要从枚举类RetentionPolicy中选取
      >
      > > RetentionPolicy的可选值为：
      > >
      > > 1. SOURCE 保留到源代码阶段，在编译时会被擦除，比如lombok的@Data注解
      > > 2. CLASS 保留到类文件阶段，运行时会被擦除
      > > 3. RUNTIME 保留到运行期间

   3. @Inherited

      > 不需要设置值，表明允许子类继承父类的注解(但是不能从接口继承该注解)

   4. @Repeatable

      > jdk8新特性  
      >
      > 如果一个注解被@Repeatable标注，则该注解可以在同一个地方被重复使用多次。用@Repeatable 来修饰注解时需要指明一个接受重复注解的容器。

   5. @Document

      > 不需要设置值，加上则表明该注解会在javadoc中生成

2. 注解的优势：

   > 相比于直接修改代码的硬编码格式，基于注解的松耦合的信息添加方式更受欢迎

3. 注意事项：

   > 注解的访问修饰符必须是public