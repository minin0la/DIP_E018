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

var userFeedbackData = [
  {
    "user": 'JOHN003@e.ntu.edu.sg',
    "itemName": "Overcooked",
    "submissionTime": "2022-03-16, 11:55:00",
    "ticketNumber": 59,
    "displayPicture": 'images/Image_overcooked.jpg',
    "feedbackType": 'Fault Report',
    "comments": 'CD is scratched. Cannot be played.'
  },
  {
    "user": 'MICH0090@e.ntu.edu.sg',
    "itemName": "Wii",
    "submissionTime": "2022-03-20, 15:30:00",
    "ticketNumber": 28,
    "displayPicture": 'images/wii_remote.png',
    "feedbackType": 'Fault Report',
    "comments": '\'A\' button is faulty. Cannot be pressed.'
  }
];

var alertData = [
  {
    "user": 'JOHN003@e.ntu.edu.sg',
    "itemName": "Overcooked",
    "returnTime": "2022-03-16, 11:55:00",
    "ticketNumber": 59,
    "displayPicture": 'images/wii_remote.png',
    "prevImage": 'images/wii_prevImage.png',
    "currentImage": 'images/wii_empty.png',
  },
  {
    "user": 'JOHN003@e.ntu.edu.sg',
    "itemName": "Overcooked",
    "returnTime": "2022-03-16, 11:55:00",
    "ticketNumber": 59,
    "displayPicture": 'images/wii_remote.png',
    "prevImage": 'images/wii_prevImage.png',
    "currentImage": 'images/wii_empty.png',
  }
];
var transactionData = [
  {
    "ticketNumber": 168,
    "paymentDate": "22-03-2022",
    "totalAmount": 12.5,
  },
  {
    "ticketNumber": 156,
    "paymentDate": "21-03-2022",
    "totalAmount": 6.15,
  },
  {
    "ticketNumber": 137,
    "paymentDate": "20-03-2022",
    "totalAmount": 3,
  },
  {
    "ticketNumber": 99,
    "paymentDate": "19-03-2022",
    "totalAmount": 7.5,
  },
  {
    "ticketNumber": 74,
    "paymentDate": "18-03-2022",
    "totalAmount": 5,
  },
  {
    "ticketNumber": 59,
    "paymentDate": "17-03-2022",
    "totalAmount": 2.5,
  },
  {
    "ticketNumber": 28,
    "paymentDate": "16-03-2022",
    "totalAmount": 10,
  }
];
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
