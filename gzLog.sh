FILES=`hadoop fs -ls $1/*.log | grep -o "/apps.*log$"`

for file in $FILES; do
  echo "compressing $file"
  hadoop fs -text $file | gzip -c | hadoop fs -put - ${file%'.log'}.gz
done
