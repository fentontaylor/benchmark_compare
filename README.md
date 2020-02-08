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
Each API has two endpoints, one that returns a simple 'Hello, World!' and one that returns a large index of Olympians from a database. In the initial phase of this project, no projects or libraries have been used to boost the performance of the APIs. These results are simply 'out-of-the-box' preformance.

### Hello World Endpoint
Each API's root path returns the simple JSON response:
```
{
  "message": "Hello, World!"
}
```
The apache benchmark tool was used to send 10,000 requests to the APIs with a concurrency level of 1 (one request at a time). with the command `ab -n 10000 -c 1 http://<localhost:port>/`. Here are the results from best to worst.

#### 1a. Express
<details>
  <summary>View Results</summary>

```
Document Path:          /
Document Length:        27 bytes

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
</details>

#### 1b. Express with GraphQL
<details>
  <summary>View Results</summary>

```
Document Path:          /api/v2/graphql?query=query%7Bmessage%7D
Document Length:        36 bytes

Concurrency Level:      1
Time taken for tests:   5.339 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2430000 bytes
HTML transferred:       360000 bytes
Requests per second:    1873.06 [#/sec] (mean)
Time per request:       0.534 [ms] (mean)
Time per request:       0.534 [ms] (mean, across all concurrent requests)
Transfer rate:          444.49 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       2
Processing:     0    0   0.4      0      19
Waiting:        0    0   0.4      0      19
Total:          0    0   0.4      0      19

Percentage of the requests served within a certain time (ms)
  50%      0
  66%      0
  75%      1
  80%      1
  90%      1
  95%      1
  98%      1
  99%      2
 100%     19 (longest request)
```
</details>

#### 2. Sinatra
<details>
  <summary>View Results</summary>

```
Document Path:          /
Document Length:        27 bytes

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
</details>

#### 3. Flask
<details>
  <summary>View Results</summary>

```
Document Path:          /
Document Length:        27 bytes

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
</details>

#### 4. Django
<details>
  <summary>View Results</summary>

```
Document Path:          /
Document Length:        27 bytes

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
</details>

#### 5. Rails API
<details>
  <summary>View Results</summary>

```
Document Path:          /
Document Length:        27 bytes

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
</details>

#### 6. Spring
<details>
  <summary>View Results</summary>

```
Document Path:          /
Document Length:        27 bytes

Concurrency Level:      1
Time taken for tests:   7.998 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      1600000 bytes
HTML transferred:       270000 bytes
Requests per second:    1250.34 [#/sec] (mean)
Time per request:       0.800 [ms] (mean)
Time per request:       0.800 [ms] (mean, across all concurrent requests)
Transfer rate:          195.37 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0       1
Processing:     0    0   0.2      0       9
Waiting:        0    0   0.2      0       9
Total:          0    1   0.3      1      10

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      1
  75%      1
  80%      1
  90%      1
  95%      1
  98%      1
  99%      1
 100%     10 (longest request)
```
</details>

### /api/v1/olympians Endpoint
The apache benchmark tool was used to send 10,000 requests to the APIs with a concurrency level of 1 (one request at a time). with the command `ab -n 10000 -c 1 http://<localhost:port>/api/v1/olympians`. The path /api/v1/olympians returns an index of all 2863 Olympians from a PostgreSQL database in the following format:
```
{
    "olympians": [
        {
            "id": "1",
            "name": "Andreea Aanei",
            "sex": "F",
            "age": 22,
            "height": 170,
            "weight": 125
        },
        {
            "id": "2",
            "name": "Nstor Abad Sanjun",
            "sex": "M",
            "age": 23,
            "height": 167,
            "weight": 64
        },
        ...
    ]
}
```

#### 1a. Express
<details>
  <summary>View Results</summary>

```
Document Path:          /api/v1/olympians
Document Length:        248795 bytes

Concurrency Level:      1
Time taken for tests:   83.442 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2490090000 bytes
HTML transferred:       2487950000 bytes
Requests per second:    119.84 [#/sec] (mean)
Time per request:       8.344 [ms] (mean)
Time per request:       8.344 [ms] (mean, across all concurrent requests)
Transfer rate:          29142.91 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       4
Processing:     6    8   3.9      7     189
Waiting:        6    8   3.9      7     189
Total:          6    8   4.0      8     189

Percentage of the requests served within a certain time (ms)
  50%      8
  66%      8
  75%      8
  80%      8
  90%      9
  95%     11
  98%     17
  99%     25
 100%    189 (longest request)
 ```
 </details>

 #### 1b. Express with GraphQL
 <details>
  <summary>View Results</summary>

 ```
Document Path:          /api/v2/graphql?query=query%7Bolympians%7Bid%20name%20sex%20age%20height%20weight%7D%7D
Document Length:        248804 bytes

Concurrency Level:      1
Time taken for tests:   303.175 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2490180000 bytes
HTML transferred:       2488040000 bytes
Requests per second:    32.98 [#/sec] (mean)
Time per request:       30.317 [ms] (mean)
Time per request:       30.317 [ms] (mean, across all concurrent requests)
Transfer rate:          8021.18 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0       7
Processing:    25   30   5.9     28     143
Waiting:       25   30   5.9     28     142
Total:         26   30   6.0     28     143

Percentage of the requests served within a certain time (ms)
  50%     28
  66%     29
  75%     31
  80%     34
  90%     38
  95%     40
  98%     46
  99%     51
 100%    143 (longest request)
 ```
 </details>

 #### Rails API
 <details>
  <summary>View Results</summary>

 ```
 Document Path:          /api/v1/olympians
Document Length:        243069 bytes

Concurrency Level:      1
Time taken for tests:   1551.873 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2433040000 bytes
HTML transferred:       2430690000 bytes
Requests per second:    6.44 [#/sec] (mean)
Time per request:       155.187 [ms] (mean)
Time per request:       155.187 [ms] (mean, across all concurrent requests)
Transfer rate:          1531.06 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0       9
Processing:   123  155  19.1    151     396
Waiting:      123  155  19.1    151     395
Total:        124  155  19.1    151     396

Percentage of the requests served within a certain time (ms)
  50%    151
  66%    159
  75%    163
  80%    167
  90%    179
  95%    190
  98%    205
  99%    216
 100%    396 (longest request)
```
</details>

#### Flask
<details>
  <summary>View Results</summary>

```
Document Path:          /api/v1/olympians
Document Length:        243070 bytes

Concurrency Level:      1
Time taken for tests:   987.431 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2432200000 bytes
HTML transferred:       2430700000 bytes
Requests per second:    10.13 [#/sec] (mean)
Time per request:       98.743 [ms] (mean)
Time per request:       98.743 [ms] (mean, across all concurrent requests)
Transfer rate:          2405.43 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       7
Processing:    85   99  15.3     93     535
Waiting:       85   98  15.2     92     535
Total:         85   99  15.3     93     535

Percentage of the requests served within a certain time (ms)
  50%     93
  66%    102
  75%    105
  80%    106
  90%    111
  95%    120
  98%    131
  99%    141
 100%    535 (longest request)
```
</details>

#### Spring
<details>
  <summary>View Results</summary>

```
Document Path:          /api/v1/olympians
Document Length:        243264 bytes

Concurrency Level:      1
Time taken for tests:   249.203 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2433690000 bytes
HTML transferred:       2432640000 bytes
Requests per second:    40.13 [#/sec] (mean)
Time per request:       24.920 [ms] (mean)
Time per request:       24.920 [ms] (mean, across all concurrent requests)
Transfer rate:          9536.99 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       5
Processing:    18   25   6.7     24     403
Waiting:       14   20   6.2     20     387
Total:         18   25   6.7     24     403

Percentage of the requests served within a certain time (ms)
  50%     24
  66%     25
  75%     25
  80%     26
  90%     28
  95%     30
  98%     33
  99%     36
 100%    403 (longest request)
```
</details>

#### Go
<details>
  <summary>View Results</summary>

```
Document Path:          /api/v1/olympians/
Document Length:        284103 bytes

Concurrency Level:      1
Time taken for tests:   69.799 seconds
Complete requests:      10000
Failed requests:        0
Total transferred:      2842000000 bytes
HTML transferred:       2841030000 bytes
Requests per second:    143.27 [#/sec] (mean)
Time per request:       6.980 [ms] (mean)
Time per request:       6.980 [ms] (mean, across all concurrent requests)
Transfer rate:          53753.93 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0      14
Processing:     5    6   4.4      6     237
Waiting:        5    6   4.4      6     237
Total:          5    7   4.5      6     240

Percentage of the requests served within a certain time (ms)
  50%      6
  66%      6
  75%      7
  80%      7
  90%      8
  95%      9
  98%     11
  99%     21
 100%    240 (longest request)
```
</details>
