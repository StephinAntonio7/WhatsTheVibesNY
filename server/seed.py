from app import app
from models import db, User, Event

with app.app_context():
    print("Seeding database...")
    Event.query.delete()
        
    events = []

    e1 = Event(
        name='No Type Part III',
        vibe='chill',
        time='1:00 PM - 3:00 PM',
        date='Thursday, June 30th',
        location='123 Main St',
        price='$20',
        image='assets/images/No Type Part III.JPEG'
    )
    events.append(e1)

    e2 = Event(
        name='Brunch Party',
        vibe='Exciting',
        time='8:00 PM - 11:00 PM',
        date='Friday, July 2nd',
        location='789 Oak St',
        price='$30',
        image='assets/images/Brunch Party.jpg'
    )
    events.append(e2)

    e3 = Event(
        name='1 Motif Party',
        vibe='Exciting',
        time='9:00 PM - 1:00 AM',
        date='Friday, July 1st',
        location='456 Elm St',
        price='$25',
        image='assets/images/1 Motif Party.jpeg'
    )
    events.append(e3)

    db.session.add_all(events)
    db.session.commit()

    print("Seeding complete!")