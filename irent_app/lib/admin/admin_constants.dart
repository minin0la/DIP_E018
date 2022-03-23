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
  },
];
