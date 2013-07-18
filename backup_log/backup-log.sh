IFS=","
SERVERS=`/home/maverick/.rvm/rubies/ruby-1.9.3-p0/bin/ruby ~/daily-cron-ds-api/backup_log/prod-processes.rb`
USERNAME=deploy

YESTERDAY=`date +%Y-%m-%d --date="$1"`
MONTH=`date +%Y-%m --date="$1"`
LOG_DIR=/var/log/factual/ds-api
LOG_FILE=ds-api.$YESTERDAY.log

echo "Working on $LOG_FILE"

DEST_DIR=/apps/ds-api/log/$MONTH
hadoop fs -mkdir $DEST_DIR > /dev/null 2>&1
DEST_FILE=$YESTERDAY.gz

for server in $SERVERS; do
  exist=`hadoop fs -lsr $DEST_DIR/$server.$DEST_FILE`
  if [ $exist ]
  then
    echo "Backup failed, $DEST_DIR/$server.$DEST_FILE already exist on hdfs\n$exist" | mail -s "Log backup failed on $server" maverick@factual.com
  else
    ssh -o "StrictHostKeyChecking no" $USERNAME@$server "cat $LOG_DIR/$LOG_FILE" | gzip -c | hadoop fs -put - $DEST_DIR/$server.$DEST_FILE
    echo "$DEST_DIR/$server.$DEST_FILE copied"
  fi
done
