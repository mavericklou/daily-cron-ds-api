echo "INPUT: $1"
echo "OUTPUT: $2"
hadoop jar /etc/alternatives/hadoop-lib/contrib/streaming/hadoop-streaming-0.20.2-cdh3u4.jar \
-input $1 \
-output $2 \
-file trace.rb \
-mapper 'ruby trace.rb' \
-jobconf mapred.output.compress=false
