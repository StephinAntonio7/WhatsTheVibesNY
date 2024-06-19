import os
import logging
from flask import Flask
from flask_cors import CORS
from dotenv import load_dotenv
from extensions import db, bcrypt
from routes import routes_bp

load_dotenv()

app = Flask(__name__)
app.secret_key = os.environ.get('SECRET_KEY') or 'fallback_secret_key'
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///app.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
CORS(app)

# Initialize SQLAlchemy and Bcrypt
db.init_app(app)
bcrypt.init_app(app)

# Setup logging
logging.basicConfig(level=logging.DEBUG)  # Set log level as per your requirement
app.logger.addHandler(logging.StreamHandler())  # Output logs to console

# Import models after initializing the app to avoid circular import issues
with app.app_context():
    from models import User, Event

# Register routes blueprint
app.register_blueprint(routes_bp)

if __name__ == "__main__":
    app.run(port=5555, debug=True)
