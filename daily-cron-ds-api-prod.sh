echo `date`
. ~/.keychain/$HOSTNAME-sh

WORK_DIR=~/daily-cron-ds-api

echo "retrieving logs from ds-api production server ......"
$WORK_DIR/backup_log/backup-log.sh yesterday

echo "filter out trace log to /apps/ds-api/trace ......"
$WORK_DIR/trace/filter-trace.sh yesterday

echo "generating request statistic report ......"
$WORK_DIR/request_stat/request-stat.sh yesterday

echo "Done\n\n\n"
