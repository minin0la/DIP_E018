import 'package:flutter/material.dart';
import 'models/booking_models.dart';

class BookingWidgets extends StatelessWidget {
  const BookingWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: ListView.builder(
            itemCount: Booking.bookings.length,
            itemBuilder: (BuildContext context, int index) {
              return BookingWidgetsCard(index: index);
            }));
  }
}

class BookingWidgetsCard extends StatelessWidget {
  final int index;
  BookingWidgetsCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              Booking.bookings[index].imageUrl,
            ),
          ),
          Expanded(child: Text(Booking.bookings[index].name)),
          Expanded(child: Text('${Booking.bookings[index].price}')),
        ],
      ),
    );
  }
}
