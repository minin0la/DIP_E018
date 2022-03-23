import 'package:intl/intl.dart';

final now = "2022-03-16 12:00:00";

var notificationData = [
  {
    "storeName": "UROC",
    "itemName": "Overcooked",
    "receiveTime": "2022-03-16 11:55:00",
    "ticketNumber": 59,
    "displayPicture": 'images/Image_uroc.png'
  },
  {
    "storeName": "CISS",
    "itemName": "Breadboard",
    "receiveTime": "2022-03-16 11:45:00",
    "ticketNumber": 43,
    "displayPicture": 'images/Image_ciss.png'
  },
  {
    "storeName": "UROC",
    "itemName": "Mario Kart Deluxe",
    "receiveTime": "2022-03-16 11:40:00",
    "ticketNumber": 28,
    "displayPicture": 'images/Image_uroc.png'
  },
  {
    "storeName": "CISS",
    "itemName": "Jumper Wire",
    "receiveTime": "2022-03-16 11:30:00",
    "ticketNumber": 7,
    "displayPicture": 'images/Image_ciss.png'
  },
];

var categories = <String>['Recreation', 'Laboratory', 'Inventory'];

var bookingsData = [
  {
    "user": 'MICH0090@e.ntu.edu.sg',
    "name": "Overcooked",
    "qty": 1,
    "price": 5,
    "collectDate": DateFormat.yMd().format(DateTime(2022, 3, 19)),
    "returnDate": DateFormat.yMd().format(DateTime.now()),
    "collectTime": DateFormat.jm().format(DateTime.now()),
    "returnTime": DateFormat.jm().format(DateTime.now()),
    "ticketNumber": 7,
    "displayPicture": 'images/Image_overcooked.jpg',
    "itemLoc": 'Box',
    "returned": 'Yes',
    "imgCapture": 'images/overcooked_cd.jpeg'
  },
  {
    "user": 'STEP0003@e.ntu.edu.sg',
    "name": "Mario Kart Deluxe",
    "qty": 2,
    "price": 10,
    "collectDate": DateFormat.yMd().format(DateTime.now()),
    "returnDate": '-',
    "collectTime": DateFormat.jm().format(DateTime.now()),
    "returnTime": '-',
    "ticketNumber": 28,
    "displayPicture": 'images/Image_mariokartdeluxe.jpg',
    "itemLoc": 'User',
    "returned": 'No',
    "imgCapture": 'images/mario_kart_cd.jpeg'
  },
  {
    "user": 'JOHN0120@e.ntu.edu.sg',
    "name": "FIFA 22",
    "qty": 3,
    "price": 2.5,
    "collectDate": DateFormat.yMd().format(DateTime.now()),
    "returnDate": '-',
    "collectTime": DateFormat.jm().format(DateTime.now()),
    "returnTime": '-',
    "ticketNumber": 9,
    "displayPicture": 'images/Image_fifa22.jpeg',
    "itemLoc": 'Box',
    "returned": 'No',
    "imgCapture": 'images/fifa_cd.jpeg'
  },
];
