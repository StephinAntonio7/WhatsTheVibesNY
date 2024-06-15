from models import db, Event, User
import os
from flask_bcrypt import Bcrypt
from flask import Flask, jsonify, request, session
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_cors import CORS


from dotenv import load_dotenv

load_dotenv()  


app = Flask(__name__)
app.secret_key = os.environ.get('SECRET_KEY')
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///app.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.json.compact = False

CORS(app)

bcrypt = Bcrypt(app)

migrate = Migrate(app, db)

db.init_app(app)

# Signup
@app.post('/api/users')
def create_user():
    try:
        new_user = User(username=request.json['username'])
        new_user._hashed_password = bcrypt.generate_password_hash(request.json["password"]).decode('utf=8')
        db.session.add(new_user)
        db.session.commit()
        print(new_user.id)
        session['user_id'] = new_user.id
        return new_user.to_dict(), 201
    except Exception as e:
        return { 'error': str(e) }, 406

# Check session
@app.get('/api/check-session')
def check_session():
    user = User.query.where(User.id == session['user_id']).first()
    if user:
        return user.to_dict(), 200
    else:
        return {}, 204

# Session login
@app.post('/api/login')
def login():
    print("attempted login")
    user = User.query.where(User.username == request.json.get('username')).first()
    if user and bcrypt.check_password_hash(user._hashed_password, request.json.get('password')):
        session['user_id'] = user.id
        return user.to_dict(), 201
    else:
        return {'error': 'Username or password was invalid'}, 401

# Session logout
@app.delete('/api/logout')
def logout():
    session.pop('user_id')
    return {}, 204

# GET EVENT DETAILS WHEN USER CLICKS EVENT IMAGE
@app.route('/api/event/<event_name>', methods=['GET'])
def get_event_details(event_name):
    event = Event.query.filter_by(name=event_name).first()
    if event:
        return jsonify(event.to_dict()), 200
    else:
        return jsonify({"error": "Event not found"}), 404
    
# POST NEW EVENT ON HOME SCREEN AFTER USER CREATES A NEW EVENT
@app.post('/api/user-event')
def post_user_event():
    user_id = session.get('user_id')
    if not user_id:
        return {"error": "Not logged in"}, 401
    
    event = Event(
        name=request.json['name'],
        vibe=request.json['vibe'],
        time=request.json['time'],
        date=request.json['date'],
        location=request.json['location'],
        price=request.json['price'],
        image=request.json['image'],
        user_id=user_id
    )
    db.session.add(event)
    db.session.commit()
    return event.to_dict(), 201

@app.route('/api', methods = ['GET'])
def returnascii():
    d= {}
    inputchr = str(request.args['query'])
    answer = str(ord(inputchr))
    d['output'] = answer
    return d
    
if __name__ =="__main__":
    app.run(port=5555, debug=True)