FROM ubuntu:trusty

RUN apt-get update && apt-get install -y python-pip && pip install awscli

ADD source/dockup/backup.sh /backup.sh
ADD source/dockup/restore.sh /restore.sh
ADD source/dockup/run.sh /run.sh
RUN chmod 755 /*.sh

ENV S3_BUCKET_NAME docker-backups.example.com
ENV S3_FOLDER folder
ENV AWS_ACCESS_KEY_ID **DefineMe**
ENV AWS_SECRET_ACCESS_KEY **DefineMe**
ENV AWS_DEFAULT_REGION us-east-1
ENV PATHS_TO_BACKUP /paths/to/backup
ENV BACKUP_NAME backup
ENV RESTORE false

CMD ["/run.sh"]
