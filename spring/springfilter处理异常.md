在spring中，可以使用@ControllerAdvice或者@RestControllerAdvice来处理全局异常，但是这两个注解只能处理 请求经过了DispatcherServlet的异常。如果请求在FIlter就抛出的异常，那么这两个注解是没有用的。

1. 这个时候我们可以自定义一个MyErrorController实现BasicErrorController 接口，就可以优雅的处理异常。

2. 我们也可以自定义路径，实现ErrorController接口，加上自定义路径。只不过这个时候需要在Filter中加上

   > ```java
   > request.getRequestDispatcher("/401").forward(req, resp);
   > ```

 这两种方案的原理都是一样的，在FIlter中把请求重定向到Controller中从而达到自定义处理异常的效果