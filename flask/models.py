from app import db, ma


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
