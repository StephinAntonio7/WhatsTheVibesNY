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
    
    e24 = Event(
        name='Big Band Jubilee',
        vibe='Jazz' '/' 'Chill',
        time='8:00 PM - 11:00 PM',
        date='Wednesday, June 19th',
        location='West 119th St' ',' ' Harlem' ',' ' NY',
        price='$10',
        image='assets/images/Big Band Jubilee.jpg'
    )
    events.append(e24)

    e25 = Event(
        name='We Outside',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='2:00 PM - 8:00 PM',
        date='Thursday, June 20th',
        location='The Plaza 300 Ashland' ',' ' Brooklyn' ',' ' NY',
        price='Free',
        image='assets/images/We Outside.jpg'
    )
    events.append(e25)

    e26 = Event(
        name='Harlem Late Night Jazz',
        vibe='Jazz' '/' 'Blues' '/' 'Chill',
        time='8:00 PM - 12:00 AM',
        date='Thursday, June 20th',
        location='107 W 130th St' ',' ' Harlem' ',' ' NY',
        price='$10',
        image='assets/images/Harlem Late Night Jazz.jpg'
    )
    events.append(e26)

    e27 = Event(
        name='Summer Jazz Series',
        vibe='Jazz' '/' 'Festival' '/' 'Chill',
        time='6:00 PM - 7:30 AM',
        date='Thursday, June 20th',
        location='Montefiore Square Park' ',' ' Harlem' ',' ' NY',
        price='$30',
        image='assets/images/Summer Jazz Series.jpg'
    )
    events.append(e27)

    e28 = Event(
        name='Jazz Fest Party',
        vibe='Jazz' '/' 'Live Music' '/' 'Chill',
        time='5:00 PM - 10:00 AM',
        date='Friday, June 21th',
        location='127 East Ave' ',' ' Rochester' ',' ' NY',
        price='$20',
        image='assets/images/Jazz Fest Party.jpg'
    )
    events.append(e28)

    e29 = Event(
        name='Juneteenth With Masego',
        vibe='R&B' '/' 'Jazz' '/' 'Live Music',
        time='7:00 PM - 12:00 AM',
        date='Wednesday, June 19th',
        location='Central Park' ',' ' New York' ',' ' NY',
        price='$70',
        image='assets/images/Juneteenth With Masego.jpg'
    )
    events.append(e29)

    e30 = Event(
        name='More R&B Please',
        vibe='Classic' '/' 'New' '/' '90s' '/' 'Slow Jams',
        time='4:00 PM - 10:00 PM',
        date='Saturday, June 22th',
        location='Our Wicked Lady' ',' ' Brooklyn' ',' ' NY',
        price='$10',
        image='assets/images/More R&B Please.jpg'
    )
    events.append(e30)

    e31 = Event(
        name='Tompkins Block Party',
        vibe='Hip-Hop' '/' 'R&B' '/' '90s' '/' 'Afrobeats',
        time='1:00 PM - 7:00 PM',
        date='Every Sunday' ',' 'June-October',
        location='Tompkins Ave' ',' ' Brooklyn' ',' ' NY',
        price='Free',
        image='assets/images/Tompkins Ave.jpg'
    )
    events.append(e31)

    e32 = Event(
        name='Elevate Social',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='10:00 PM - 4:00 AM',
        date='Saturday, June 22th',
        location='Cafe Erzulie' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Elevate Social.jpg'
    )
    events.append(e32)

    e33 = Event(
        name='Juneteenth Block Party',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='2:00 PM - 8:00 PM',
        date='Saturday, June 22th',
        location='2082 Frederick Douglass Blvd' ',' ' New York' ',' ' NY',
        price='$20',
        image='assets/images/Juneteenth Block Party.jpg'
    )
    events.append(e33)
    
    e34 = Event(
        name='Hello Summer The BBQ',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='2:00 PM - 8:00 PM',
        date='Saturday, June 22th',
        location='191 N 14th St' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Hello Summer The BBQ.jpg'
    )
    events.append(e34)
    
    e35 = Event(
        name='No Filter',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='10:00 PM - 4:00 AM',
        date='Saturday, June 22th',
        location='The Bell House' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/No Filter.jpg'
    )
    events.append(e35)
    
    e36 = Event(
        name='Ginja',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='10:00 PM - 4:00 AM',
        date='Friday, June 21th',
        location='Crown Hill Theater' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Ginja.jpg'
    )
    events.append(e36)
    
    e37 = Event(
        name='Parks & Rec',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='10:00 PM - 4:00 AM',
        date='Tuesday, June 18th',
        location='Cafe Erzulie' ',' ' Brooklyn' ',' ' NY',
        price='$18',
        image='assets/images/Parks & Rec.jpg'
    )
    events.append(e37)

    e38 = Event(
        name='Suede',
        vibe='R&B' '/' 'Chill' '/' '90s' '/' 'Slow Jams',
        time='7:00 PM - 1:00 AM',
        date='Saturday, June 22th',
        location='4709 Center Blvd' ',' ' Queens' ',' ' NY',
        price='$20',
        image='assets/images/Suede.jpg'
    )
    events.append(e38)

    e39 = Event(
        name='Bushwick Grand',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='10:00 PM - 4:00 AM',
        date='Tuesday, June 18th',
        location='Silo' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Bushwick Grand.jpg'
    )
    events.append(e39)

    e40 = Event(
        name='I Heart R&B',
        vibe='R&B' '/' '90s' '/' 'Slow Jams' '/' 'Chill',
        time='2:00 PM - 9:00 PM',
        date='Saturday, June 22th',
        location='Coney Island' ',' 'Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/I Heart R&B.jpg'
    )
    events.append(e40)

    e41 = Event(
        name='Beautiful Memorial Day',
        vibe='Hip-Hop' '/' 'R&B' '/' 'Dancehall' '/' 'Afrobeats',
        time='5:00 PM - 11:00 PM',
        date='Saturday, May 25th',
        location='70 Scott Ave' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Beautiful Faces.jpg'
    )
    events.append(e41)

    e42 = Event(
        name='Brown Sugar Bounce',
        vibe='Hip-Hop' '/' 'R&B' '/' '2000s' '/' 'Afrobeats',
        time='5:00 PM - 10:00 PM',
        date='Wednesday, June 19th',
        location='315 Meserole St' ',' ' New York' ',' ' NY',
        price='$20',
        image='assets/images/Brown Sugar Bounce.jpg'
    )
    events.append(e42)

    e43 = Event(
        name='Lomiiel Live',
        vibe='Reggaeton' '/' 'Urbano Latino' '/' 'Live Music' '/' 'Hype',
        time='8:00 PM - 4:00 AM',
        date='Thursday, July 4th',
        location='2458 Webster Ave' ',' ' Bronx' ',' ' NY',
        price='$30',
        image='assets/images/Lomiiel Live.jpg'
    )
    events.append(e43)

    e44 = Event(
        name='Do It For The Likes',
        vibe='Raggaeton' '/' 'Hip-hop' '/' 'Urbano Latino',
        time='10:00 PM - 4:00 AM',
        date='Saturday, June 22th',
        location='2458 Webster Ave' ',' ' Bronx' ',' ' NY',
        price='$30',
        image='assets/images/For The Likes.jpg'
    )
    events.append(e44)

    e45 = Event(
        name='The Social Brunch',
        vibe='Raggaeton' '/' 'Hip-hop' '/' 'Urbano Latino',
        time='1:00 PM - 7:00 PM',
        date='Saturday, June 22th',
        location='2458 Webster Ave' ',' ' Bronx' ',' ' NY',
        price='$45',
        image='assets/images/Social Brunch.jpg'
    )
    events.append(e45)

    e46 = Event(
        name='Love From The Sun',
        vibe='Hip-Hop' '/' 'R&B' '/' 'House' '/' 'Reggae',
        time='2:00 PM - 9:00 PM',
        date='Wednesday, June 19th',
        location='Nowadays' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Love From The Sun.jpg'
    )
    events.append(e46)
    
    e46 = Event(
        name='Nonstop',
        vibe='Dance' '/' 'Electronic' '/' 'Hype',
        time='10:00 PM - 4:00 AM',
        date='Saturday, July 13th',
        location='Nowadays' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Nonstop.jpg'
    )
    events.append(e46)

    e47 = Event(
        name='All Night Juana',
        vibe='Dance' '/' 'Pop' '/' 'House',
        time='10:00 PM - 4:00 AM',
        date='Friday, July 19th',
        location='Nowadays' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/All Night Juana.jpg'
    )
    events.append(e47)

    e48 = Event(
        name='Label Night: Dark Entries',
        vibe='Dance' '/' 'Pop' '/' 'House',
        time='10:00 PM - 4:00 AM',
        date='Friday, July, 5th',
        location='Nowadays' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Label Night.jpg'
    )
    events.append(e48)

    e49 = Event(
        name='Nonstop',
        vibe='Electronic' '/' 'Dance' '/' 'House' '/' 'Hype',
        time='10:00 PM - 4:00 AM',
        date='Saturday, July 6th',
        location='Nowadays' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Nonstop 2.jpg'
    )
    events.append(e49)

    e50 = Event(
        name='Residency Night',
        vibe='Electronic' '/' 'Dance' '/' 'House' '/' 'Hype',
        time='10:00 PM - 4:00 AM',
        date='Friday, July 12th',
        location='Nowadays' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Residency Night.jpg'
    )
    events.append(e50)

    e51 = Event(
        name='Groovy Nonstop',
        vibe= 'Electronic' '/' 'Dance' '/' 'House',
        time='10:00 PM - 4:00 AM',
        date='Saturday, July 20th',
        location='Nowadays' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Groovy Nonstop.jpg'
    )
    events.append(e51)

    e52 = Event(
        name='Likkle Wednesday',
        vibe='Dancehall' '/' 'Reggae' '/' 'Hip-Hop' '/' 'R&B',
        time='11:00 PM - 4:00 AM',
        date='Wednesday, June 19th',
        location='641 Classon Ave' ',' ' Brooklyn' ',' ' NY',
        price='Free',
        image='assets/images/Likkle Wednesday.jpg'
    )
    events.append(e52)

    e53 = Event(
        name='Love From The Sun',
        vibe='Dancehall' '/' 'Reggae' '/' 'Hip-Hop' '/' 'R&B',
        time='10:00 PM - 4:00 AM',
        date='Thursdays',
        location='Miss Lily/s' ',' ' New York' ',' ' NY',
        price='$10',
        image='assets/images/Yard + Abroad.jpg'
    )
    events.append(e53)

    e54 = Event(
        name='Daft Disko',
        vibe='French House' '/' 'Disco' '/' 'Dance' '/' 'Hype',
        time='10:00 PM - 4:00 AM',
        date='Friday, June 21th',
        location='Schimanski' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Daft Disko.jpg'
    )
    events.append(e54)

    e55 = Event(
        name='Dolly House',
        vibe='Dancehall' '/' 'Reggae' '/' 'Hip-Hop' '/' 'R&B',
        time='2:00 PM - 9:00 PM',
        date='Saturday, June 29th',
        location='9505 Farragut Rd' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Dolly House.jpg'
    )
    events.append(e55)

    e56 = Event(
        name='Sip Grill & Chill',
        vibe='Dancehall' '/' 'Reggae' '/' 'Hip-Hop' '/' 'R&B',
        time='10:00 PM - 4:00 AM',
        date='Friday, June 14th',
        location='9505 Farragut Rd' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Sip Grill & Chill 2.jpg'
    )
    events.append(e56)

    e57 = Event(
        name='Palm Wine Music Festival',
        vibe='Dancehall' '/' 'Afrobeats' '/' 'Live Music',
        time='6:00 PM - 12:00 PM',
        date='Saturday, August 17th',
        location='Central Park' ',' ' New York' ',' ' NY',
        price='$50',
        image='assets/images/Palm Wine Music.jpg'
    )
    events.append(e57)

    e58 = Event(
        name='Gov Ball',
        vibe='Hip-hop' '/' 'Pop' '/' 'Rock' '/' 'Country',
        time='10:00 PM - 4:00 AM',
        date='June 7-9th',
        location='Flushing Meadows Corona Park' ',' ' Queens' ',' ' NY',
        price='$70',
        image='assets/images/Gov Ball.jpg'
    )
    events.append(e58)

    e59 = Event(
        name='Gyalifest',
        vibe='Dancehall' '/' 'Reggae' '/' 'Hip-Hop' '/' 'R&B',
        time='10:00 PM - 4:00 AM',
        date='Wednesday, June 19th',
        location='Industry City' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Gyalifest.jpg'
    )
    events.append(e59)

    e60 = Event(
        name='Circulate Black Dollars',
        vibe='Funky Reggae' '/' 'Dancehall' '/' 'House Party',
        time='12:00 PM - 7:00 PM',
        date='Saturday, June 22nd',
        location='629 Classon Ave' ',' ' Brooklyn' ',' ' NY',
        price='$20',
        image='assets/images/Circulate Black Dollars.jpg'
    )
    events.append(e60)

    db.session.add_all(events)
    db.session.commit()

    print("Seeding complete!")