from extensions import db
# from datetime import datetime

class User(db.Model):
    __tablename__ = 'users_table'
    
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String, nullable=False, unique=True)
    _hashed_password = db.Column(db.String)
    events = db.relationship('Event', back_populates='user')
    
    def to_dict(self):
        return {
            'id': self.id,
            'username': self.username,
            'email': self.email,
        }
    
    def __repr__(self):
        return f'User(username={self.username})'

class Event(db.Model):
    __tablename__ = 'events_table'
    
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    vibe = db.Column(db.String)
    time = db.Column(db.Integer)
    date = db.Column(db.Integer)
    location = db.Column(db.String)
    price = db.Column(db.Integer)
    image = db.Column(db.String)
    user_id = db.Column(db.Integer, db.ForeignKey('users_table.id'))
    user = db.relationship('User', back_populates='events')
    
    # created_at = db.Column(db.DateTime, default=datetime.utcnow)  # Ensure this line is present

    def to_dict(self):
        return {
            'id': self.id,
            'name': self.name,
            'vibe': self.vibe,
            'time': self.time,
            'date': self.date,
            'location': self.location,
            'price': self.price,
            'image': self.image,
            'user_id': self.user_id
            # 'created_at': self.created_at.strftime('%Y-%m-%d %H:%M:%S') if self.created_at else None
        }
    
    def __repr__(self):
        return f'Event(id={self.id}, name={self.name})'
