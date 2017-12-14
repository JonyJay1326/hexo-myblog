---
title: 基于DaoCloud、nginx反向代理的单服务器多项目配置
abbrlink: 16108
categories: "效率工具"
tags: docker
---

本文基于 https://juejin.im/post/5a142d7b6fb9a0451170c2c7 《 基于 Docker 打造前端持续集成开发环境》 ，小白研究了偷懒的方法。如有大神有更好的办法，请赐教。

## 基于DaoCloud、nginx反向代理的单服务器多项目配置

**目标**：

  1. 代码无需在本地构建

  2. 只需将代码推上 Github ，自动部署

  3. 版本易管理，可轻松回退版本
  
  4. 配置多个docker容器指向 服务器不同端口，通过nginx反向代理
 
 
 
### 用简单的vue-cli项目举例

#### 第一步： 初始化 Vue 项目（使用vue官方脚手架 vue-cli）

1. 初始化 vue 项目：vue init webpack jay-www

2. 在项目根目录下编 Dockerfile
 ![image](http://image.lovefay1994.com/blog/1513221051404.png)
`这里的DockerFIle配置没有仔细看 - - 只求偷懒。 技术有限，写的也都是些杂七杂八的就不做.gitignore /dist了,项目中直接构建好了提交。有各种优化Docker 容器运行速度的方法请google/baidu`

3. 初始化 git， 连接并将代码推送到 Github 仓库，


####  第二步：使用 DaoCloud 搭建 开发流程

1. 注册一个 DaoCloud 账号

2. 用户中心 -> 代码托管，授权可访问你的 Github 仓库

![image](http://image.lovefay1994.com/blog/1513221590500.png)

3. 在 Devops 项目中新建一个项目，并选择 Github 中对应刚才新创建的项目
![image](http://image.lovefay1994.com/blog/1513221698617.png)

4. 先手动构建一个镜像版本，便于下面用这个镜像版本创建一个应用
![image](http://image.lovefay1994.com/blog/1513221750037.png)

5. 连接自有主机
![image](http://image.lovefay1994.com/blog/1513221802241.png)
![image](http://image.lovefay1994.com/blog/1513221841755.png)

太酷了，我们已经将我们的主机接入了 DaoCloud，接下来就来完成最有意思的一步。

6. 创建一个应用

进入【镜像仓库】选择刚才手动构建出来的镜像，并部署最新版本到自由主机或者云端测试环境
![image](http://image.lovefay1994.com/blog/1513221982263.png)
![image](http://image.lovefay1994.com/blog/1513222006950.png)

稍等片刻，便可以点击“立即部署”
![image](http://image.lovefay1994.com/blog/1513222246813.png)
这边需要注意 : **主机端口** 将会与主机中nginx反向代理配置有关系 
![image](http://image.lovefay1994.com/blog/1513222327949.png)
7.定义自动构建，自动发布任务
![image](http://image.lovefay1994.com/blog/1513222380731.png)
![image](http://image.lovefay1994.com/blog/1513222400721.png)
至此，我们已经完成了，所有流程控制工作，去测试一下整个流程是否能走通？
#### 第三步： 测试整个流程
回到我们本地，修改一下文本内容，提交，并推送到远端，
![image](http://image.lovefay1994.com/blog/1513222497072.png)
至此，我们在只编写了一个 Dockerfile 配置文件，没有编写脚本的情况下，成功地搭建了一套前端的持续集成开发环境。

#### 配置单主机不同域名 对应不同项目 

通过重复上面的操作，docker容器指向不同的主机端口。只要在主机nginx配置不同反向代理即可。研究了两天发现这个是最快捷的。最偷懒的 - - 虽然有很多弊端。。。仅供参考娱乐 ，不适合正规开发 。

	作者：三环没有少
	链接：https://juejin.im/post/5a142d7b6fb9a0451170c2c7
	来源：掘金
	著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
