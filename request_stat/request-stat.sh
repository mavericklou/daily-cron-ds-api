DAY=`date +%Y-%m-%d --date="$1"`
MONTH=`date +%Y-%m --date="$1"`

INPUT=/apps/ds-api/log/$MONTH/*.$DAY.log
OUTPUT=/apps/ds-api/request-report/$MONTH/$DAY

cd ~/daily-cron-ds-api/request_stat
./request-hadoop.sh $INPUT $OUTPUT

hadoop fs -cat $OUTPUT/part* | mail -s "ds-api-prod: Daily request statistic $DAY" ds-api@factual.com
