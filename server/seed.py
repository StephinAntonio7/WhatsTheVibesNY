from app import app, db
from models import Event

with app.app_context():
    print("Seeding database...")
    Event.query.delete()
        
    events = []

    e1 = Event(
        name='No Type Part III',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Afrobeats',
        time='4:00 PM - 9:00 PM',
        date='Saturday, June 1st',
        location='90 Scott Ave' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/No Type Part III.JPEG'
    )
    events.append(e1)

    e2 = Event(
        name='Brunch Party',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Day Party' '/' 'Dancehall',
        time='1:00 PM - 8:00 PM',
        date='Sunday, June 9th',
        location='128 Metropolitan Ave' ',' ' Brooklyn' ',' ' NY',
        price='$30',
        image='assets/images/Brunch Party.jpg'
    )
    events.append(e2)

    e3 = Event(
        name='1 Motif Party',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Afrobeats',
        time='9:00 PM - 3:00 AM',
        date='Friday, July 1st',
        location='The Sultan Room' ',' ' Brooklyn' ',' ' NY',
        price='$25',
        image='assets/images/1 Motif Party.jpeg'
    )
    events.append(e3)
    
    e4 = Event(
        name='First Thursdays',
        vibe='Hip-Hop' '/' 'R&B',
        time='9:00 PM - 1:00 AM',
        date='Thursday, June 6th',
        location='50 Bowery' ',' ' New York' ',' ' NY',
        price='$25',
        image='assets/images/First Thursdays.png'
    )
    events.append(e4)
    
    e5 = Event(
        name='Familiar Faces',
        vibe='Hip-Hop' '/' 'R&B',
        time='9:00 PM - 2:00 AM',
        date='Saturday June 15th',
        location='The Sultan Rooftop' ',' ' Brooklyn' ',' ' NY',
        price='$25',
        image='assets/images/Familiar Faces.jpg'
    )
    events.append(e5)
    
    e6 = Event(
        name='Frequency Zoo',
        vibe='Dance' '/' 'Electronic',
        time='10:30 PM - 3:00 AM',
        date='Fridays, July 19th',
        location='Elsewhere' ',' ' Brooklyn' ',' ' NY',
        image='assets/images/Frequency.jpg'
    ) 
    events.append(e6)
    
    e7 = Event(
        name='BK Block Party',
        vibe='Hip-Hop' '/' 'R&B',
        time='3:00 PM - 7:00 PM',
        date='Thursday July 4th',
        location='410 Quincy Ave' ',' ' Brooklyn' ',' ' NY',
        price='Free',
        image='assets/images/BK Block Party.jpg'
    )
    events.append(e7)
    
    e8 = Event(
        name='Notion + Pocket',
        vibe='Dance' '/' 'Dubstep',
        time='9:00 PM - 11:00 PM',
        date='Friday, August 16th',
        location='Elsewhere Rooftop' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Dance Dubs.jpg'
    )
    events.append(e8)

    e9 = Event(
        name='Bedquin',
        vibe='Deep House',
        time='3:00 PM - 2:00 AM',
        date='Saturday August 17th',
        location='Knockdown Center' ',' ' Queens' ',' ' NY',
        price='$20',
        image='assets/images/Familiar Faces.jpg'
    )
    events.append(e9)

    e10 = Event(
        name='Lavern',
        vibe='Dance',
        time='6:00 PM - 2:00 AM',
        date='Friday, August 23rd',
        location='599 Johnson Ave' ',' ' Brooklyn' ',' ' NY',
        price='Free',
        image='assets/images/Lavern.jpg'
    )
    events.append(e10)

    e11 = Event(
        name='Culture Shock',
        vibe='Pop' '/' 'Dance' '/' 'Electronic',
        time='9:00 PM - 2:00 AM',
        date='Saturday, August 17th',
        location='Elsewhere' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Culture Shock.jpg'
    )
    events.append(e11)

    e12 = Event(
        name='X & Ivy',
        vibe='Dance' '/' 'Pop',
        time='9:00 PM - 2:00 AM',
        date='Thursday July, 11th',
        location='Elsewhere' ',' ' Brooklyn' ',' ' NY',
        price='25',
        image='assets/images/X & Ivy.jpg'
    )
    events.append(e12)

    e13 = Event(
        name='ESG + Midnight Magic',
        vibe='Punk' '/' 'Hip-hop' '/' 'Funk',
        time='3:00 PM - 7:00 PM',
        date='Friday, August 23rd',
        location='Elsewhere' ',' ' Brooklyn' ',' ' NY',
        price='$40',
        image='assets/images/ESG.jpg'
    )
    events.append(e13)

    e14 = Event(
        name='Gayjoy Pride',
        vibe='Pop' '/' 'Electronic',
        time='9:00 PM - 2:00 AM',
        date='Tursday, June 4th',
        location='Elsewhere' ',' ' Brooklyn' ',' ' NY',
        price='$30',
        image='assets/images/Pride.jpg'
    )
    events.append(e14)

    e15 = Event(
        name='South House X Naija House',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Afrobeats',
        time='10:30 PM - 4:00 AM',
        date='Tuesday, June 18th',
        location='The Well',
        price='$30',
        image='assets/images/South House.jpg'
    )
    events.append(e15)

    e16 = Event(
        name='No Requests',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='10:00 PM - 4:00 AM',
        date='Friday, June 21st',
        location='Our Wicked Lady' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/No Requests.jpg'
    )
    events.append(e16)

    e17 = Event(
        name='Balcony Mix Africa',
        vibe='Hip-Hop' '/' 'Afrobeats',
        time='3:00 PM - 7:00 PM',
        date='Saturday, June 15th',
        location='52-19 Flushing Ave' ',' ' Queens' ',' ' NY', 
        price='$30',
        image='assets/images/Major League.jpg'
    )
    events.append(e17)

    e18 = Event(
        name='A NY Juneteenth',
        vibe='Hip-Hop' '/' 'R&B',
        time='3:00 PM - 7:00 PM',
        date='Wednesday, June 19th',
        location='The Crown' ',' ' New York' ',' ' NY',
        price='Free',
        image='assets/images/A NY Juneteenth.jpg'
    )
    events.append(e18)

    e19 = Event(
        name='Bladee',
        vibe='Hip-Hop' '/' 'Rap',
        time='9:00 PM - 2:00 AM',
        date='Thursday October, 17th',
        location='Elsewhere' ',' ' Brooklyn' ',' ' NY',
        price='$40',
        image='assets/images/Bladee.jpg'
    )
    events.append(e19)

    e20 = Event(
        name='CMYK',
        vibe='Pop' '/' 'Electronic',
        time='3:00 PM - 2:00 AM',
        date='Friday, June 14th',
        location='Knockdown Center' ',' ' Queens' ',' ' NY',
        price='$40',
        image='assets/images/CMYK.jpg'
    )
    events.append(e20)
    
    e21 = Event(
        name='One Night',
        vibe='Hip-Hop' '/' 'R&B',
        time='10:00 PM - 4:00 AM',
        date='Saturday, June 22nd',
        location='Knockdown Center' ',' ' Queens' ',' ' NY',
        price='$30',
        image='assets/images/One Night.jpg'
    )
    events.append(e21)

    e22 = Event(
        name='Versus',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='10:00 PM - 2:00 AM',
        date='Thursday, June 20th',
        location='Cafe Erzulie',
        price='$20',
        image='assets/images/Versus.jpg'
    )
    events.append(e22)
    
    e23 = Event(
        name='Sound Wav',
        vibe='Dance' '/' 'Electronic' '/' 'Pop',
        time='10:00 PM - 2:00 AM',
        date='Thursday, June 20th',
        location='Cafe Erzulie' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Sound wav.jpg'
    )
    events.append(e23)
    
    e23 = Event(
        name='Whine Up',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='10:00 PM - 2:00 AM',
        date='Thursday, June 20th',
        location='Cafe Erzulie' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Whine Up.jpg'
    )
    events.append(e23)

    db.session.add_all(events)
    db.session.commit()

    print("Seeding complete!")