FILES=`hadoop fs -ls $1/*/part-????? | grep -o "/apps.*$"`

for file in $FILES; do
  echo "##################  compressing $file  ####################"
  hadoop fs -text $file | gzip -c | hadoop fs -put - $file.gz
done
