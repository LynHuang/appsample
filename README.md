# AppSample

This is a project written by PHP & Laravel 7.

For study resean only.

# 用Docker部署本地环境(建议)

前提先自行学习docker相关知识，安装好docker和docker-compose. linux执行失败用sudo

- cd 到项目根目录
- docker-compose up -d
- docker-compose exec lamp-appsample bash
- mysql -uroot -e "create database laravel" && cp .env.example .env && php artisan key:generate && php artisan migrate
- 访问 http://localhost/yys 即可

# 部署本地环境(使用PHPStudy)

本项目仅供学习编程用途

-   先在本地电脑安装好 PHP 环境，推荐 phpStudy https://www.xp.cn/download.html ，PHP 选 7.3+
-   把项目 clone 或者打包下载到本地硬盘，例如放在 D:\appsample 文件夹里面（下面用这个目录做例子）
-   在 phpstudy 里面设置网站根目录为 D:\appsample\public；
-   在 phpstudy 里面创建一个数据库；都搞好了启动 apache&mysql 服务
-   在 phpstudy 的插件库安装 composer
-   在项目根目录 D:\appsample\ 运行命令 composer install 安装所有依赖
-   把 D:\appsample\ 里的 .env.example 改名成 .env（里面的 mysql 配置改一下)
-   在根目录 D:\appsample\ 运行 php artisan key:generate 给网站初始化 key
-   在根目录 D:\appsample\ 运行 php artisan migrate 给网站初始化数据库
-   访问 http://localhost/yys 就能打开网站

QQ 群：317158755

如果有问题，先看看/storage/log/laravel.log 日志文件，然后多多百度

PHP 是不是世界上最好的语言不好说，但 Laravel 绝对是 PHP 最好的框架（滑稽.jpg）所以配置繁琐也是正常的

# Deploy on AWS Lightsail

https://docs.bitnami.com/general/infrastructure/lamp/get-started/

-   git clone repo_url_here
-   composer install
-   sudo chown -R daemon:www-data storage
-   sudo chown -R daemon:www-data bootstrap/cache
-   sudo chmod -R 777 storage
-   sudo chmod -R 777 bootstrap/cache
-   cd /opt/bitnami/apache2
-   vi /opt/bitnami/apache2/conf/bitnami/httpd.conf
-   sudo /opt/bitnami/ctlscript.sh restart apache
-   mysql –uroot –p
-   CREATE DATABASE your_db_name_here;
-   quit

# DataDog

Your Agent is running and functioning properly. It will continue to run in the
background and submit metrics to Datadog.

If you ever want to stop the Agent, run:

    sudo systemctl stop datadog-agent

And to run it again run:

    sudo systemctl start datadog-agent

Uninstall

    sudo apt-get remove datadog-agent -y

# Set up cron job

ssh

    crontab -e

add a new line

    * * * * * cd /opt/bitnami/apache2/htdocs/appsample && /opt/bitnami/php/bin/php artisan schedule:run >> /dev/null 2>&1

# Others

WIP
