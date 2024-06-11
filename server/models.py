from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import MetaData
from sqlalchemy.orm import validates
from sqlalchemy.ext.associationproxy import association_proxy
from sqlalchemy_serializer import SerializerMixin

metadata = MetaData(naming_convention={
    "fk": "fk_%(table_name)s_%(column_0_name)s_%(referred_table_name)s",
})

db = SQLAlchemy(metadata=metadata)

class User(db.Model, SerializerMixin):
    
    __tablename__ = 'users_table'
    
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String, nullable=False, unique=True)
    _hashed_password = db.Column(db.String)
    events = db.relationship('Event', back_populates='user')
    
    serialize_rules = ['-events.user']
    
    def __repr__(self):
        return f'User(username={self.username})'
    
    # TODO Add validations
    # @validates('username')
    # def validate_user(self, key, value):
    #     updated_value = value.strip().replace(' ', '_')
    #     if updated_value.length() > 4:
    #         return updated_value

class Event(db.Model, SerializerMixin):
    
    __tablename__ = 'events_table'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    image = db.Column(db.String)
    time= db.Column(db.Integer)
    date= db.Column(db.Integer)
    user_id = db.Column(db.Integer, db.ForeignKey('users_table.id'))
    
    user = db.relationship('User', back_populates='events')
    
    serialize_rules = ['-user.events']
    
    def __repr__(self):
        return f'Event(id={self.id}, name={self.name}, image={self.image}, time={self.time}, date={self.date}, user_id={self.user_id})'