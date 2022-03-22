class Booking {
  final String name;
  final double price;
  final int qty;
  final String imageUrl;
  final int collectionTime;
  final int returnTime;

  const Booking(
      {required this.name,
      required this.price,
      required this.qty,
      required this.imageUrl,
      required this.collectionTime,
      required this.returnTime});

  static const List<Booking> bookings = [
    Booking(
        name: 'Turning Red',
        price: 3.99,
        qty: 1,
        imageUrl:
            'https://image.tmdb.org/t/p/w300_and_h450_bestv2/iPhDToxFzREctUA0ZQiYZamXsMy.jpg',
        collectionTime: 1647967902,
        returnTime: 1648053367),
    Booking(
        name: 'Spider-Man: No Way Home',
        price: 3.99,
        qty: 1,
        imageUrl:
            'https://image.tmdb.org/t/p/w300_and_h450_bestv2/h22eEPJpdS47JisaEPevdj48fVT.jpg',
        collectionTime: 1647966969,
        returnTime: 1648053367),
    Booking(
        name: 'The Adam Project',
        price: 3.99,
        qty: 1,
        imageUrl:
            'https://image.tmdb.org/t/p/w300_and_h450_bestv2/ewUqXnwiRLhgmGhuksOdLgh49Ch.jpg',
        collectionTime: 1647966969,
        returnTime: 1648053367),
    Booking(
        name: 'Blacklight',
        price: 3.99,
        qty: 1,
        imageUrl:
            'https://image.tmdb.org/t/p/w300_and_h450_bestv2/2hGjmgZrS1nlsEl5PZorn7EsmzH.jpg',
        collectionTime: 1647966969,
        returnTime: 1648053367),
    Booking(
        name: 'The Batman',
        price: 3.99,
        qty: 1,
        imageUrl:
            'https://image.tmdb.org/t/p/w300_and_h450_bestv2/IYUD7rAIXzBM91TT3Z5fILUS7n.jpg',
        collectionTime: 1647966969,
        returnTime: 1648053367),
  ];
}
