练习: 

很老的一篇文章[Spring Security in MVC 4 Using Spring Boot](https://dzone.com/articles/spring-security-in-mvc-4-using-spring-boot)

本demo解决了升级到spring boot 2.0.6遇到的问题.

start.spring.io依赖选择web和security.(web让你能用@RestController这样的注解)

## memos
1. 因为springboot2基于spring5(jdk8), 接口可以有默认实现, WebMvcConfigurerAdpater已经作废, 直接使用接口WebMvcConfigurer.
2. `@EnableWebMvcSecurity`被`@EnableWebSecurity`替代.
3. HttpSecurity中可以使用`.and()`串联(相当于xml的结束符), 但是我觉得另起一行更好.

## inMemoryAuthentication 不能工作
解决办法:
`.password("111111")`改成`.password("{noop}111111)`.

## POST /login没有反应, 还是跳回login
加上`http.csrf().disable()`可以解决, 最终发现原因是jsp中`_csrf.token`的值多敲了一个 `}`.

## POST /logout跳到error page提示403
1. 打开日志开关, 在application.properties中加上`logger.level.root.org.springframework=DEBUG`
2. 登出时观察到o.s.security.web.csrf.CsrfFilter : Invalid CSRF token found for http://localhost:8080/logout
3. 客户端csrf错误在spring中竟然是debug级别的日志.
3. 原因同login, jsp中`_csrf.token`的值多敲了一个 `}`.

https://stackoverflow.com/questions/30756460/spring-security-denies-logout-csrf-token

## 总结
遇到问题一是打开debug log,另一个是观察chrome中network中请求的参数(header/body)是不是正确.


## References
1. [《Spring Security教程系列》三.HttpSecurity的使用](https://blog.csdn.net/u014453515/article/details/53406557)
