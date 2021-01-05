from flask import Blueprint, request, jsonify
from ext import db
from sqlalchemy.sql.expression import func
from schemas import PictureSchema, WinLossSchema
from models import Picture
from flask import request, Blueprint

bp = Blueprint("bp", __name__)

@bp.route('/')
def index():
    return "hi"


"""
outupt:
{
    pics : [
        {
        id: 
        "pic_url"
        },
        {
        id: 
        "pic_url"
        }
    ]
}
"""
@bp.route("/pics")
def pics():
    schema = PictureSchema(many=True)
    pics = Picture.query.order_by(func.random()).limit(2).all()
    for i in range(2):
        pics[i].image_url = request.host + pics[i].image_url

    return schema.jsonify(pics)

"""
input:
{
    winner: winnerId,
    loser: loserId,
    tie 
}
"""
@bp.route("/scores", methods=["POST"])
def update_scores():
    schema = WinLossSchema()
    body = schema.load(request.json)
    # do some cleaning

    apply_scores(body)

def update_rate(picture, other, score, maxPoints=32):

    frac = (other.rating - picture.rating) / 400
    expected = 1 / (1 + 10.0**frac)

    picture.rating = picture.rating + maxPoints * (score - expected)


def apply_scores(body):

    winner = Picture.query.get(body.get("winner"))
    loser  = Picture.query.get(body.get("loser"))

    if body.get("tie"):
        update_rate(winner, loser, 1/2)
        update_rate(loser, winner, 1/2)
    else:
        update_rate(winner, loser, 1)
        update_rate(loser, winner, 0)

    db.session.add(winner)
    db.session.add(loser)
    db.session.commit()

