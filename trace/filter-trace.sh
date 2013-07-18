YESTERDAY=`date +%Y-%m-%d --date="$1"`
MONTH=`date +%Y-%m --date="$1"`

INPUT=/apps/ds-api/log/$MONTH/*.$YESTERDAY.gz
OUTPUT=/apps/ds-api/trace/$MONTH/$YESTERDAY

cd ~/daily-cron-ds-api/trace
./trace-hadoop.sh $INPUT $OUTPUT
