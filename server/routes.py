from flask import Blueprint, jsonify, request, session, current_app
from models import User, Event
from extensions import db, bcrypt
from datetime import datetime, timedelta
import jwt

routes_bp = Blueprint('routes', __name__)

# Generate JWT Token
def generate_token(user_id):
    try:
        payload = {
            'exp': datetime.utcnow() + timedelta(days=1),
            'iat': datetime.utcnow(),
            'sub': user_id
        }
        return jwt.encode(payload, current_app.config['SECRET_KEY'], algorithm='HS256')
    except Exception as e:
        print(f"Error generating token: {e}")
        return None

# Define routes
@routes_bp.route('/api/login', methods=['POST'])
def login():
    try:
        data = request.json
        username = data.get('email')
        password = data.get('password')

        if not username or not password:
            print("Missing username or password")
            return jsonify({'message': 'Missing username or password'}), 400

        user = User.query.filter_by(username=username).first()

        if user and bcrypt.check_password_hash(user._hashed_password, password):
            token = generate_token(user.id)
            if token:
                print(f"Login successful for user: {username}")
                return jsonify({'token': token}), 200
            else:
                print("Token generation failed")
                return jsonify({'error': 'Token generation failed'}), 500
        else:
            print("Username or password is invalid")
            return jsonify({'error': 'Username or password is invalid'}), 401
    except Exception as e:
        print(f"Error in login: {e}")
        return jsonify({'error': str(e)}), 500

@routes_bp.route('/api/user-event', methods=['POST'])
def post_user_event():
    # Bypassing authentication (remove in production)
    # user_id = 1  # Provide actual user ID if needed
    
    # Retrieve event data from request JSON
    data = request.json
    name = data.get('name')
    vibe = data.get('vibe')
    date = data.get('date')
    time = data.get('time')
    location = data.get('location')
    price = data.get('price')
    image = data.get('image')

    # Example: Creating a new event
    new_event = Event(
        name=name,
        vibe=vibe,
        date=date,
        time=time,
        location=location,
        price=price,
        image=image,
        user_id=user_id,
        created_at=datetime.now(),
    )

    # Add event to database and commit
    db.session.add(new_event)
    db.session.commit()

    # Return the newly created event as JSON response
    return jsonify(new_event.to_dict()), 201

@routes_bp.route('/api/events', methods=['GET'])
def get_events():
    search = request.args.get('search')
    if search:
        events = Event.query.filter(
            (Event.vibe.ilike(f'%{search}%')) |
            (Event.name.ilike(f'%{search}%')) |
            (Event.location.ilike(f'%{search}%'))
        ).all()
    else:
        events = Event.query.all()
    return jsonify([event.to_dict() for event in events]), 200


@routes_bp.route('/api/event/<event_name>', methods=['GET'])
def get_event_by_name(event_name):
    event = Event.query.filter_by(name=event_name).first()
    if event:
        return jsonify(event.to_dict()), 200
    else:
        return jsonify({'error': 'Event not found'}), 404