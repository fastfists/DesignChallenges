from models import Picture
from ext import ma
from marshmallow.fields import Integer, Boolean

class PictureSchema(ma.SQLAlchemyAutoSchema):
    class Meta:
        model = Picture
        load_instance = True

class WinLossSchema(ma.Schema):

    winner = Integer()
    loser = Integer()
    tie = Boolean()
