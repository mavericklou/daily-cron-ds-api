echo "INPUT: $1"
echo "OUTPUT: $2"
hadoop jar /etc/alternatives/hadoop-lib/contrib/streaming/hadoop-streaming-0.20.2-cdh3u4.jar \
-D mapred.output.compress=false \
-input $1 \
-output $2 \
-file request-mapper.rb \
-file request-reducer.rb \
-mapper 'ruby request-mapper.rb' \
-reducer 'ruby request-reducer.rb'
