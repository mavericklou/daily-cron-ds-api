echo `date`
. ~/.keychain/dev101-sh

echo "retrieving logs from ds-api production server ......"
~/bin/backup-log.sh yesterday

echo "filter out trace log to /apps/ds-api/trace ......"
~/bin/filter-trace.sh yesterday

echo "generating request statistic report ......"
~/bin/request-stat.sh yesterday

echo "Done\n\n\n"
