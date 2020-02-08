# Sinatra

## Apache Benchmark Results
#### 10000 Requests to Hello World Endpoint, 1 at a time:
```sh
$ ab -n 10000 -c 1 http://127.0.0.1:4567/
```
```
Server Software:        Puma
Server Hostname:        127.0.0.1
Server Port:            4567

Document Path:          /
Document Length:        27 bytes

Concurrency Level:      1
Time taken for tests:   6.853 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1310000 bytes
HTML transferred:       270000 bytes
Requests per second:    1459.11 [#/sec] (mean)
Time per request:       0.685 [ms] (mean)
Time per request:       0.685 [ms] (mean, across all concurrent requests)
Transfer rate:          186.66 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   3.3      0     331
Processing:     0    1   0.9      0      76
Waiting:        0    0   0.9      0      76
Total:          0    1   3.4      1     332
WARNING: The median and mean for the processing time are not within a normal deviation
        These results are probably not that reliable.

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      1
  75%      1
  80%      1
  90%      1
  95%      1
  98%      1
  99%      3
 100%    332 (longest request)
```
#### 10000 Requests to Hello World Endpoint, 10 at a time:
```sh
$ ab -n 10000 -c 10 http://127.0.0.1:4567/
```
```
Server Software:        Puma(v4.3.1)
Server Hostname:        127.0.0.1
Server Port:            4567

Document Path:          /
Document Length:        27 bytes

Concurrency Level:      10
Time taken for tests:   6.007 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1310000 bytes
HTML transferred:       270000 bytes
Requests per second:    1664.73 [#/sec] (mean)
Time per request:       6.007 [ms] (mean)
Time per request:       0.601 [ms] (mean, across all concurrent requests)
Transfer rate:          212.97 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   1.4      0      49
Processing:     1    6   3.0      5      61
Waiting:        0    4   2.4      4      50
Total:          1    6   3.4      5      62

Percentage of the requests served within a certain time (ms)
  50%      5
  66%      6
  75%      7
  80%      7
  90%      9
  95%     10
  98%     13
  99%     16
 100%     62 (longest request)
```
#### 10000 Requests to Olympians Index Endpoint, 1 at a time:
```sh
$ ab -n 10000 -c 1 http://localhost:4567/api/v1/olympians
```
```
Server Hostname:        localhost
Server Port:            4567

Document Path:          /api/v1/olympians
Document Length:        243069 bytes

Concurrency Level:      1
Time taken for tests:   100.396 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2431770000 bytes
HTML transferred:       2430690000 bytes
Requests per second:    99.61 [#/sec] (mean)
Time per request:       10.040 [ms] (mean)
Time per request:       10.040 [ms] (mean, across all concurrent requests)
Transfer rate:          23654.09 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0      12
Processing:     7   10   6.5      9     117
Waiting:        7   10   6.5      9     117
Total:          8   10   6.6      9     119

Percentage of the requests served within a certain time (ms)
  50%      9
  66%     10
  75%     10
  80%     10
  90%     11
  95%     12
  98%     17
  99%     28
 100%    119 (longest request)
```
#### 10000 Requests to Hello World Endpoint, 10 at a time:
```sh
$ ab -n 10000 -c 10 http://localhost:4567/api/v1/olympians
```

```
Server Hostname:        localhost
Server Port:            4567

Document Path:          /api/v1/olympians
Document Length:        243069 bytes

Concurrency Level:      10
Time taken for tests:   96.381 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2431770000 bytes
HTML transferred:       2430690000 bytes
Requests per second:    103.76 [#/sec] (mean)
Time per request:       96.381 [ms] (mean)
Time per request:       9.638 [ms] (mean, across all concurrent requests)
Transfer rate:          24639.55 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   1.9      0     106
Processing:    19   96  39.3     91     423
Waiting:       19   92  38.9     87     422
Total:         19   96  39.3     91     423

Percentage of the requests served within a certain time (ms)
  50%     91
  66%    102
  75%    112
  80%    121
  90%    147
  95%    171
  98%    201
  99%    224
 100%    423 (longest request)
```

## WRK Benchmark Results
#### 10 Connections to Hello World
```
Running 2m test @ http://127.0.0.1:4567/
  10 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     6.57ms    6.86ms 146.12ms   90.98%
    Req/Sec   184.66     52.79   350.00     63.70%
  220700 requests in 2.00m, 27.57MB read
Requests/sec:   1837.65
Transfer/sec:    235.09KB
```

#### 50 Connections to Hello World
```
Running 2m test @ http://127.0.0.1:4567/
  10 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    27.20ms   40.85ms 810.90ms   86.74%
    Req/Sec   279.28    115.03   630.00     61.05%
  249407 requests in 2.00m, 31.16MB read
  Socket errors: connect 0, read 0, write 0, timeout 12
Requests/sec:   2076.60
Transfer/sec:    265.66KB
```

#### 10 Connections to Olympians Index
```
Running 2m test @ http://127.0.0.1:4567/api/v1/olympians
  10 threads and 10 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   108.40ms   52.42ms 607.47ms   72.45%
    Req/Sec     9.87      4.43    30.00     70.17%
  11298 requests in 2.00m, 2.56GB read
Requests/sec:     94.07
Transfer/sec:     21.82MB
```

#### 50 Connections to Olympians Index
```
Running 2m test @ http://127.0.0.1:4567/api/v1/olympians
  10 threads and 50 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency   188.28ms  130.93ms   1.50s    73.91%
    Req/Sec    25.38     11.81    70.00     60.67%
  12002 requests in 2.00m, 2.72GB read
  Socket errors: connect 0, read 0, write 0, timeout 2
Requests/sec:     99.94
Transfer/sec:     23.18MB
```