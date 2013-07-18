echo "INPUT: $1"
echo "OUTPUT: $2"
hadoop jar /etc/alternatives/hadoop-lib/contrib/streaming/hadoop-streaming-0.20.2-cdh3u6.jar \
-D mapred.output.compress=false \
-D mapred.reduce.tasks=1 \
-D mapred.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
-D map.output.key.field.separator=' ' \
-D mapred.text.key.comparator.options='-k1,1r -k3,3 -k2,2' \
-input $1 \
-output $2 \
-file request-mapper.rb \
-file request-reducer.rb \
-mapper 'ruby request-mapper.rb' \
-reducer 'ruby request-reducer.rb'
