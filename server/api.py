from flask import Flask, request, jsonify

from models import db, Event  # Import your Event model

app = Flask(__name__)

# Dummy event data for illustration
events = {
    "No Type Part III": {
        "vibe": "Chill",
        "time_date": "1:00 PM - 3:00 PM, Thursday, June 30th",
        "location": "123 Main St",
        "ticket_price": "$20",
    },
    "Brunch Party": {
        "vibe": "Relaxed",
        "time_date": "10:00 AM - 12:00 PM, Saturday, July 1st",
        "location": "456 Elm St",
        "ticket_price": "$25",
    },
    "1 Motif Party": {
        "vibe": "Exciting",
        "time_date": "8:00 PM - 11:00 PM, Friday, July 2nd",
        "location": "789 Oak St",
        "ticket_price": "$30",
    }
}


# @app.get('/api/event/<name>')
# def get_event_by_name(name):
#     event = Event.query.filter_by(name=name).first()
#     if event:
#         return jsonify({
#             'vibe': event.vibe,
#             'time_date': event.time_date,
#             'location': event.location,
#             'ticket_price': event.ticket_price
#         }), 200
#     else:
#         return jsonify({'error': 'Event not found'}), 404
    
@app.route('/api/event/<event_name>')
def get_event_details(event_name):
    if event_name in events:
        return jsonify(events[event_name])
    else:
        return jsonify({"error": "Event not found"}), 404


@app.route('/api', methods = ['GET'])
def returnascii():
    d= {}
    inputchr = str(request.args['query'])
    answer = str(ord(inputchr))
    d['output'] = answer
    return d
    
if __name__ =="__main__":
    app.run(port=5555, debug=True)