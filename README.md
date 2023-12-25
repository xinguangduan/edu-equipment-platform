
中小学教育装备管理平台

Educational equipment management platform
==========================

当前最新版本： 1.0.0（发布日期：2023-02-24） 


项目介绍
-----------------------------------


本地后端基础环境准备（推荐）
-----------------------------------
0. 安装 git、idea、docker-desktop、openJDK17
// 基于 Ubuntu 22.04
// sudo apt install git
// sudo snap install intellij-idea-community --classic   // 参见【[下载 IntelliJ IDEA](https://www.jetbrains.com.cn/idea/download/#section=linux)】
// 安装 docker-desktop                                    // 参见【[Install Docker Desktop on Ubuntu](https://docs.docker.com/desktop/install/ubuntu/)】
// sudo apt install openjdk-17-jdk
1. clone git 本仓库
2. cd edu-equipment-platform/docker
3. docker compose up -d
4. 验证数据库：打开浏览器访问 localhost:3006，键入用户名：root，密码：root，登录
5. 验证缓存：命令行 docker exec -it redis_6.2 redis-cli，输入 info 查看
6. 持续查看日志：docker compose logs -f
7. docker compose down


启动运行后端（推荐）
-----------------------------------
0. 在 idea 中进行 maven package 操作，生成 SpringBoot 方式的可执行 jar 文件
1. cd edu-equipment-platform/docker
2. docker compose up -d
3. 打开浏览器访问 localhost:3006，键入用户：root，密码：root，之后执行 db/mysql-min-5.7.sql 导入数据
4. cd ../eemp-server/
5. java -jar target/eemp-server-1.0.0.jar

启动运行前端（推荐）
-----------------------------------
0. 安装 node、npm、pnpm
// sudo snap install node --classic --channel=18    //【[Node.js snap source and updater](https://github.com/nodejs/snap)】
// sudo npm install pnpm -g
1. edu-equipment-platform/eemp-web
2. pnpm install --ignore-scripts                    // 忽略报错信息
3. pnpm dev
4. 打开浏览器访问 localhost:3100

关闭基础环境（推荐）
-----------------------------------
1. cd edu-equipment-platform/docker
2. docker compose down

（生产）单体应用 docker镜像 生成及测试
-----------------------------------
0. 运行系统 /etc/hosts 中设置IP： eemp-mysql, eemp-redis, eemp-system
1. 在 idea 中，激活 maven 的 prod 环境，执行类似 mvn clean install 生成部署包
2. cd ~/edu-equipment-platform/
   // 启动 mysql docker 容器时，会自动执行 docker-entrypoint-initdb.d/ 下的 .sh .sql 脚本，完成数据库初始化
3. docker compose down; docker compose build; docker compose up -d
4. 访问 http://eemp-system:8080/eemp/doc.html，输入用户及密码，可见 API 接口文档，则启动验证通过
   // 以下准备 eemp vue3 前端镜像
5. cd ~/edu-equipment-platform/eemp-web/
6. pnpm i; npm run build
7. docker build -t eemp-vue3 .
8. docker rm eemp-vue3-nginx; docker run --name eemp-vue3-nginx -p 80:80 -d eemp-vue3
9. 访问 http://eemp-system:80 验证业务功能


