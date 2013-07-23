echo `date`
. ~/.keychain/mav-2ce-sh

WORK_DIR=~/daily-cron-ds-api

echo "retrieving logs from ds-api production server ......"
$WORK_DIR/backup_log/backup-log.sh $1 

echo "filter out trace log to /apps/ds-api/trace ......"
$WORK_DIR/trace/filter-trace.sh $1

echo "generating request statistic report ......"
$WORK_DIR/request_stat/request-stat.sh $1

echo "Done\n\n\n"
