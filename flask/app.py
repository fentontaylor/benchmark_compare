from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from config import Config
from flask_marshmallow import Marshmallow

app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)
ma = Marshmallow(app)

from models import Olympian, OlympianSchema


@app.route('/')
def hello():
    return jsonify({ 'message': 'Hello, World!' })


@app.route('/api/v1/olympians')
def index():
    olympians = Olympian.query.all()
    olympian_schema = OlympianSchema(many=True)
    return { 'olympians': olympian_schema.dump(olympians) }


if __name__ == '__main__':
    app.run()