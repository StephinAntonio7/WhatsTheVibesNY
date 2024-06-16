// class Event {
//   final int id;
//   final String eventName;
//   final String imageUrl;
//   final int time;
//   final int date;
//   final String location;
//   final String ticketPrice;
//   final int userId;

//   Event({
//     this.id = 0,
//     required this.eventName,
//     required this.imageUrl,
//     required this.time,
//     required this.date,
//     required this.location,
//     required this.ticketPrice,
//     this.userId = 0,
//   });

//   factory Event.fromJson(Map<String, dynamic> json) {
//     return Event(
//       id: json['id'] ?? 0,
//       eventName: json['eventName'],
//       imageUrl: json['imageUrl'],
//       time: json['time'],
//       date: json['date'],
//       location: json['location'],
//       ticketPrice: json['ticketPrice'],
//       userId: json['userId'] ?? 0,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'eventName': eventName,
//       'imageUrl': imageUrl,
//       'time': time,
//       'date': date,
//       'location': location,
//       'ticketPrice': ticketPrice,
//       'userId': userId,
//     };
//   }
// }
