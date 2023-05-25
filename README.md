
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


参考资料
-----------------------------------
1. [Install Docker Desktop on Ubuntu](https://docs.docker.com/desktop/install/ubuntu/)
2. [docker-compose安装和使用redis和mysql](https://blog.csdn.net/jiangjun_dao519/article/details/125072623)
3. [docker-compose快速启动mysql和redis(提供外部客户端可连接）](https://blog.csdn.net/weixin_42547724/article/details/128053759)
4. [Docker-compose封装mysql并初始化数据以及redis](http://www.manongjc.com/detail/56-ytybcufiprnvbkz.html)
5. [Docker 安装 MySQL和Adminer](https://blog.csdn.net/chinaxsw/article/details/103573495)
6. [史上最详细Docker安装Redis （含每一步的图解）实战](https://blog.csdn.net/weixin_45821811/article/details/116211724)
7. [使用docker部署mysql - 支持普通用户访问](http://www.coolpython.net/informal_essay/20-07/docker-deploy-mysql.html)

