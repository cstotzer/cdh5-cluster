#!/usr/bin/env bash
sudo -u hdfs wget -O - http://stat-computing.org/dataexpo/2009/2006.csv.bz2 | bzcat | hdfs dfs -put - /dataexpo/2006.csv