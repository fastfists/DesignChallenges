from sqlalchemy import Column, String, Float, Integer
from ext import db

class Picture(db.Model):

    id = Column(Integer, unique=True, primary_key=True)
    image_url = Column(String, unique=True)
    rating = Column(Float, unique=False)

