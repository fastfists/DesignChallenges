from flask import Flask
from ext import *
from routes import bp

def create_app(config="settings") -> Flask:

    app = Flask(__name__)

    app.config.from_object(config)
    init_extensions(app)
    init_routes(app)

    return app

def init_routes(app: Flask):

    app.register_blueprint(bp)

def init_extensions(app):

    db.init_app(app)
    db.app = app
    ma.init_app(app)
    migrate.init_app(app, db)
