IFS=","
SERVERS="bm01,bm02,10.20.10.148,10.20.10.149,10.199.1.158,10.199.1.188,10.199.1.52,10.199.0.76,10.199.0.108,10.199.1.56,10.199.0.169,10.199.1.70"
USERNAME=deploy

YESTERDAY=`date +%Y-%m-%d --date="$1"`
MONTH=`date +%Y-%m --date="$1"`
LOG_DIR=/var/log/factual/ds-api
LOG_FILE=ds-api.$YESTERDAY.log

echo "Working on $LOG_FILE"

DEST_DIR=/apps/ds-api/log/$MONTH
hadoop fs -mkdir $DEST_DIR > /dev/null 2>&1
DEST_FILE=$YESTERDAY.log

for server in $SERVERS; do
  exist=`hadoop fs -lsr $DEST_DIR/$server.$DEST_FILE`
  if [ $exist ]
  then
    echo "Backup failed, $DEST_DIR/$server.$DEST_FILE already exist on hdfs\n$exist" | mail -s "Log backup failed on $server" maverick@factual.com
  else
    ssh $USERNAME@$server "cat $LOG_DIR/$LOG_FILE" | hadoop fs -put - $DEST_DIR/$server.$DEST_FILE
    echo "$DEST_DIR/$server.$DEST_FILE copied"
  fi
done