DAY=`date +%Y-%m-%d --date="$1"`
MONTH=`date +%Y-%m --date="$1"`

INPUT=/apps/ds-api/log/$MONTH/*.$DAY.log
OUTPUT=/apps/ds-api/request-report/$MONTH/$DAY

cd $HOME/bin
./request-hadoop.sh $INPUT $OUTPUT

hadoop fs -cat $OUTPUT/part* | sort | mail -s "ds-api-prod: Daily request statistic $DAY" maverick@factual.com,ds-api@factual.com