参考资料
-----------------------------------
1. [Install Docker Desktop on Ubuntu](https://docs.docker.com/desktop/install/ubuntu/)
2. [docker-compose安装和使用redis和mysql](https://blog.csdn.net/jiangjun_dao519/article/details/125072623)
3. [docker-compose快速启动mysql和redis(提供外部客户端可连接）](https://blog.csdn.net/weixin_42547724/article/details/128053759)
4. [Docker-compose封装mysql并初始化数据以及redis](http://www.manongjc.com/detail/56-ytybcufiprnvbkz.html)
5. [Docker 安装 MySQL和Adminer](https://blog.csdn.net/chinaxsw/article/details/103573495)
6. [史上最详细Docker安装Redis （含每一步的图解）实战](https://blog.csdn.net/weixin_45821811/article/details/116211724)
7. [使用docker部署mysql - 支持普通用户访问](http://www.coolpython.net/informal_essay/20-07/docker-deploy-mysql.html)
8. [Mybatis-plus 动态条件查询QueryWrapper的使用](https://blog.csdn.net/qq_26383975/article/details/119646390)
9. [（一）mybatis-plus学习--搭建基础框架](https://blog.csdn.net/qq_59159431/article/details/126972102)
10. [java~springboot~h2数据库在单元测试中的使用](https://www.cnblogs.com/lori/p/9684946.html)
11. [详解MyBatis中的Mapper Update](https://www.python100.com/html/108468.html)
12. [Current_timestamp全面解析](https://www.python100.com/html/113151.html)
13. [jeecgboot(vue+springboot)前端往后台传数据](https://zhuanlan.zhihu.com/p/610027414)
14. [SpringBoot整合H2数据库](https://blog.csdn.net/qq_46921028/article/details/129958593)
15. [02SpringBoot配置文件详解](https://blog.csdn.net/nie13739606256/article/details/123068340)
16. [前端文件下载](https://blog.csdn.net/m0_63685436/article/details/128165236)
17. [vue+springboot（jeecgboot）模板文件下载](https://zhuanlan.zhihu.com/p/549528178)
18. [java中Excel导入，下载模板，附带前端展示](https://codeleading.com/article/92135113000/)

flowable相关
-----------------------------------
1. [基于jeecgboot的flowable流程管理平台最新更新发布](https://zhuanlan.zhihu.com/p/575896096)
2. [JEECG集成flowable](https://blog.csdn.net/u010568976/article/details/123727154)
3. [基于Jeecg-boot前后端分离的flowable流程管理平台主页调整](https://blog.csdn.net/qq_40032778/article/details/130849804)
4. [基于jeecgboot的flowable流程支持online表单(一)](https://blog.51cto.com/u_15070324/6090648)
5. [基于jeecgboot的flowable流程支持online表单(三)](https://blog.51cto.com/u_15070324/6088488)
6. [Jeecg集成Flowable关于Log的坑](https://www.cnblogs.com/RAYMOND2015/p/17064913.html)
7. [基于jeecgboot的flowable增加流程节点抄送功能](https://blog.csdn.net/qq_40032778/article/details/127405740)
8. [基于jeecgboot的支持flowable的排它网关之后的会签功能（二）](https://blog.xiaobaicai.fun/java/15880.html)
9. [基于jeecg-boot的flowable流程跳转功能实现](https://blog.csdn.net/qq_40032778/article/details/132467252)
10. 

Mybatis相关问题
-----------------------------------
1. [【报错解决】org.apache.ibatis.binding.BindingException: Invalid bound statement (not found)](https://blog.csdn.net/qq_50914927/article/details/127091350)
2. [解决 org.apache.ibatis.binding.BindingException: Invalid bound statement (not found)](https://blog.csdn.net/weixin_43570367/article/details/103147854)
3. [ibatis.binding.BindingException: Invalid bound statement (not found)](https://blog.csdn.net/qq_43780761/article/details/126494026)
4. [ibatis.binding.BindingException: Invalid bound statement (not found)](https://blog.csdn.net/m0_51666376/article/details/132330112)
2. [ibatis.binding.BindingException: Invalidbound statement (not found)](https://blog.csdn.net/m0_49499183/article/details/122082333)
3. [ibatis.binding.BindingException:Invalid bound statement (not found)绑定](https://blog.csdn.net/mfysss/article/details/129715505)

开发相关
-----------------------------------
1. [别再使用 RestTemplate了，来了解一下官方推荐的 WebClient ！](https://zhuanlan.zhihu.com/p/659885945)
2. [spring 发送http请求 RestTemplate、WebClient](https://blog.csdn.net/wangjun5159/article/details/115251134)
3. [SpringBoot_RestTemplate的使用](https://blog.csdn.net/CodeWYX/article/details/122628626)
4. [SpringBoot RestTemplate详解](https://blog.csdn.net/hc1285653662/article/details/126982218)
5. [Spring之RestTemplate详解](https://blog.csdn.net/u012060033/article/details/123352747)
6. [RestTemplate使用详解](https://blog.csdn.net/Sophia_0331/article/details/121196840)
7. [RestTemplate](https://blog.csdn.net/D1842501760/article/details/124216538)
8. [springboot中RestTemplate的用法](https://blog.csdn.net/weixin_42304484/article/details/127742105)
9. [RestTemplate 以及 WebClient 调用第三方接口使用总结](https://www.cnblogs.com/fan223/articles/17079868.html)
10. [SpringBoot之RestTemplate 简单常用使用示例](https://blog.csdn.net/JAVA_MHH/article/details/122535609)
11. [【微服务~远程调用】整合RestTemplate、WebClient、Feign](https://blog.csdn.net/weixin_45481821/article/details/125357680)
12. [Java-json相关转换，JSONObject与实体类/map互转、List/List＜map＞和JSONArray互转](https://blog.csdn.net/weixin_44436677/article/details/131269751)
13. [Stream流中collect方法](https://blog.csdn.net/weixin_46146718/article/details/123791758)

开发基础
-----------------------------------
1. [Spring框架使用@Autowired自动装配引发的讨论](https://zhuanlan.zhihu.com/p/76465110)
2. [@Autowire和@Resource](https://blog.csdn.net/weixin_43472073/article/details/121485528)
3. [Spring源码学习：@Autowire和@Resource原理解析](https://blog.csdn.net/weixin_45031612/article/details/129068496)
4. [Spring中@Autowired和@Resource的区别](https://zhuanlan.zhihu.com/p/522095455)

测试驱动开发相关
-----------------------------------
1. [TDD开发Vue3组件指南 ](https://article.juejin.cn/post/7208072274368757820)
2. [Vue Testing Handbook（vue.js 2）](https://www.bookstack.cn/read/vue-testing-handbook-vue2-en/b2bdc1839972e076.md)

项目实战参考
-----------------------------------
1. [Vue3 项目实战 — Vue3记账本项目（前端Vue3，后端node.js）](https://blog.csdn.net/weixin_42775304/article/details/132017610)

测试相关
-----------------------------------
1. [使用Postman加Token测试JeecgBoot后端API接口](https://blog.csdn.net/daqiang012/article/details/120305574)
2. [fiddler抓包工具和postman接口测试工具的使用](https://blog.csdn.net/weixin_44116098/article/details/117394126)
3. [Ubuntu 安装Fiddler](https://blog.csdn.net/CatStarXcode/article/details/79302808)
4. [ubuntun下安装Fiddler](https://www.pianshen.com/article/25472678697/)

疑难问题相关
-----------------------------------
1. [springboot整合websocket后运行测试类报错：javax.websocket.server.ServerContainer not available](https://www.cnblogs.com/yourblog/p/10369713.html)


前端构建相关
-----------------------------------
1. [husky install 失败，报 .git can't be found](https://blog.csdn.net/chengyikang20/article/details/131700318)
2. [Nginx 前端部署配置](https://www.cnblogs.com/yuzhihui/p/17074551.html)

Docker相关
-----------------------------------
1. [修改 daemon.json 配置文件，来更便捷无感的使用代理服务](https://dockerproxy.com/docs)

Mysql相关
-----------------------------------
1. [mysql的全量备份和增量备份](https://blog.csdn.net/weixin_46471601/article/details/123334517)
2. [MySQL数据库日志管理、备份与恢复](https://blog.csdn.net/A1100886/article/details/131286220)
3. [MySQL 备份系列（1）-- 备份方案总结性梳理](https://www.cnblogs.com/kevingrace/p/6112565.html)
4. [MySQL备份系列（2）-- mysqldump备份（全量+增量）方案操作记录](https://www.cnblogs.com/kevingrace/p/6114979.html)
5. [MySQL 8.0安装部署-运维笔记](https://www.cnblogs.com/kevingrace/p/10482469.html)
6. [Linux--MySQL 日志管理、备份与恢复](https://www.cnblogs.com/GXJ19900412nt/p/15249454.html)
7. [Linux MySQL 备份与恢复 日志管理](https://betheme.net/houduan/157261.html)
8. [mysql全量备份和增量备份方法](https://blog.csdn.net/weixin_38301116/article/details/130848151)
9. [Docker 容器内的 MySQL 数据备份](https://www.cnblogs.com/livebz/p/17269970.html)

基础环境搭建
-----------------------------------
1. [新一代多系统启动U盘解决方案Ventoy](https://www.ventoy.net/cn/index.html)
2. [Ubuntu 22 服务器端安装图形化界面](https://blog.csdn.net/yezhijing/article/details/131358170)
3. [Ubuntu Server安装图形界面](https://blog.csdn.net/feiniao8651/article/details/128314189)
4. [ubuntu 22 虚拟机模板配置](https://blog.csdn.net/ringwater/article/details/128299382)
5. [Ubuntu快速释放磁盘空间的方法（一）：清理系统日志](https://baijiahao.baidu.com/s?id=1755808847675598370)
