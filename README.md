# README #

Различные инструменты для работы с Docker и проектами в окружении Docker.

## Поставка ##

* Docker UI
* Docker-Compose UI
* Weaveworks Scope
* Docker-API  
* Dockup (форк)

## Быстрый старт ##

* cp _env_template .env - создать файл .env , где изменить путь к docker-compose проектам и адрес для docker-api
* docker-compose up -d - запустить сервисы для работы с Docker

## Доступ по умолчанию ##

* Docker-UI доступен на 9009 порту
* Docker-Compose UI доступен на 5000 порту
* Scope доступен на 4040 порту
* Docker-API доступен на 2375 порту

## Backup / Restore ##
#### В файле .env нужно прописать следующее: ####

* AWS_ACCESS_KEY_ID=``[ключ доступа AMAZON S3]``
* AWS_SECRET_ACCESS_KEY=``[секретный ключ AMAZON S3]``
* AWS_DEFAULT_REGION=``[регион бакета, например eu-central-1]``
* BACKUP_NAME=``[префикс бэкапов, например eu-central-1]``
* PATHS_TO_BACKUP=``[директории volume, которые надо бэкапить, например /var/lib/mysql, можно указать несколько через пробел]``
* S3_BUCKET_NAME=``[имя бакета, например mybucket123]``
* S3_FOLDER=``[директория бакета, например backups, указываем без слэшей]``
* CONTAINER_VOLUMES_BACKUP=``[имя контейнера, в volume которого будут скопированы директории в бэкап]``
* RESTORE=``[если false, делаем бэкап, если true - делаем деплой последнего бэкапа]``

Список регионов:
http://docs.aws.amazon.com/general/latest/gr/rande.html#s3_region

#### Далее чтобы сделать backup нужно выполнить: ####

	./backup.sh на HOST машине 

#### CRON ####

* если требуется, можно прописать в crontab -e выполнение раз в пол часа:


	*/30 * * * * /path/to/backup.sh >/dev/null 2>&1
    
#### Деплой ####
 
* если требуется выполнить деплой последнего дампа из S3 отключите CRON ./backup.sh и измените параметр RESTORE на true и выполните 


    ./backup.sh

Следует учесть что после деплоя будет произведен рестарт контейнера из параметра
 CONTAINER_VOLUMES_BACKUP

