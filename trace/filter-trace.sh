DAY=`date +%Y-%m-%d --date="$1"`
MONTH=`date +%Y-%m --date="$1"`

INPUT=/apps/ds-api/log/$MONTH/*.$DAY.gz
OUTPUT=/apps/ds-api/trace/$MONTH/$DAY

cd ~/daily-cron-ds-api/trace
./trace-hadoop.sh $INPUT $OUTPUT
