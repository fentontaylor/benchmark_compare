import os
basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = 'postgres://localhost/benchmark_compare_dev'
    SQLALCHEMY_TRACK_MODIFICATIONS = False