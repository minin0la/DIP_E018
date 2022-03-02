import 'package:flutter/material.dart';
import 'package:irent_app/size_config.dart';

class user_payment_overcooked extends StatelessWidget {
  const user_payment_overcooked({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
            color: Color.fromRGBO(129, 164, 205, 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          top: 10,
          left: 30,
          child: Container(
            child: Text(
              '2.',
              style: TextStyle(
                  color: Color.fromRGBO(0, 29, 74, 1),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 50,
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage('images/Image_overcooked.jpg'),
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
          top: 10,
          left: 140,
          child: Container(
            child: Text(
              'OverCooked',
              style: TextStyle(
                  color: Color.fromRGBO(0, 29, 74, 1),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w500,
                  height: 1),
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 140,
          child: Container(
            child: Text(
              '\$1 / Hour',
              style: TextStyle(
                  color: Color.fromRGBO(0, 29, 74, 1),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  height: 1),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 140,
          child: Container(
            child: Text(
              'Date',
              style: TextStyle(
                  color: Color.fromRGBO(0, 29, 74, 1),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  height: 1),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 220,
          child: Container(
              height: 17,
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(219, 228, 238, 1),
              )),
        ),
        Positioned(
          top: 52,
          left: 230,
          child: Container(
            child: Text(
              '18/2/2022-18/2/2022',
              style: TextStyle(
                  color: Color.fromRGBO(39, 71, 110, 0.6000000238418579),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 12,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: 140,
          child: Container(
            child: Text(
              'Start Time',
              style: TextStyle(
                  color: Color.fromRGBO(0, 29, 74, 1),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  height: 1),
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: 220,
          child: Container(
              height: 17,
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(219, 228, 238, 1),
              )),
        ),
        Positioned(
          top: 72,
          left: 230,
          child: Container(
            child: Text(
              '2 pm',
              style: TextStyle(
                  color: Color.fromRGBO(39, 71, 110, 0.6000000238418579),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 12,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: 140,
          child: Container(
            child: Text(
              'End Time',
              style: TextStyle(
                  color: Color.fromRGBO(0, 29, 74, 1),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  height: 1),
            ),
          ),
        ),
        Positioned(
          top: 90,
          left: 220,
          child: Container(
              height: 17,
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(219, 228, 238, 1),
              )),
        ),
        Positioned(
          top: 92,
          left: 230,
          child: Container(
            child: Text(
              '4 pm',
              style: TextStyle(
                  color: Color.fromRGBO(39, 71, 110, 0.6000000238418579),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 12,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ),
        Positioned(
          top: 110,
          left: 140,
          child: Container(
            child: Text(
              'Quantity',
              style: TextStyle(
                  color: Color.fromRGBO(0, 29, 74, 1),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 14,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w400,
                  height: 1),
            ),
          ),
        ),
        Positioned(
          top: 110,
          left: 220,
          child: Container(
              height: 17,
              width: 135,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color.fromRGBO(219, 228, 238, 1),
              )),
        ),
        Positioned(
          top: 112,
          left: 230,
          child: Container(
            child: Text(
              '2',
              style: TextStyle(
                  color: Color.fromRGBO(39, 71, 110, 0.6000000238418579),
                  fontFamily: 'SF Pro Rounded',
                  fontSize: 12,
                  letterSpacing: 0,
                  fontWeight: FontWeight.normal,
                  height: 1),
            ),
          ),
        ),
        Positioned(
            top: 145,
            left: 220,
            child: Container(
              child: Text(
                'Total             \$6',
                style: TextStyle(
                    color: Color.fromRGBO(0, 29, 74, 1),
                    fontFamily: 'SF Pro Rounded',
                    fontSize: 15,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w500,
                    height: 1),
              ),
            )),
      ],
    );
  }
}
