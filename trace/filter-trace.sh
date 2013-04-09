YESTERDAY=`date +%Y-%m-%d --date="$1"`
MONTH=`date +%Y-%m --date="$1"`

INPUT=/apps/ds-api/log/$MONTH/*.$YESTERDAY.log
OUTPUT=/apps/ds-api/trace/$MONTH/$YESTERDAY

cd $HOME/bin
./trace-hadoop.sh $INPUT $OUTPUT
