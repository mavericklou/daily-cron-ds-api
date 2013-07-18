echo "INPUT: $1"
echo "OUTPUT: $2"
hadoop jar /etc/alternatives/hadoop-lib/contrib/streaming/hadoop-streaming-0.20.2-cdh3u6.jar \
-D mapred.output.compress=true \
-D mapred.map.output.compression.codec=org.apache.hadoop.io.compress.GzipCodec \
-D mapred.output.compression.codec=org.apache.hadoop.io.compress.GzipCodec \
-input $1 \
-output $2 \
-file trace.rb \
-mapper 'ruby trace.rb'
