import 'package:intl/intl.dart';

const String whatIsiRent =
    """Simple and convenient - the first ever automated borrowing system that integrates all loaning and returning of items at NTU. Plan ahead and book items with a mere tap, then proceeed ahead to our iRent machines spread across various locations to collect. Even better, cashless payments are supported for all services.""";

const String policy_1 =
    """A deposit of \$5 are required to be made prior to make the first booking. For subsequent bookings, a minimum \$2 deposit is required.""";

const String policy_2 =
    """A fine will immediately be deducted from the user's wallet under the following circumstances upon returning of each item:
1. \$0.5 fine for every damage found on the item
2. \$1 fine for every 15 minutes of late return
3. Purchasing amount for every missing or mismatched item""";

const String policy_3 =
    """The remaining amount in the user's wallet will be transferred to his linked bank account upon uninstallment of the application.""";

var shops = <String>['Select', 'UROC', 'CISS Lab', 'iHub', 'EEE Inventory'];
var items_UROC = <String>[
  'Select',
  'Mario Kart 8 Deluxe',
  'Wii Game Console',
  'Monopoly Cards',
  'Ping Pong Racket'
];

var historyData = [
  {
    "name": "Overcooked",
    "qty": 1,
    "price": 5,
    "collectDate": DateFormat.yMd().format(DateTime.now()),
    "returnDate": DateFormat.yMd().format(DateTime.now()),
    "collectTime": DateFormat.jm().format(DateTime.now()),
    "returnTime": DateFormat.jm().format(DateTime.now()),
    "ticketNumber": 7,
    "displayPicture": 'images/Image_overcooked.jpg'
  },
  {
    "name": "Mario Kart Deluxe",
    "qty": 2,
    "price": 10,
    "collectDate": DateFormat.yMd().format(DateTime.now()),
    "returnDate": DateFormat.yMd().format(DateTime.now()),
    "collectTime": DateFormat.jm().format(DateTime.now()),
    "returnTime": DateFormat.jm().format(DateTime.now()),
    "ticketNumber": 28,
    "displayPicture": 'images/Image_mariokartdeluxe.jpg'
  },
  {
    "name": "FIFA 22",
    "qty": 3,
    "price": 2,
    "collectDate": DateFormat.yMd().format(DateTime.now()),
    "returnDate": DateFormat.yMd().format(DateTime.now()),
    "collectTime": DateFormat.jm().format(DateTime.now()),
    "returnTime": DateFormat.jm().format(DateTime.now()),
    "ticketNumber": 9,
    "displayPicture": 'images/Image_fifa22.jpeg'
  },
];

var historyDetailsTest = [
  {
    "name": "Overcooked",
    "qty": 1,
    "price": 5,
    "collected": DateFormat.yMd().add_jm().format(DateTime.now()),
    "returned": DateFormat.yMd().add_jm().format(DateTime.now()),
    "ticketNumber": 7,
    "displayPicture": 'images/Image_overcooked.jpg'
  },
];

var stores = [
  {
    "store_name": "URCC @ Student Activity Centre",
    "address":
        "North Spine, NS3-01-03, 50 Nanyang Ave, Block N3.1, Singapore 639798",
    "category": "Recreational Games",
    "displayStorePicture": 'images/Image_uroc.png'
  },
  {
    "store_name": "Centre for Information Sciences and Systems (CISS)",
    "address": "50 Nanyang Ave S2-B4b-05, Singapore 639798",
    "category": "EEE Laboratories",
    "displayStorePicture": 'images/Image_ciss.png'
  },
];

var products = [
  {"displayPicture": 'images/Image_mariokartdeluxe.jpg'},
  {"displayPicture": 'images/Image_supermario.jfif'},
  {"displayPicture": 'images/Image_overcooked.jpg'},
  {"displayPicture": 'images/Image_fifa22.jpeg'},
  {"displayPicture": 'images/Image_madden18.jpg'},
];

// ignore: non_constant_identifier_names
var productDetails = [
  {
    "name": "Mario Kart Deluxe",
    "product_category": "Console Game",
    "pricePerhour": "1",
    "displayPicture": 'images/Image_mariokartdeluxe.jpg'
  },
  {
    "name": "Super Mario",
    "product_category": "Console Game",
    "pricePerhour": "1",
    "displayPicture": 'images/Image_supermario.jfif'
  },
  {
    "name": "Overcooked",
    "product_category": "Console Game",
    "pricePerhour": "1",
    "displayPicture": 'images/Image_overcooked.jpg'
  },
  {
    "name": "Fifa 22",
    "product_category": "Console Game",
    "pricePerhour": "1",
    "displayPicture": 'images/Image_fifa22.jpeg'
  },
  {
    "name": "Madden 18",
    "product_category": "Console Game",
    "pricePerhour": "1",
    "displayPicture": 'images/Image_madden18.jpg'
  },
];

var mariokart = [
  {
    "name": "Mario Kart Deluxe",
    "product_category": "Console Game",
    "pricePerhour": "1",
    "displayPicture": 'images/Image_mariokartdeluxe.jpg'
  }
];
