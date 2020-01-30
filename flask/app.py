from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from config import Config
from flask_marshmallow import Marshmallow


app = Flask(__name__)
app.config.from_object(Config)
db = SQLAlchemy(app)
ma = Marshmallow(app)


class Olympian(db.Model):
    __tablename__ = 'olympians'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(64))
    sex = db.Column(db.String(2))
    age = db.Column(db.Integer, nullable=True)
    height = db.Column(db.Integer, nullable=True)
    weight = db.Column(db.Integer, nullable=True)


class OlympianSchema(ma.ModelSchema):
    class Meta:
        model = Olympian
        sqla_session = db.session


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