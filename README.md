# Benchmark Compare
Test the performance of various backend frameworks

### Seeding the database
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
