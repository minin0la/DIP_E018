import 'package:flutter/material.dart';
import 'date.dart';
import 'time.dart';
import 'constants.dart';

class datetime extends StatefulWidget {
  const datetime({Key? key}) : super(key: key);

  @override
  State<datetime> createState() => _datetimeState();
}

class _datetimeState extends State<datetime> {
  late final String dateTimeString;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: ListView.builder(
                  itemCount: historyData.length,
                  itemBuilder: (context, index) {
                    for (var product in historyData) {
                      return _historyCard(
                          context: context,
                          itemName: historyData[index]['name'].toString(),
                          qty: int.parse(historyData[index]['qty'].toString()),
                          price:
                              int.parse(historyData[index]['price'].toString()),
                          collectDate:
                              historyData[index]['collectDate'].toString(),
                          returnDate:
                              historyData[index]['returnDate'].toString(),
                          collectTime:
                              historyData[index]['collectTime'].toString(),
                          returnTime:
                              historyData[index]['returnTime'].toString(),
                          ticketNumber: int.parse(
                              historyData[index]['ticketNumber'].toString()),
                          displayPicture:
                              historyData[index]['displayPicture'].toString());
                    }
                    throw 'No Data Found';
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _historyCard(
    {required BuildContext context,
    required String itemName,
    required int qty,
    required int price,
    required String collectDate,
    required String returnDate,
    required String collectTime,
    required String returnTime,
    required int ticketNumber,
    required String displayPicture}) {
  final TextStyle subtitleStyles = TextStyle(
    fontFamily: 'SF_Pro_Rounded',
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Color(0xFF001D4A),
    wordSpacing: 1,
  );

  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: GestureDetector(
      onTap: () {},
      child: Card(
        color: Color(0xFFDBE4EE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 1,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, right: 10, top: 15, bottom: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: ListTile(
                  leading: Image.asset(
                    displayPicture,
                    height: 48,
                    width: 48,
                  ),
                  title: Text(
                    itemName,
                    style: TextStyle(
                      fontFamily: 'SF_Pro_Rounded',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF001D4A),
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text('#$ticketNumber', style: subtitleStyles),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
