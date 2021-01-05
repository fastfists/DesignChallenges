from app import create_app
import glob
from ext import db
from models import Picture

# create the app now we can use the database
create_app()

for image in glob.glob("static/images/*"):
    pic = Picture(image_url="/" + image, rating=1000) 
    db.session.add(pic)
    db.session.commit()
