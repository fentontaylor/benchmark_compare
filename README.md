# Benchmark Compare
Test the performance of various backend frameworks

## Seeding the database
The script for seeding the database is in the rails-api directory. Once you have cloned the repo, to create and seed your PostgreSQL database:
1. Create the database
```
$ createdb benchmark_compare_dev
```
2. Go to rails-api directory and run the following commands:
```
$ cd rails-api
$ bundle install
$ rake db:migrate
$ rake import:data
```

## Performance Comparison
Each API has two endpoints, one that returns a simple 'Hello, World!' and one that returns a large index of Olympians from a database.

### Hello World Endpoint
Each API's root path returns the simple JSON response:
```
{
  "message": "Hello, World!"
}
```
The apache benchmark tool was used to send 10,000 requests to the APIs with a concurrency level of 1 (one request at a time). Here are the results.

#### 1. Rails API
```
Concurrency Level:      1
Time taken for tests:   18.885 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2620000 bytes
HTML transferred:       270000 bytes
Requests per second:    529.53 [#/sec] (mean)
Time per request:       1.888 [ms] (mean)
Time per request:       1.888 [ms] (mean, across all concurrent requests)
Transfer rate:          135.49 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       7
Processing:     1    2   3.1      2     294
Waiting:        1    2   3.1      1     294
Total:          1    2   3.1      2     294

Percentage of the requests served within a certain time (ms)
  50%      2
  66%      2
  75%      2
  80%      2
  90%      2
  95%      2
  98%      3
  99%      5
 100%    294 (longest request)
```

#### Sinatra
```
Concurrency Level:      1
Time taken for tests:   6.656 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1310000 bytes
HTML transferred:       270000 bytes
Requests per second:    1502.31 [#/sec] (mean)
Time per request:       0.666 [ms] (mean)
Time per request:       0.666 [ms] (mean, across all concurrent requests)
Transfer rate:          192.19 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0       7
Processing:     0    1   0.5      0      25
Waiting:        0    0   0.5      0      25
Total:          0    1   0.6      1      25
WARNING: The median and mean for the processing time are not within a normal deviation
        These results are probably not that reliable.

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      1
  75%      1
  80%      1
  90%      1
  95%      1
  98%      2
  99%      2
 100%     25 (longest request)
 ```
 
 #### Express
 ```
Concurrency Level:      1
Time taken for tests:   3.428 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2340000 bytes
HTML transferred:       270000 bytes
Requests per second:    2917.06 [#/sec] (mean)
Time per request:       0.343 [ms] (mean)
Time per request:       0.343 [ms] (mean, across all concurrent requests)
Transfer rate:          666.59 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   1.4      0     136
Processing:     0    0   0.9      0      88
Waiting:        0    0   0.6      0      51
Total:          0    0   1.6      0     137

Percentage of the requests served within a certain time (ms)
  50%      0
  66%      0
  75%      0
  80%      0
  90%      0
  95%      1
  98%      1
  99%      1
 100%    137 (longest request)
 ```
 
 #### Django
 ```
Concurrency Level:      1
Time taken for tests:   17.061 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2720000 bytes
HTML transferred:       270000 bytes
Requests per second:    586.12 [#/sec] (mean)
Time per request:       1.706 [ms] (mean)
Time per request:       1.706 [ms] (mean, across all concurrent requests)
Transfer rate:          155.69 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0       6
Processing:     1    2   2.9      1     260
Waiting:        1    1   1.1      1      71
Total:          1    2   2.9      1     260

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      2
  75%      2
  80%      2
  90%      2
  95%      2
  98%      3
  99%      5
 100%    260 (longest request)
 ```
 
 #### Flask
 ```
Concurrency Level:      1
Time taken for tests:   10.040 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1740000 bytes
HTML transferred:       280000 bytes
Requests per second:    996.06 [#/sec] (mean)
Time per request:       1.004 [ms] (mean)
Time per request:       1.004 [ms] (mean, across all concurrent requests)
Transfer rate:          169.25 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       8
Processing:     1    1   1.3      1     124
Waiting:        1    1   0.3      1      10
Total:          1    1   1.3      1     124

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      1
  75%      1
  80%      1
  90%      1
  95%      1
  98%      2
  99%      3
 100%    124 (longest request)
 ```
