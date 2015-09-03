#!/usr/bin/env bash
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
    -input /dataexpo/2006.csv \
    -output /tmp/test.txt \
    -mapper /bin/cat \
    -reducer "/usr/bin/wc -l"